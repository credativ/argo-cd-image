FROM quay.io/argoproj/argocd:v3.5.1@sha256:0deb1a1c917629b960ead995ae3b6069450a866992676599658687ef9a641ee8

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
