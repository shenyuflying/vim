# vim
> 写代码的时候手需要时刻保持在键盘上,随机定位代码、随机删除代码、移动代码、插入代码的操作大大多于阅读、翻页操作，中间卡顿一下效率就大大降低了；vim通过其强大的快捷键，可以完全摆脱鼠标。真是编程利器。通过插件，可以实现强大的IDE的功能。可以说每一个geek都有自己的vim配置，在这里我把我的配置共享出来。

![image_1b3rg746h1dpr29dsdu74o1u4qm.png-396.6kB][1]

安装的插件有

1. 插件管理
   Vundle
2. 索引提示
   ctag             生成工程的符号文件
   cscope           生成工程符号文件引用关系
   Tagbar           右边栏显示文件中的符号
3. 自动完成
   echofunc.vim     显示函数定义
   OmniCppComplete  提示结构体成员
   SuperTab         TAB键自动完成
4. 文件浏览
   The-NERD-tree
   ctrlp.vim
5. 其他
   molokai          配色主题
   c-standard-functions-highlight  高亮C语言函数


使用方法：
1. 安装Vundle
2. 复制如下脚本到vimrc
3. 进入vim之后运行:PluginUpdate

ChangeLog
------

### add CCTree
	- F5 to load data
	- :help cctree for more info
![cctree](http://static.zybuluo.com/shenyuflying/n9ge1arlt4vbsuj5j2scm0g4/cctree.png)

[1]: http://static.zybuluo.com/shenyuflying/cj63bslrkuvv0nidd53wser8/image_1b3rg746h1dpr29dsdu74o1u4qm.png
[2]: http://static.zybuluo.com/shenyuflying/n9ge1arlt4vbsuj5j2scm0g4/cctree.png
