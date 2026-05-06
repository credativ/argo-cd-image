FROM quay.io/argoproj/argocd:v3.4.0@sha256:5be87aa21b327b2acb388a22a73cafd26622632cab2f6c8f21d1eec1bdff2bbb

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
