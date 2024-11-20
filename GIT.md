# GIT

## GIT概念

#### 	一、初始化配置

```c
初始化配置
git config --global user.name "ZenonLi"
git config --global user.email ilizhipublic@163.com
git config --global credential.helper store // 存储配置
```

#### 	二、创建仓库

```c
git init <project-name> //创建一个新的本地仓（省略project-name在当前目录创建）
git clone <url> //克隆一个远程仓库
```

#### 	三、GIT四个区域

##### 		1、工作区(Working Directory)

```
	就是你在电脑里能看到的目录。
```

##### 		2、暂存区(stage/Index)

```
	一般存放在·git 目录下的 index 文件, 所以我们把暂存区有时也叫作索引(index)
```
##### 		3、本地仓库(Repository)

		工作区有一个隐藏目本地仓库(Repository)录·git, 这个不算工作区, 而是Git的版本库
##### 		4、远程仓库(Remote Repository)

```
	托管在远程服务器上的仓库。常用的有GitHub、GitLab、Gitee。
```

#### 	四、GIT的三种状态

##### 		1、已修改(Modified)

```
	修改了但是没有保存到暂存区的文件
```

##### 		2、已暂存(staged)

```
	修改后已经保存到暂存区的文件
```

##### 		3、已提交(Committed)

```
	把暂存区的文件提交到本地仓库
```

#### 	五、默认概念

```
    - main/master:默认主分支
    - origin:默认远程仓库
    - HEAD:指向当前分支的指针
    - HEAD^:上一个版本
    - HEAD~:上四个版本
```

#### 	六、特殊文件

```
    .git: Git仓库的元数据和对象数据库
    .gitignore: 忽略文件，不需要提交到仓库的文件
    .gitattributes: 指定文件的属性，比如换行符
    .gitkeep: 使空目录被提交到仓库
    .gitmodules: 记录子模块的信息
    .gitconfig: 记录仓库的配置信息
```

## 命令

#### 	一、添加和提交

| 代码                    | 功能                       |
| ----------------------- | -------------------------- |
| git add <file>          | 添加一个文件到仓库         |
| git add .               | 添加所有文件到仓库         |
| git commit -m "message" | 提交所有暂存区的文件到仓库 |
| git commit am "message" | 提交所有已修改的文件到仓库 |

#### 	二、分支

| 功能                                                         | 代码                          |
| ------------------------------------------------------------ | ----------------------------- |
| 查看所有本地分支，当前分支前面会有一个*，-r查看远程分支，-a查看所有分支 | git branch                    |
| 创建一个新分支                                               | git branch <branch-name>      |
| 切换到指定分支，并更新工作区                                 | git checkout <branch-name>    |
| 创建一个新分支，并切换到该分支                               | git checkout -b <branch-name> |
| 删除一个已经合并的分支                                       | git branch -d <branch-name>   |
| 删除一个分支，不管是否合并                                   | git branch -D <branch-name>   |
| 给当前的提交打上标签，通常用于版本发布                       | git tag <tag-name>            |

#### 	三、合并分支

合并分支a到分支b，-no-ff 参数表示禁用Fast forward模式，合并后的历史有分支，能看出曾经做过合并，而-ff参数表示使用Fast forward模式，合并后的历史会变成一条直线

```
	git merge --no-ff -m "message" <branch-name>
```

![合并1](GIT/合并1.png)

```
	git merge --ff -m "message" <branch-name>
```

![合并2](GIT\合并2.png)

合并&squash 所有提交到一个提交

```
	git merge --squash <branch-name>
```

#### 	四、Rebase

rebase不会产生新的提交，而是把当前分支的每一个提交都"复制"到目标分支上，然后再把当前分支指向目标分支，而merge会产生一个新的提交，这个提交有两个分支的所有修改。

Rebase操作可以把本地未push的分叉提交历史整理成直线看起来更直观。但是，如果多人协作时，不要对已经推送到远程的分支执行Rebase操作。

```
git checkout <dev>
git rebase <main>
```

![](E:\Embedded\笔记\word笔记\GIT\Rebase1.png)

#### 	五、撤销

| 代码                            | 功能                                                         |
| :------------------------------ | ------------------------------------------------------------ |
| git mv <file> <new-file>        | 移动一个文件到新的位置                                       |
| git rm <file>                   | 从工作区和暂存区中删除一个文件，然后暂存删除操作             |
| git rm --cached <file>          | 只从暂存区中删除一个文件，工作区中的文件没有变化             |
| git checkout <file> <commit-id> | 恢复一个文件到之前的版本                                     |
| git revert <commit-id>          | 创建一个新的提交，用来撤销指定的提交，后者的所有变化都将被前者抵消，<br/>并且应用到当前分支 |
| git reset --mixed <commit-id>   | 重置当前分支的HEAD为之前的某个提交，并且删除所有之后的提交。<br/>--hard 参数表示重置工作区和暂存区，<br/>-soft 参数表示重置暂存区，<br/>--mixed 参数表示 |
| git restore --staged <file>     | 散销暂存区的文件，重新放回工作区(git add的反向操作)          |

#### 	六、查看

| 代码                             | 功能                           |
| -------------------------------- | ------------------------------ |
| git status                       | 列出还未提交的新的或修改的文件 |
| git log --oneline                | 查看提交历史，--oneline 可省略 |
| git diff                         | 查看未暂存的文件更新了哪些部分 |
| git diff <commit-id> <commit-id> | 查看两个提交之间的差异         |

#### 	七、Stash

| 代码                                | 功能详述                                                     |
| ----------------------------------- | ------------------------------------------------------------ |
| git stash save "message'            | Stash操作可以把当前工作现场“储藏”起来，等以后恢复现场后继续工作。<br/>-u 参数表示把所有未跟踪的文件也一并存储，<br/>-a参数表示把所有未跟踪的文件和忽略的文件也一并存储，<br/>save参数表示存储的信息，可以不写。 |
| git stash list                      | 查看所有stash                                                |
| git stash pop                       | 恢复最近一次stash                                            |
| stash@{2}表示第三个stash，stash@{0} | 恢复指定的stash,git stash pop stash@{2}表示最近的stash       |
| git stash apply                     | 重新接受最近一次stash                                        |
| git stash drop stash@{2}            | pop 和 apply 的区别是, pop 会把 stash 内容删除,apply 不会。<br/>可以用 git stash drop 来删除 stash |
| git stash clear                     | 删除所有stash                                                |

#### 	八、远程仓库

| 代码                                      | 功能详解                                                     |
| ----------------------------------------- | ------------------------------------------------------------ |
| git remote add <remote-name> <remote-url> | 添加远程仓库                                                 |
| git remote -v                             | 查看远程仓库                                                 |
| git remote rm <remote-name>               | 删除远程仓库                                                 |
| git remote rename <old-name> <new-name>   | 重命名远程仓库                                               |
| git pull <remote-name> <branch-name>      | 从远程仓库拉取代码                                           |
| git pull                                  | fetch默认远程仓库(origin)当前分支的代码，然后合并到本地分支  |
| git pull --rebase                         | 将本地改动的代码Rebase到远程仓库最新的代码上(为了有<br/>一个干净的、线性的提交历史) |
| git push <remote-name> <branch-name>      | 推送代码到远程仓库(然后再发起pullrequest)                    |
| git fetch <remote-name>                   | 获取所有远程分支                                             |
| git branch -r                             | 查看远程分支                                                 |
| git fetch <remote-name> <branch-name>     | fetch某一个特定的远程分支                                    |

#### 	九、Git Flow

​		GitFlow 是一种流程模型，用于在 Git 上管理软件开发项目。

- 主分支(master):代表了项目的稳定版本，每个提交到主分支的代码都应该是经过测试和审核的。
- 开发分支(develop):用于日常开发。所有功能分支，发布分支和修补分支都应该从 develop 分支派生。
- 功能分支(feature):用于开发单独的功能或特性。每个功能分支应该从 develop 分支派生，并在开发完成后合并回 develop 分支。
- 发布分支(release):用于准备项目发布。发布分支应该从 develop 分支派生，并在准备好发布版本后合并回master 和 develop 分支。
- 修补分支(hotfix): 用于修复主分支上的紧急问题修补分支应该从 master 分支派生，并在修复完成后合并回 master 和 develop 分支。







