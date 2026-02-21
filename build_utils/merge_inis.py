import argparse
import configparser
from pathlib import Path


if __name__ == "__main__":
    parser = argparse.ArgumentParser("INI Merger")
    parser.add_argument("base", type=Path)
    parser.add_argument("override", type=Path)
    inputs = parser.parse_args()

    base = configparser.ConfigParser()
    base.optionxform = str
    base.read(inputs.base)

    override = configparser.ConfigParser()
    override.optionxform = str
    override.read(inputs.override)

    for section in override.sections():
        if not base.has_section(section):
            base.add_section(section)
        for key, value in override.items(section):
            base.set(section, key, value)

    with inputs.base.open("w") as f:
        base.write(f)
