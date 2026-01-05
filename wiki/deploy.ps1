# 设置字体颜色为绿色
Write-Host 'Generating Documents...' -ForegroundColor Green

# 安装必要的包
pip install mkdocs pymdown-extensions mkdocs-material

# 构建文档
Write-Host 'Building documents...' -ForegroundColor Green
mkdocs build

# 初始化并推送到第一个 git 仓库
Write-Host 'Initializing published git...' -ForegroundColor Green
Set-Location site
git init
git add -A
$date = Get-Date -Format 'yyyy-MM-dd'
git commit -m "$date Deployed"
Write-Host 'Pushing to XDU Forensics Wiki...' -ForegroundColor Green
git push -f https://forensics.xidian.edu.cn/git/XD-Forensics/WikiPublic.git master

# 清理站点目录
Write-Host 'Cleaning...' -ForegroundColor Green
Set-Location ..
Remove-Item -Recurse -Force site

# 推送到源 git 仓库
Write-Host 'Pushing to Source Git...' -ForegroundColor Green
git add -A
$date = Get-Date -Format 'yyyy-MM-dd'
git commit -m "$date Changed"
git push

# 完成提示
Write-Host 'Done.' -ForegroundColor Green
