#!/bin/bash

# 快捷同步脚本 - 一键同步到Git和Vercel

echo "🔄 快速同步中..."

# 添加所有修改
git add .

# 使用时间戳作为默认提交信息
git commit -m "Auto sync - $(date +'%Y-%m-%d %H:%M:%S')

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>"

# 推送到GitHub
git push origin main

# 部署到Vercel (跳过GitHub推送失败的情况)
if [ $? -ne 0 ]; then
    echo "⚠️  GitHub推送失败，但继续Vercel部署..."
fi
npx vercel --prod --yes --name=liyizhou-portfolio

echo "✅ 同步完成！"
echo "🌐 网站: https://liyizhou-portfolio-f5xjh95l0-liyizhous-projects.vercel.app"