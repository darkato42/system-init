Import-Module posh-git -Scope Local -Force
Import-Module nvm -Scope Local -Force
oh-my-posh --init --shell pwsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/v$(oh-my-posh --version)/themes/jandedobbeleer.omp.json | Invoke-Expression
