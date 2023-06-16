@echo off

set PYTHON=
set GIT=
set VENV_DIR=
set COMMANDLINE_ARGS=--enable-insecure-extension-access  --xformers --no-half-vae --no-gradio-queue 

call webui.bat
