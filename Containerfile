FROM quay.io/argoproj/argocd:v3.3.2@sha256:5882f28f7aaeaac397949c4511fdc1ad66c1260af44166ccf7e57aca3d7b9797

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
