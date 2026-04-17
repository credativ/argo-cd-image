FROM quay.io/argoproj/argocd:v3.3.7@sha256:31f494ef5ad17b8dfd4e03fbae79c57cfadede325ed16a1794ee9ce20ca5d759

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
