#测试集群
server=(192.168.130.33 192.168.130.34)
#分布式集群的SEED_NODES参数
seeds="192.168.130.33:9003:40010:55560,192.168.130.34:9003:40010:55560"
#服务器用户
user="liurui"
#服务器新建的文件夹名称
serverDir="txy_test"
#打包的文件名
snapshotName="cluster-0.11.0-SNAPSHOT"
#本地的集群maven打包路径
snapshotPath="/Users/txy/Study/incubator-iotdb/cluster/target/${snapshotName}"
#测试集群的执行路径
serverPath="~/txy_test/${snapshotName}"
#从测试集群拉取得到的执行日志本地路径
localLogDir="result"
#更改iotdb-cluster.properties中的属性，用|隔开，格式为key=value，即key为参数名称，value为值的方式替代对应文件中的参数
clusterConfig="seed_nodes=${seeds}|default_replica_num=2|is_use_async_applier=true"
#更改iotdb-engine.properties中的属性，用|隔开，格式为key=value，即key为参数名称，value为值的方式替代对应文件中的参数
engineConfig=""
#是否后台启动集群
execute=true