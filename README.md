# KeyDB CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/keydb"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy KeyDB server with CI/CD on Elestio

<img src="keydb.jpg" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open Redis Insight UI here:

    URL: https://[CI_CD_DOMAIN]:24814
    login: "root"
    password: "[ADMIN_PASSWORD]"

# Use

You can connect to your server with any Redis client with those credentials:

    Host: [CI_CD_DOMAIN]
    Port: 23647
    Password: [ADMIN_PASSWORD]

You can also connect with any Redis client, including the official CLI:

To connect via SSL, you need to add the certificates manually. You can find them by clicking on the 'File Explorer' button in the 'Tools' tab on the platform: Here the path to find all certificates: /opt/app/data/

    With SSL: redis-cli -h [CI_CD_DOMAIN] -p 6380 --tls --cert redis.crt --key redis.key --cacert ca.crt -a '[APP_PASSWORD]'

    Without SSL: redis-cli -h [CI_CD_DOMAIN] -p 23647 -a '[ADMIN_PASSWORD]'
