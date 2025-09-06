@echo off
cd /d "%~dp0"
echo Starting BrowserSync for MediSetu...
browser-sync start --server --files "*"
pause
