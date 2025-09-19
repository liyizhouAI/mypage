#!/bin/bash

# 自动部署脚本 - 同步本地修改到Git和Vercel

echo "🚀 开始自动部署流程..."

# 1. 检查是否有修改
if [ -z "$(git status --porcelain)" ]; then 
    echo "📝 没有检测到新的修改"
    exit 0
fi

# 2. 添加所有修改到Git
echo "📦 添加所有修改到Git..."
git add .

# 3. 提交修改
echo "💬 请输入提交信息 (直接回车使用默认信息):"
read -r commit_message
if [ -z "$commit_message" ]; then
    commit_message="Update website content - $(date +'%Y-%m-%d %H:%M:%S')"
fi

git commit -m "$commit_message

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>"

# 4. 推送到GitHub
echo "📤 推送到GitHub..."
git push origin main

# 5. 检查推送结果
if [ $? -eq 0 ]; then
    echo "✅ GitHub推送成功！"
    
    # 6. 部署到Vercel
    echo "🌐 部署到Vercel..."
    npx vercel --prod --yes
    
    if [ $? -eq 0 ]; then
        echo "🎉 部署完成！"
        echo "📍 网站地址: https://liyizhou-portfolio-f5xjh95l0-liyizhous-projects.vercel.app"
        echo "📍 GitHub仓库: https://github.com/liyizhouAI/app-test"
    else
        echo "❌ Vercel部署失败"
        exit 1
    fi
else
    echo "❌ GitHub推送失败"
    exit 1
fi

echo "✨ 自动部署流程完成！"