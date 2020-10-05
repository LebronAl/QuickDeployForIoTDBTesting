source config.sh

if [ "$1" != "np" ]; then
    cp -rf $snapshotPath .
    for ip in ${server[*]}
    do
        python3 update.py $snapshotName/conf/iotdb-cluster.properties "cluster_rpc_ip=${ip}|${clusterConfig}"
        python3 update.py $snapshotName/conf/iotdb-engine.properties $engineConfig
        tar -cvf $snapshotName.tar $snapshotName
        ssh $user@$ip "rm -rf ${serverDir};mkdir ${serverDir};"
        scp -r $snapshotName.tar $user@$ip:~/$serverDir
        ssh $user@$ip "cd ${serverDir};tar -xvf ${snapshotName}.tar;rm ${snapshotName}.tar;"
        rm $snapshotName.tar
    done 
    rm -rf $snapshotName
fi

if $execute; then
    for ip in ${server[*]}
    do
        ssh $user@$ip "cd ${serverDir}/${snapshotName};rm -rf logs;rm -rf data;mkdir logs;nohup sh sbin/start-node.sh printgc >logs/nohup.out 2>&1 &"
    done 
fi