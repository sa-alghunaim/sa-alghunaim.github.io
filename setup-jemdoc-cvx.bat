@echo off
setlocal
cd /d "%~dp0"

set "PYTHON=python"
python --version >nul 2>&1
if errorlevel 1 set "PYTHON=py -3"

%PYTHON% --version >nul 2>&1
if errorlevel 1 (
  echo ERROR: Python 3.11 or newer is required by jemdoc-cvx.
  echo Install Python, then run this file again.
  exit /b 1
)

echo Downloading the official jemdoc-cvx generator...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/cvxgrp/jemdoc-cvx/main/jemdoc' -OutFile 'jemdoc'"
if errorlevel 1 (
  echo.
  echo ERROR: Could not download jemdoc-cvx.
  echo Check your internet connection and run this file again.
  exit /b 1
)

echo.
echo jemdoc-cvx installed successfully.
%PYTHON% jemdoc --version
endlocal
