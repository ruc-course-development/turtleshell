FROM gcc:15.2.0

LABEL "repository"="https://github.com/ruc-course-development/turtleshell"
LABEL "homepage"="https://github.com/ruc-course-development/turtleshell"
LABEL "maintainer"="Lnk2past <Lnk2past@gmail.com>"

ENV PATH="/root/.local/bin:${PATH}"

# Install minimal runtime tools
RUN apt-get update && apt-get install -y --no-install-recommends \
        make \
        curl \
        gdb \
        git \
    && rm -rf /var/lib/apt/lists/*

# Install CMake 4.2
RUN curl -LsSf https://github.com/Kitware/CMake/releases/download/v4.2.0/cmake-4.2.0-linux-x86_64.sh \
       -o /tmp/cmake.sh \
    && bash /tmp/cmake.sh --skip-license --prefix=/usr/local \
    && rm /tmp/cmake.sh

# Install uv + Python 3.13 + conan
RUN --mount=type=bind,source=./.conan,target=/root/.conan  \
    curl -LsSf https://astral.sh/uv/install.sh | sh \
    && uv python install 3.13 \
    && uv tool install conan \
    && conan config install /root/.conan/ -tf profiles \
    && rm -rf /root/.cache/uv /root/.cache/pip

WORKDIR /root/home/turtleshell

COPY pyproject.toml pyproject.toml
