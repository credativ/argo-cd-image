FROM quay.io/argoproj/argocd:v3.4.4@sha256:2fb3efa9eaa42382acb39c9a1485eaac7a1ad7a09e8aa7da7143ca256fa6da09

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
