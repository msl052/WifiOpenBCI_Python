### WifiOpenBCI_Python

## Goal
- The goal of this repo is to allow multiple wifi synchronized streaming using OpenBCI boards.

## Repo Info
- This repo is a modification of a established repo OpenBCI_Python. The link to the repo: [OpenBCI_Python](https://github.com/openbci-archive/OpenBCI_Python)

## Initial Changes Made
- The python software library was in .py instead of the notebook format .ipynb
- Therefore, the code was manipulated into .ipynb so that it may be run by anaconda. Because of the this step, the setup.py was not necessary. This is user preference and not a necessary step.
  - Changes were made to openbci.utils files in order to be compatible with the modifications made in the notebook. The changed files will be added in the reference.
- All other requirements should stay the same as the repo.
