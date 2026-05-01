FROM quay.io/argoproj/argocd:v3.3.9@sha256:fd8a938f3ec64bfa272d17c20a56b548a97711b92bd5b0a80a485e81bc724969

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
