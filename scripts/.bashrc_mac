docker-machine-env() {
    eval $(docker-machine env $1)
}

docker-machine-dns() {
    dmip=$(dm ip $1)
    dnsconf=/usr/local/etc/dnsmasq.conf
    if [ ! -e /etc/resolver/$1 ]; then
        echo "adding $1 entry to resolvers"
        sudo tee /etc/resolver/$1 >/dev/null <<EOF
nameserver 127.0.0.1
EOF
    fi
    if grep -q /$1/$dmip $dnsconf; then
        echo "correct dnsmasq entry already exists"
    elif grep -q ^address=/$1/ $dnsconf; then
        echo "hostname $1 already present in dnsmasq - updating"
        # remove line if ip already present for different hostname
        sed -i '' -E "\%^address=/[[:alnum:]_.-]+/$dmip%d" $dnsconf
        # update existing hostname with new ip
        sed -i '' -E "s%^(address=/$1)/([[:digit:].]+)$%\1/$dmip%g" $dnsconf
        dnsmasq-restart
    else
        # neither hostname nor ip are present
        echo "adding $1/$dmip entry to dnsmasq"
        echo "address=/$1/$dmip" >> /usr/local/etc/dnsmasq.conf
        dnsmasq-restart
    fi
}
docker-machine-use() {
    docker-machine start $1
    docker-machine-dns $1
    docker-machine-env $1
}

alias fig="docker-compose"
alias dms="docker-machine-use"
alias dme='docker-machine-env'
alias vmmysql="docker exec -it vm_mysql_1 mysql -uroot -pemsoft"
alias vmmongo="docker exec -it vm_mongo_1 mongo"
