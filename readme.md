本项目用于在开发环境提供docker方式的服务,包括:
  
 + mysql
 + mongo
 + redis
 
 ## 命令别名
 让别名发挥作用: 在本目录下执行:source .bashrc
   
 或者: 在~/.bashrc(linux) ~/bash_profile中执行目录下的.bashrc 
   
   
 + alias fig="docker-compose"
 + alias dms="docker-machine-use"
 + alias dme='docker-machine-env'
 + alias vmmysql="docker exec -it vm_mysql_1 mysql -uroot -pemsoft"
 + alias vmmongo="docker exec -it vm_mongo_1 mongo"
 
 ## 第一次启动
 fig up -d
 
 ## 开机启动或停止服务
 1. dms default (mac only)
 2. fig [start|stop] [mysql|mongo|ridis]
 
 ## 缺省参数
 + ip地址:mac一般为192.168.99.100, linux即为本机
 + 端口均为缺省端口
 + mysql 密码为emsoft ,缺省建立test数据库和emsoft用户名
 + mongo 无密码方式
 
 ## 常用命令

 + fig ps 查看运行中的服务(full_service_name)
 + fig logs [service-name] 查看服务的日志.
 + docker start|stop full_service_name 等同 fig start|stop service_name
 + docker exec -it full_service_name [bash|mysql|...]进入容器.
 
 ## 常见问题
 + 有多个mysql/mongo服务启动端口冲突: 用一个服务,或多个服务用不同的端口映射
 + 每个人项目服务IP地址不同,导致git冲突, 项目从环境变量或私有的配置文件中读取信息.
 + fig命令未发现yml配置文件: 到文件所在目录运行,或者使用docker命令替代运行.
 