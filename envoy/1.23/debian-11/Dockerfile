FROM envoyproxy/envoy:v1.23.1 as builder

FROM docker.io/bitnami/minideb:bullseye

ARG TARGETARCH

LABEL org.opencontainers.image.authors="https://bitnami.com/contact" \
      org.opencontainers.image.description="Application packaged by Bitnami" \
      org.opencontainers.image.ref.name="1.23.2-debian-11-r11" \
      org.opencontainers.image.source="https://github.com/bitnami/containers/tree/main/bitnami/envoy" \
      org.opencontainers.image.title="envoy" \
      org.opencontainers.image.vendor="VMware, Inc." \
      org.opencontainers.image.version="1.23.2"

ENV HOME="/" \
    OS_ARCH="${TARGETARCH:-amd64}" \
    OS_FLAVOUR="debian-11" \
    OS_NAME="linux"

COPY prebuildfs /
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Install required system packages and dependencies
RUN install_packages ca-certificates curl procps
RUN apt-get autoremove --purge -y curl && \
    apt-get update && apt-get upgrade -y && \
    apt-get clean && rm -rf /var/lib/apt/lists /var/cache/apt/archives
COPY --from=builder /usr/local/bin/envoy /opt/bitnami/envoy/bin/envoy
RUN chmod g+rwX /opt/bitnami

ENV APP_VERSION="1.23.2" \
    BITNAMI_APP_NAME="envoy" \
    PATH="/opt/bitnami/envoy/bin:$PATH"

USER 1001
ENTRYPOINT [ "/opt/bitnami/envoy/bin/envoy" ]
CMD [ "-c", "/opt/bitnami/envoy/conf/envoy.yaml" ]
