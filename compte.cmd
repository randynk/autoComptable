@echo off
if exist soldes.txt (
    julia comptes.jl
) else (
    md ofoe4534opzaeu12
    julia comptes.jl
)
pause
