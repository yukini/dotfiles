@echo off
setlocal
set REPO=%~dp0

mklink %HOME%\.vimrc       %REPO%\.vimrc
mklink %HOME%\.gvimrc      %REPO%\.gvimrc
mklink %HOME%\.ideavimrc   %REPO%\.ideavimrc
mklink %HOME%\.spacemacs   %REPO%\.spacemacs
mklink %HOME%\.tern-config %REPO%\.tern-config

endlocal