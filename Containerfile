FROM quay.io/argoproj/argocd:v3.5.4@sha256:49dff79439bb38b1b942b19a113fe1fec7e6b6c671ddf9fe6a4a7c46bde0b77b

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
