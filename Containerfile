FROM quay.io/argoproj/argocd:v3.3.6@sha256:16b92ba472fbb9287459cc52e0ecff07288dff461209955098edb56ce866fe49

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
