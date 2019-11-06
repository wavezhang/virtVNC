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
