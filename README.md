# LiberoSoC-Docker
Docker image for running LiberoSoC

## Required Libero install files
Under libero-installer, you should have the following files:

```shell
powerefi@powerefi-gerrit:~/workspaceLibero/libero_docker$ ls -l libero-installer/
total 4542140
-rwxr-xr-x 1 powerefi powerefi 3181186330 May 31 01:28 Libero_SoC_v11.9_Linux.bin
-rw-r--r-- 1 powerefi powerefi  993116017 Jun  2 07:43 Libero_SoC_v11_9_SP4_Lin.tar.gz
```

## License file
Request a network license from Microsemi and place it under the 'license' directory.
[Microsemi License Portal] (TODO link here)

## Build the image
Once you have the required files in place, build the image with the 'build.sh' script. On a high-end machine, it will take at least 10 minutes.

```shell
./build
```

## Running Libero
There are a couple ways you can run Libero.

### Using local display (interactive use)
Example:
```shell
docker run --net=host --env="DISPLAY" --volume="$(pwd)/license/:/root/license:rw" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --volume="$HOME/workspaceLiberoSoC:/workspace:rw" -it docker/liberosoc libero_env_wrapper.sh libero
```

### Running LiberoSoC in headless mode (Jenkins etc)
Almost the same as using your local display, just add 'xvfb-run' before calling 'libero'. Also, '--env="DISPLAY"' can be dropped.

Example:
```shell
docker run --net=host --volume="$(pwd)/license/:/root/license:rw" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --volume="$HOME/workspaceLiberoSoC:/workspace:rw" -it docker/liberosoc libero_env_wrapper.sh xvfb-run libero
```

### Setting up a docker network.
TODO: Add info here on how to setup a docker network to combile the usage of a local GUI, while specifiying the MAC address and hostname. --hostname=<hostname> --mac-address=<mac:address>


