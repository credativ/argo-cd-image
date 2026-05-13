FROM quay.io/argoproj/argocd:v3.4.2@sha256:c612d570cb6d6ff29afb72932c1bfe98a1ecc234df50f8ea4873fb7066e760fc

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
