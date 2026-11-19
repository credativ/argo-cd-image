FROM quay.io/argoproj/argocd:v3.6.2@sha256:bbcc3b6e79c5963439bdc5170f6e20a52365b41878133fac5ce8d6810d2641dc

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
