FROM docker.io/bitnami/kubectl:1.29.0
ADD static /static
CMD ["proxy", "--www=/static", "--accept-hosts=^.*$", "--address=[::]", "--api-prefix=/kv-novnc/k8s/", "--www-prefix=/kv-novnc/"]
