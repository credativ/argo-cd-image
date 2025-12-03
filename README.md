# Argo CD Image

Builds and push (Docker Hub and GitHub) an Argo CD custom image for `git-crypt` usage.

## When do we build?

Renovate is watching our repository and automerges every night latest Release.
Based on this image the custom image is built and pushed to Docker Hub and GitHub.

Examples for pulling:

```bash
crictl pull credativ/argocd:v3.2.1
crictl pull ghcr.io/credativ/argocd:v3.2.1
```

## Create GPG Key

If you need to create a GPG key have a look into [gpg.sh](gpg.sh) which can be used as example.
Please adjust to your needs.

## How to use?

Example for using with Argo CD Helm installation.

Create a GPG Key and add as Secret:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: argocd-gpg-keys
stringData:
  <gpg-key-id>: |-
    <gpg-private-key>
```

Adjust `repoServer` to import the GPG key to keyring.

```yaml
repoServer:
  volumes:
    - name: gpg-keys
      secret:
        defaultMode: 420
        secretName: argocd-gpg-keys
  volumeMounts:
    - mountPath: /app/config/gpg/source
      name: gpg-keys
```

For adding the key to your repository using `git-crypt` please reach out to the `git-crypt` documentation.

## Copyright

All product names, logos, and brands are property of their respective owners.

[Argo](https://argoproj.github.io) and [Argo CD](https://argoproj.github.io/cd) are trademarks of [The Linux Foundation](https://www.linuxfoundation.org).

[Docker](https://www.docker.com) is a trademark of Docker, Inc.

[GitHub](https://www.github.com) is a trademark of GitHub, Inc.

[git-crypt](https://github.com/AGWA/git-crypt) is a project by [Andrew Ayer](https://www.agwa.name/).