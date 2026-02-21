FROM gcc:15.2.0

LABEL "repository"="https://github.com/ruc-course-development/turtleshell"
LABEL "homepage"="https://github.com/ruc-course-development/turtleshell"
LABEL "maintainer"="Lnk2past <Lnk2past@gmail.com>"

ARG TARGETARCH

ENV PATH="/root/.local/bin:${PATH}"

# Install minimal runtime tools
RUN apt-get update && apt-get install -y --no-install-recommends \
        make \
        curl \
        gdb \
        git \
        valgrind \
    && rm -rf /var/lib/apt/lists/*

# Install CMake 4.2
RUN set -eux; \
    case "${TARGETARCH}" in \
      amd64)  CMAKE_ARCH="x86_64" ;; \
      arm64)  CMAKE_ARCH="aarch64" ;; \
      *) echo "Unsupported arch: ${TARGETARCH}" && exit 1 ;; \
    esac; \
    curl -LsSf https://github.com/Kitware/CMake/releases/download/v4.2.0/cmake-4.2.0-linux-${CMAKE_ARCH}.sh \
      -o /tmp/cmake.sh; \
    bash /tmp/cmake.sh --skip-license --prefix=/usr/local; \
    rm /tmp/cmake.sh

# Install uv + Python 3.13 + conan
RUN --mount=type=bind,source=./.conan,target=/root/.conan \
    --mount=type=bind,source=./build_utils,target=./build_utils \
    curl -LsSf https://astral.sh/uv/install.sh | sh \
    && uv python install 3.13 \
    && uv tool install conan \
    && conan profile detect --force \
    && uv run python build_utils/merge_inis.py /root/.conan2/profiles/default /root/.conan/base \
    && rm -rf /root/.cache/uv /root/.cache/pip

WORKDIR /root/home/turtleshell

COPY pyproject.toml pyproject.toml
