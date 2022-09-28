#解压后有三个文件：autoInstallMysql.sh   ex.exp   readme.txt  
执行时./autoInstallMysql.sh  即可
注意：
1.ex.exp文件需要放置在/opt目录下，否则无法自动初始化root密码，且无法开启远程连接权限
2.解压后，需赋予autoInstallMysql.sh文件可执行权限 执行命令：chmod 777 autoInstallMysql.sh
3.报  bash^M  错误时，需 vim  <file>    : set ff=unix 解决问题，两个文件均需执行
4.mysql的root用户密码会被初始化为：xxxxxx
