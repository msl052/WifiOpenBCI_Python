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

## How to Run the Code
In order to stream from multiple OpenBCI boards, you must open lsl_stream per number of board. For example, if streaming from two boards, you would open lsl_stream and lsl_stream2 and run both. The repo initially has lsl_stream for 2 boards. If you wish to stream more, than create more lsl_stream.ipynb and adjust parameters in each notebook accordingly.

## Lab Recorder
The lsl streaming was recorded using [Lab Recorder App](https://github.com/labstreaminglayer/App-LabRecorder/releases).

## Analyze Code
The lsl stream recorded using Lab Recorder should be an .xdf file. It can be analyzed using pyxdf_read.ipynb.

