FROM quay.io/argoproj/argocd:v3.5.7@sha256:16df57da6f223808d204cd94c67c929b931fa01670b91b0b3a2298c4647de0db

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
