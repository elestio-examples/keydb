# KeyDB CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/keydb"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy KeyDB server with CI/CD on Elestio

<img src="keydb.png" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open Redis Insight UI here:

    URL: https://[CI_CD_DOMAIN]:24814
    login: "root"
    password: "[ADMIN_PASSWORD]"

# Use

You can connect to your server with any Redis client with those credentials:

    Host: [DOMAIN]
    Port: 23647
    Password: [ADMIN_PASSWORD]

You can also connect with any Redis client, including the official CLI:

    redis-cli -h [DOMAIN] -p 23647 -a '[ADMIN_PASSWORD]'
