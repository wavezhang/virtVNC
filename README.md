# kubevirt-novnc

> [!NOTE]
> This repository was forked on 2024-01-05 directly from [wavezhang/virtVNC](https://github.com/wavezhang/virtVNC) as of commit [0fe6d5a](https://github.com/wavezhang/virtVNC/commit/0fe6d5a1ffdf9aed88dbd507f7b43a4cac5d343d).

Since 2024-01-05, the following enhancements have been made to the original fork:

  - Bumped [`bitnami/kubectl`](https://hub.docker.com/r/bitnami/kubectl) base image to `1.29.0`
  - Bumped [`noVNC`](https://github.com/novnc/noVNC/tree/master/app) to `1.4.0` <small>(contents in [`/app`](app))</small>
  - Changed Service `NodePort` to `ClusterIP` ... thus intentionally removing access to `8001/tcp` from outside the k8s cluster
  - Added IngressRoute with Basic HTTP-Auth using [Traefik MiddleWares](https://doc.traefik.io/traefik/middlewares/http/basicauth/)
  - Added basic CSS styling using [Bootstrap v5.3](https://getbootstrap.com/docs/5.3) for aesthetics 
  - Changed k8s definitions from `virtvnc` to `kv-novnc` in effort to avoid confusion amongst the various forks of the original [wavezhang/virtVNC](https://github.com/wavezhang/virtVNC) project

> [!WARNING]
> The software in this repository is provided "as is" with absolutely no guarantees or warranties. MIT License below applies.

# MIT License
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:

> The above copyright notice and this permission notice shall be included in all
> copies or substantial portions of the Software.

> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> SOFTWARE.

---

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
