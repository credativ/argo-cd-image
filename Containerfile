FROM quay.io/argoproj/argocd:v3.3.1@sha256:3bfe58c706d762acf5da17e8ba4a0e2c6c27374db3275ef628b11184f7b9fab2

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
