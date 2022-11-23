cd contour/1.22/debian-11
docker buildx build --push --platform linux/amd64,linux/arm64 --tag release.daocloud.io/contour/contour:1.22.0-debian-11-r4 .

cd envoy/1.23/debian-11
docker buildx build --push --platform linux/amd64,linux/arm64 --tag release.daocloud.io/contour/envoy:1.23.0-debian-11-r8 .