# kubevirt-novnc

> [!NOTE]
> This repository was forked on 2024-01-05 directly from [wavezhang/virtVNC](https://github.com/wavezhang/virtVNC) as of commit [0fe6d5a](https://github.com/wavezhang/virtVNC/commit/0fe6d5a1ffdf9aed88dbd507f7b43a4cac5d343d).

Since 2024-01-05, the following enhancements have been made to the original fork:

  - Bumped [`bitnami/kubectl`](https://hub.docker.com/r/bitnami/kubectl) base image to `1.29.0`
  - Bumped [`noVNC`](https://github.com/novnc/noVNC/tree/master/app) to `1.4.0` <small>(contents in [`/app`](app))</small>
  - Changed Service `NodePort` to `ClusterIP` ... thus intentionally removing access to `8001/tcp` from outside the k8s cluster
  - Added IngressRoute with Basic HTTP-Auth using [Traefik MiddleWares](https://doc.traefik.io/traefik/middlewares/http/basicauth/)
  - Added basic CSS styling using 
  - Changed k8s definitions from `virtvnc` to `kv-novnc` in effort to avoid confusion amongst the various forks of the original [wavezhang/virtVNC](https://github.com/wavezhang/virtVNC) project

> [!WARNING]
> The software in this repository is provided "as is" with absolutely no guarantees or warranties. [MIT License](LICENSE.md) applies.


# Deployment Example

## Prerequisites

This deployment example assumes the following:

  - Kubevirt installed in namespace `kubevirt`
  - Traefik installed in namespace `traefik`
  - Traefik `websecure` ingress endpoint exists

## Steps
1. Download the `kv-novnc.yaml` manifest 
```bash
wget https://raw.githubusercontent.com/scog/kubevirt-novnc/main/k8s/kv-novnc.yaml
```

2. Edit `kv-novnc.yaml` and modify the default variables:
```bash
vim kv-novnc.yaml

---
  data:
    username: c29tZXVzZXI=    # default value: someuser (base64 encoded)
    password: c29tZXBhc3M=    # default value: somepass (base64 encoded)
---
  routes:
    - match: "Host(`kv-novnc.localhost`)"    # Set desired hostname
      kind: Rule
---
```

3. Deploy the `kv-novnc.yaml` manifest:
```bash
kubectl apply -f kv-novnc.yaml
```

4. Navigate to the hostname configured in `Host()` above... along with `?namespace=` URI parameter. For example:
```bash
https://kv-novnc.localhost/?namespace=kubevirt
```

## Container Images

Pre-built container images are available here: https://github.com/users/scog/packages/container/package/kubevirt-novnc

## Example Screenshot

![screenshot](https://raw.githubusercontent.com/scog/kubevirt-novnc/main/example.png)

# virtVNC

[noVNC](https://github.com/novnc/noVNC) for [kubevirt](https://github.com/kubevirt/kubevirt)

## Deploy

```bash
kubectl apply -f https://github.com/wavezhang/virtVNC/raw/master/k8s/virtvnc.yaml
```

## Usage

1. Get node port of ```virtvnc``` service
```bash
kubectl get svc -n kubevirt virtvnc
```
2. Visit following url in browser
```
http://NODEIP:NODEPORT/
```

If you want manager virtual machines in other namespace, you can specify namespace using query param namespace like following:
```
http://NODEIP:NODEPORT/?namespace=test
```
![virtVNC](https://github.com/wavezhang/virtVNC/blob/master/virtvnc.gif?raw=true)
