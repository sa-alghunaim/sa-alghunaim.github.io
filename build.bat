@echo off
setlocal
cd /d "%~dp0"

set "PYTHON=python"
python --version >nul 2>&1
if errorlevel 1 set "PYTHON=py -3"

if not exist jemdoc (
  call setup-jemdoc-cvx.bat
  if errorlevel 1 exit /b 1
)

echo Building website with jemdoc-cvx...
%PYTHON% jemdoc -c jemdoc-cvx.conf ^
  index.jemdoc ^
  teaching.jemdoc ^
  bio.jemdoc ^
  people.jemdoc ^
  publications.jemdoc ^
  slides\slides.jemdoc ^
  courses\ee312\ee312.jemdoc ^
  courses\engr308\engr308.jemdoc ^
  courses\engr504\engr504.jemdoc ^
  courses\engr507\engr507.jemdoc

if errorlevel 1 (
  echo.
  echo BUILD FAILED.
  exit /b 1
)

echo.
echo Build complete. Open index.html to preview the site.
endlocal
