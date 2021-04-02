# Connect to Remote Docker Host via SSH

***Important: in order for this to work, you must install `ssh-askpass` on both docker host and client***

```bash
# On Debian system use
$ sudo apt install -y ssh-askpass
# On Rehl systems use
$ sudo yum install -y openssh-askpass
```

---

## Use SSH to protect the Docker daemon socket

*Note: The given `USERNAME` must have permissions to access the docker socket on the remote machine. Refer to [manage Docker as a non-root user](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user) to learn how to give a non-root user access to the docker socket.*

```bash
$  docker context create \
    --docker host=ssh://< USERNAME >@docker-host.example.com \
    --description="Remote engine description" \
    my-remote-engine
    
my-remote-engine-name
Successfully created context "my-remote-engine"
```

After creating the context, use docker context use to switch the docker CLI to use it, and to connect to the remote engine:

```bash
$ docker context use my-remote-engine

my-remote-engine
Current context is now "my-remote-engine"

$ docker info
# Enter the password of your remote docker engine on the first context use
<prints output of the remote engine>
```

### ***SSH Tips***

For the best user experience with SSH, configure ~/.ssh/config as follows to allow reusing a SSH connection for multiple invocations of the docker CLI:

***Create or add the below to your ~/.ssh/config file***

```config
ControlMaster     auto
ControlPath       ~/.ssh/control-%C
ControlPersist    yes
```

You should be able to query docker daemon on remote host

```bash
$ docker ps
<prints output from remote docker host>
```

---
