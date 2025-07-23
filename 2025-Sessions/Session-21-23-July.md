
# Rahbia Live Coding
### Organized by DockerMe group
  - **Speaker:** [Ahmad Rafiee](https://www.linkedin.com/in/ahmad-rafiee)
  - **Date:** 23 July 2025
  - **Number of Sessions:** 21 (Session 21)

### Video Link:
[![YouTube](http://i.ytimg.com/vi/yaWouJsR_-M/hqdefault.jpg)](https://www.youtube.com/live/yaWouJsR_-M)

### 🔴 Live Coding Session 21: Backup and Restore Operations for Production PostgreSQL

In Live Coding Session 21, This Session contains Backup and Restore Operations for Production PostgreSQL.

This document outlines the procedures for backing up a production PostgreSQL database, transferring the backup to MinIO, and restoring it. It also covers the setup of dedicated MinIO accounts for secure backup management.

## 🚀 Speeding Up Operations with a Custom Runner Image
To significantly improve the speed and efficiency of our backup and restore workflows, we've created a specialized Docker image for our runners. This image is pre-configured with all necessary tools and dependencies, reducing setup time during job execution.

## 💾 Production PostgreSQL Backup and MinIO Transfer
We've established a robust process to securely back up our production PostgreSQL database and transfer it to MinIO for reliable storage.

**Connecting to Production PostgreSQL:** We connect directly to the production PostgreSQL instance to ensure data integrity and the latest backup.

**Creating a Database Backup:** A full backup of the PostgreSQL database is performed.

**Transferring Backup to MinIO:** The generated database backup file is then securely transferred and stored in our MinIO object storage.

## 📥 Downloading Backup from MinIO
To facilitate restoration or auditing, we've implemented a procedure to download backups from MinIO:

The desired backup file is retrieved directly from the MinIO bucket.

## 🔐 Dedicated MinIO Accounts for Backup Management
For enhanced security and access control, we've set up separate MinIO accounts with specific permissions for backup operations. This ensures that only authorized processes or users can perform relevant actions.

These accounts were created using:

**MinIO User Interface (UI):** For easy visual management.

**MinIO Command-Line Interface (CLI):** For scripting and automation of user creation and policy attachment.

These dedicated accounts enforce a principle of least privilege, meaning accounts for depositing backups only have write access, and accounts for retrieving backups only have read access to the relevant buckets.

#### 📌 Application Architecture
The Voting App consists of multiple microservices that handle voting, result tallying, and backend operations. Initially, the deployment was done manually, and later, we implemented CI/CD pipelines to streamline the build and test process.
The Voting App consists of the following components:

  - **Frontend**: User interface for voting
  - **Backend**: Processes voting requests
  - **Database (PostgreSQL)**: Stores vote data
  - **Queue (Redis)**: Handles request queuing
  - **Worker**: Processes voting data

#### Technologies Used

  - **Docker:** Containerization of services
  - **Ansible:** Automation of deployment
  - **GitLab CI/CD:** Pipeline implementation for build and test automation
  - **Traefik:** Reverse proxy and load balancing
  - **PostgreSQL:** Database backend
  - **Redis:** In-memory data store for caching and messaging

#### 🚀 Completed Steps

✅ Setup Development and production stage with Gitlab CI/CD

  - image scaning with trivy
  - gitlab cache 
  - load test with ab
  - gitlab image clean up policy

#### 📌 Next Steps

✅ Moving forward, we aim to complete these items and address them thoroughly:

  - add gitlab component and catalog
  - database backup test
  - update gitlab service
  - update minio service
  - update nexus service
  - update traefik service

#### 🚀 Project directory and `gitlab-ci` deployment section

```bash
cicd/monorepo-voting-app
```

**gitlab-ci file:**

```yaml
stages:
  - build
  - test
  - deploy
  - post-deploy

variables:
  VERSION: v1.0.2
  server_port: 8090
  server_user: root
  service_dir: /opt/service/voting-app

.build:
  stage: build
  image: docker:latest
  before_script:
    - docker login ${CI_REGISTRY} --username ${CI_REGISTRY_USER} --password ${CI_REGISTRY_PASSWORD}
  script:
    - cd ${service_name}
    - docker build -t ${CI_REGISTRY}/${CI_PROJECT_PATH}/${service_name}:${CI_COMMIT_SHORT_SHA} .
    - docker tag ${CI_REGISTRY}/${CI_PROJECT_PATH}/${service_name}:${CI_COMMIT_SHORT_SHA} ${CI_REGISTRY}/${CI_PROJECT_PATH}/${service_name}:${VERSION}
    - docker push ${CI_REGISTRY}/${CI_PROJECT_PATH}/${service_name}:${CI_COMMIT_SHORT_SHA}
    - docker push ${CI_REGISTRY}/${CI_PROJECT_PATH}/${service_name}:${VERSION}

.deploy:
  stage: deploy
  image: alpine:latest
  variables:
    vote_domain: vote
    result_domain: result
    traefik_domain: tra
  before_script:
    - 'command -v ssh-agent >/dev/null || ( apk add --update --no-cache openssh )'
    - eval $(ssh-agent -s)
    - chmod 400 "$SSH_PRIVATE_KEY"
    - ssh-add "$SSH_PRIVATE_KEY"
    - mkdir -p ~/.ssh
    - chmod 700 ~/.ssh
  script:
    - |
      sed -i s/IMAGE_VERSION/${VERSION}/g .env
      sed -i s/DOMIAN_ADDRESS/${main_domain}/g .env
      cat .env | grep image_version
      
      ssh -o StrictHostKeyChecking=no -p ${server_port} ${server_user}@${server_address} "
      [[ -d ${service_dir} ]] || mkdir -p ${service_dir}
      docker network ls | grep web_net || docker network create web_net
      docker network ls | grep app_net || docker network create app_net
      "

      scp -o StrictHostKeyChecking=no -P${server_port} .env ${server_user}@${server_address}:${service_dir}/
      scp -o StrictHostKeyChecking=no -P${server_port} compose.yml ${server_user}@${server_address}:${service_dir}/

      ssh -o StrictHostKeyChecking=no -p ${server_port} ${server_user}@${server_address} "
      docker login ${CI_REGISTRY} --username ${CI_REGISTRY_USER} --password ${CI_REGISTRY_PASSWORD}
      cd ${service_dir}
      docker compose pull 
      docker compose up -d
      "

.scanner:
  image:
    name: docker.io/aquasec/trivy:latest
    entrypoint: [""]
  variables:
    FULL_IMAGE_NAME: ${CI_REGISTRY}/${CI_PROJECT_PATH}/${service_name}:${VERSION}
  script:
    - trivy --version

    # Set http proxy
    - export HTTP_PROXY=http://192.168.200.1:8123
    - export HTTPS_PROXY=http://192.168.200.1:8123

    # update vulnerabilities db
    - time trivy image --download-db-only --no-progress
        --db-repository="ghcr.io/aquasecurity/trivy-db:2"
        --cache-dir /cache/

    # Unset http proxy
    - unset HTTP_PROXY
    - unset HTTPS_PROXY

    - time trivy image --exit-code 0 
        --cache-dir /cache/ --severity CRITICAL 
        --format template --template "@/contrib/gitlab.tpl" 
        --output "$CI_PROJECT_DIR/gl-container-scanning-report.json" 
        "$FULL_IMAGE_NAME"
  cache:
    paths:
      - /cache/
  artifacts:
    when: always
    reports:
      container_scanning: gl-container-scanning-report.json

build-vote-service:
  extends: .build
  variables:
    service_name: vote
  only:
    changes:
      - vote/**/*

build-worker-service:
  extends: .build
  variables:
    service_name: worker
  only:
    changes:
      - worker/**/*

build-result-service:
  extends: .build
  variables:
    service_name: result
  only:
    changes:
      - result/**/*

build-seed-service:
  extends: .build
  variables:
    service_name: seed
  only:
    changes:
      - seed/**/*

# scanning-vote-image:
#   extends: .scanner
#   variables:
#     service_name: vote
#   only:
#     changes:
#       - vote/**/*

# scanning-result-image:
#   extends: .scanner
#   variables:
#     service_name: result
#   only:
#     changes:
#       - result/**/*

# scanning-worker-image:
#   extends: .scanner
#   variables:
#     service_name: worker
#   only:
#     changes:
#       - worker/**/*

# scanning-seed-image:
#   extends: .scanner
#   variables:
#     service_name: seed
#   only:
#     changes:
#       - seed/**/*

# deploy-development:
#   extends: .deploy
#   variables:
#     main_domain: dev.app.rahbia.ir
#     server_address: 192.168.200.104
#   environment:
#     name: development
#     url: https://${vote_domain}.${main_domain}

# deploy-production:
#   extends: .deploy
#   variables:
#     main_domain: app.rahbia.ir
#     server_address: 192.168.200.105
#   environment:
#     name: production
#     url: https://${vote_domain}.${main_domain}
#   when: manual

load-test:
  stage: post-deploy
  image: ${CI_REGISTRY}/${CI_PROJECT_PATH}/seed:${VERSION}
  variables:
    vote_domain: vote
    main_domain: dev.app.rahbia.ir
    vote_service_url: https://${vote_domain}.${main_domain}/
  before_script:
    - python /seed/make-data.py
  script:
    - bash /seed/generate-votes.sh > ab-output.txt
  artifacts:
    paths:
      - ab-output.txt
    expire_in: 1 week
  when: manual

create_backup:
  stage: post-deploy
  image: reg.rahbia.mecan.ir/devops/runner-images/mc-ssh:3.22.1
  variables:
    MINIO_ALIAS_NAME: MeCan
    MINIO_ENDPOINT: https://min.rahbia.mecan.ir
    MINIO_BUCKET: voting-app-backup
    server_address: 192.168.200.105
    BACKUP_PATH: /opt/BACKUP
  before_script:
    - 'command -v ssh-agent >/dev/null || ( apk add --update --no-cache openssh )'
    - eval $(ssh-agent -s)
    - chmod 400 "$SSH_PRIVATE_KEY"
    - ssh-add "$SSH_PRIVATE_KEY"
    - mkdir -p ~/.ssh
    - chmod 700 ~/.ssh
    - mc alias set ${MINIO_ALIAS_NAME} ${MINIO_ENDPOINT} ${MINIO_CREATE_ACCESS_KEY} ${MINIO_CREATE_SECRET_KEY}
  script:
    - |
      ssh -o StrictHostKeyChecking=no -p ${server_port} ${server_user}@${server_address} "
      # Create directory if not exist
      [ -d ${BACKUP_PATH} ] || mkdir -p ${BACKUP_PATH}
      cd ${BACKUP_PATH}

      # Create postgresql backup
      docker exec -i -e PGPASSWORD=${POSTGRES_PASSWORD} db /usr/local/bin/pg_dumpall --host=localhost --port=5432 --username=${POSTGRES_USER} | gzip -9 > voting_app_postgres_backup_${CI_PIPELINE_ID}.sql.gz
      "
      # move backup file to runner
      scp -o StrictHostKeyChecking=no -P${server_port} ${server_user}@${server_address}:${BACKUP_PATH}/voting_app_postgres_backup_${CI_PIPELINE_ID}.sql.gz .
      mc put voting_app_postgres_backup_${CI_PIPELINE_ID}.sql.gz ${MINIO_ALIAS_NAME}/${MINIO_BUCKET}/
  # rules:
  #   - if: $CI_PIPELINE_SOURCE == "schedule"

check_backup:
  stage: post-deploy
  image: reg.rahbia.mecan.ir/devops/runner-images/mc-ssh:3.22.1
  needs:
    - create_backup
  variables:
    MINIO_ALIAS_NAME: MeCan
    MINIO_ENDPOINT: https://min.rahbia.mecan.ir
    MINIO_BUCKET: voting-app-backup
    BACKUP_PATH: /opt/BACKUP
  before_script:
    - 'command -v ssh-agent >/dev/null || ( apk add --update --no-cache openssh )'
    - eval $(ssh-agent -s)
    - chmod 400 "$SSH_PRIVATE_KEY"
    - ssh-add "$SSH_PRIVATE_KEY"
    - mkdir -p ~/.ssh
    - chmod 700 ~/.ssh
    - mc alias set ${MINIO_ALIAS_NAME} ${MINIO_ENDPOINT} ${MINIO_CHECK_ACCESS_KEY} ${MINIO_CHECK_SECRET_KEY}
  script:
    - |
      mc get ${MINIO_ALIAS_NAME}/${MINIO_BUCKET}/voting_app_postgres_backup_${CI_PIPELINE_ID}.sql.gz .
      ls
  # rules:
  #   - if: $CI_PIPELINE_SOURCE == "schedule"
```


### 📢 Stay tuned for the next steps! 🚀


## 🔗 Links
[![Site](https://img.shields.io/badge/Dockerme.ir-0A66C2?style=for-the-badge&logo=docker&logoColor=white)](https://dockerme.ir/)
[![YouTube](https://img.shields.io/badge/youtube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/@dockerme)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ahmad-rafiee/)
[![Telegram](https://img.shields.io/badge/telegram-0A66C2?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/dockerme)
[![Instagram](https://img.shields.io/badge/instagram-FF0000?style=for-the-badge&logo=instagram&logoColor=white)](https://instagram.com/dockerme)