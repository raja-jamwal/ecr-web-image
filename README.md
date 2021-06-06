# Push Dockerimage to AWS ECR

- Create docker repository on ECR, lets say. `ecr-web-image` on https://console.aws.amazon.com/ecr/repositories?region=us-east-1.

- Add secrets in your repository.

```
AWS_ACCESS_KEY_ID: <AWS_ACCESS_KEY_ID>
AWS_SECRET_ACCESS_KEY: <AWS_SECRET_ACCESS_KEY>
```

- Specify ECR_REPOSITORY_NAME in `.github/workflows/docker-image.yml`. In this case, `ecr-web-image`.

```
- name: Build, tag, and push image to Amazon ECR
    env:
        ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}
        ECR_REPOSITORY: ecr-web-image
        IMAGE_TAG: ${{ github.sha }}
```
- For every commit to master, a new docker image tagged with git sha of commit will be pushed to ECR.
