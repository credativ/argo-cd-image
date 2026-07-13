FROM quay.io/argoproj/argocd:v3.5.0-rc2@sha256:0e565d79b247121891c5e2b896e4845cb09c1cf89876dbfee6b2fb5c18b80d1a

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
