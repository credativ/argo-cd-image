FROM quay.io/argoproj/argocd:v3.3.8@sha256:5d45dc6db21db32a0638ac9128462c6d9956a90fc81760146dada5a243ff7516

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
