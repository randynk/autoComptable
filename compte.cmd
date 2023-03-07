@echo off
if exist ofoe4534opzaeu12\mlbshye (
    julia comptes.jl
) else (
    md ofoe4534opzaeu12
    julia comptes.jl
)
echo tapez une touche pour quitter
pause > nul
