

echo "======build_config start======"

POD_SOURCE_NAME="WeChatPaySDK"

# 获取当前版本号
OLD_BUILD_VERSION=`grep -E 's.version.*=' ./${POD_SOURCE_NAME}.podspec | tr -d "'a-z= " | sed "s/\.//1"`
# 自增加1
declare -a part=( ${OLD_BUILD_VERSION//\./ } )

declare -i carry=1
CNTR=${#part[@]}-1
len=${#part[CNTR]}
new=$((part[CNTR]+carry))
part[CNTR]=${new}
build_version="${part[*]}"
echo "new version is: ${build_version// /.}"
# 同步修改podspec里的版本号
echo "最新版本:${build_version// /.}"
new="${build_version// /.}"
sed -i.bak "s/s.version *= *'[0-9.]*'/s.version = '${new}'/" "./${POD_SOURCE_NAME}.podspec"


echo "======commit meessage======"
git add .
git commit -m "auto-commit meessage> ${build_version} by shell"
git push
if [ $? -eq 0 ]; then
  echo "代码提交并推送成功。"
else
  echo "错误: 推送失败，请检查你的网络连接和远程仓库配置。"
fi
echo "======commit meessage======"


echo "======commit tag======"
tag_name="${build_version// /.}"
echo "Creating tag: $tag_name"

git tag -m "[feat]$tag_name" -a ${tag_name}
git push --tags 
echo "======commit tag======"


echo "======rebase======"

# read -p "请输入你想rebase的目标分支名称: " TARGET_BRANCH

# # 1=========检查用户是否输入了内容
# if [ -z "$TARGET_BRANCH" ]; then
#   echo "错误: 你必须输入一个分支名称。"
#   exit 1
# fi

# # 打印输入的分支名称
# echo "你输入的分支名称是: $TARGET_BRANCH"

TARGET_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# 2========切换到master分支
echo "切换到master分支..."
git checkout master
if [ $? -ne 0 ]; then
  echo "错误: 切换到master分支失败。"
  exit 1
fi


# 3=========对指定的目标分支进行rebase
echo "正在rebase分支$TARGET_BRANCH到master..."
git rebase $TARGET_BRANCH
if [ $? -ne 0 ]; then
  echo "错误: rebase分支$TARGET_BRANCH到master失败。"
  exit 1
fi


# 4=========提交rebase的更改
echo "推送rebase的更改到远程仓库..."
git push --force
if [ $? -ne 0 ]; then
  echo "错误: 推送更改到远程仓库失败。"
  exit 1
fi

echo "======rebase end======"

echo "======build_config end======"
