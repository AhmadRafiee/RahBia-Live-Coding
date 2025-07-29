
# Rahbia Live Coding

- [Rahbia Live Coding](#rahbia-live-coding)
  - [Organized by DockerMe group](#organized-by-dockerme-group)
  - [Video Link:](#video-link)
  - [🔴 Live Coding Session 22: Restore Backup, and Database Backup Verification Report](#-live-coding-session-22-restore-backup-and-database-backup-verification-report)
  - [🚀 Speeding Up Operations with a Custom Runner Image](#-speeding-up-operations-with-a-custom-runner-image)
  - [💾 Production PostgreSQL Backup and MinIO Transfer](#-production-postgresql-backup-and-minio-transfer)
  - [📥 Downloading Backup from MinIO](#-downloading-backup-from-minio)
  - [Test PostgreSQL Container Setup](#test-postgresql-container-setup)
  - [Backup Restoration](#backup-restoration)
  - [Data Validation: Vote Count Retrieval](#data-validation-vote-count-retrieval)
  - [Backup Health Report Generation](#backup-health-report-generation)
  - [Environment Cleanup](#environment-cleanup)
  - [📌 Application Architecture](#-application-architecture)
  - [🚀 Technologies Used](#-technologies-used)
  - [📌 Next Steps](#-next-steps)
  - [🚀 Project directory and `gitlab-ci` deployment section](#-project-directory-and-gitlab-ci-deployment-section)
  - [🔗 Stay connected with DockerMe! 🚀](#-stay-connected-with-dockerme-)


## Organized by DockerMe group
  - **Speaker:** [Ahmad Rafiee](https://www.linkedin.com/in/ahmad-rafiee)
  - **Date:** 30 July 2025
  - **Number of Sessions:** 22 (Session 22)

## Video Link:
[![YouTube](http://i.ytimg.com/vi/rhCkf4hCPEA/hqdefault.jpg)](https://www.youtube.com/live/rhCkf4hCPEA)

## 🔴 Live Coding Session 22: Restore Backup, and Database Backup Verification Report

In Live Coding Session 22, This Session contains Restore and Check Operations for Production PostgreSQL Backup.

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


## Test PostgreSQL Container Setup
First, we spun up a test PostgreSQL container to provide an isolated and safe environment for our verification process. This ensures that our operations don't interfere with any production systems.

## Backup Restoration
Next, the database backup was successfully restored within this temporary PostgreSQL container. This step is crucial for confirming that the backup data is complete and can be fully recovered.

## Data Validation: Vote Count Retrieval
After restoration, we executed specific queries against the restored database. Our primary focus was to retrieve the vote counts to validate the data's accuracy and integrity. This step confirms that the critical data from the backup is correct.

## Backup Health Report Generation
Upon successful data validation, we prepared a comprehensive report on the health and consistency of our backup. This report includes:

* **Restoration Status:** Confirmation that the database was restored without issues.

* **Data Integrity:** Verification of key data points, including the accurate vote counts.


## Environment Cleanup
Finally, once the verification process and report generation were complete, the entire temporary PostgreSQL container and all associated resources were thoroughly cleaned up. This ensures we don't leave any unnecessary resources running and maintains a tidy workspace.

## 📌 Application Architecture
The Voting App consists of multiple microservices that handle voting, result tallying, and backend operations. Initially, the deployment was done manually, and later, we implemented CI/CD pipelines to streamline the build and test process.
The Voting App consists of the following components:

  - **Frontend**: User interface for voting
  - **Backend**: Processes voting requests
  - **Database (PostgreSQL)**: Stores vote data
  - **Queue (Redis)**: Handles request queuing
  - **Worker**: Processes voting data

## 🚀 Technologies Used

  - **Docker:** Containerization of services
  - **GitLab CI/CD:** Pipeline implementation for build and test automation
  - **Traefik:** Reverse proxy and load balancing
  - **PostgreSQL:** Database backend
  - **Redis:** In-memory data store for caching and messaging

## 📌 Next Steps

✅ Moving forward, we aim to complete these items and address them thoroughly:

  - add gitlab component and catalog
  - encrypt and decrypt psql backup
  - check gitlab backup
  - update gitlab service
  - update minio service
  - update nexus service
  - update traefik service

## 🚀 Project directory and `gitlab-ci` deployment section

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
  - backup

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
  except:
    - schedule

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
  except:
    - schedule

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
  except:
    - schedule

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

deploy-development:
  extends: .deploy
  variables:
    main_domain: dev.app.rahbia.ir
    server_address: 192.168.200.104
  environment:
    name: development
    url: https://${vote_domain}.${main_domain}

deploy-production:
  extends: .deploy
  variables:
    main_domain: app.rahbia.ir
    server_address: 192.168.200.105
  environment:
    name: production
    url: https://${vote_domain}.${main_domain}
  when: manual

load-test-development:
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
  except:
    - schedule

load-test-production:
  stage: post-deploy
  image: ${CI_REGISTRY}/${CI_PROJECT_PATH}/seed:${VERSION}
  variables:
    vote_domain: vote
    main_domain: app.rahbia.ir
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
  except:
    - schedule

create_backup:
  stage: backup
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
  rules:
    - if: $CI_PIPELINE_SOURCE == "schedule"

check_backup:
  stage: backup
  image: reg.rahbia.mecan.ir/devops/runner-images/mc-docker:28.3.3
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
      # get backup from minio and extract backup
      mc get ${MINIO_ALIAS_NAME}/${MINIO_BUCKET}/voting_app_postgres_backup_${CI_PIPELINE_ID}.sql.gz .
      gunzip voting_app_postgres_backup_${CI_PIPELINE_ID}.sql.gz

      # run test psql contianer and check is ready
      docker run -d --name psql-test -v db_test_data:/var/lib/postgresql/data -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres postgres:15-alpine
      sleep 5

      docker exec -i psql-test pg_isready -U ${POSTGRES_USER}
      echo "Waiting for PostgreSQL in container psql-test to be ready..."
      retry_count=0
      until docker exec -i psql-test pg_isready -U "${POSTGRES_USER}" > /dev/null 2>&1; do
        retry_count=$((retry_count + 1))
        sleep 1
        echo "PostgreSQL is not yet ready. Retrying in $SLEEP_INTERVAL seconds (attempt $retry_count/$MAX_RETRIES)..."
      done
      echo "PostgreSQL in container psql-test is now ready!"

      # restore psql backup
      cat voting_app_postgres_backup_${CI_PIPELINE_ID}.sql | docker exec -i -e POSTGRES_USER=postgres psql-test psql -U postgres

      # check vote counts
      VOTE_NUMBERS=$(docker exec -i -e POSTGRES_USER=postgres psql-test psql -U postgres -d postgres -c "SELECT COUNT(*) FROM votes;")
      CLEAN_VOTE_NUMBERS=$(echo $VOTE_NUMBERS | cut -d " " -f3) 
      [[ $CLEAN_VOTE_NUMBERS -gt '157' ]] && echo "Backup is Correct" || echo "Backup is not ok"

      # create report
      echo "Vote_Numbers: $CLEAN_VOTE_NUMBERS" > check_backup_report_${CI_PIPELINE_ID}.txt
      echo "Pipeline_ID: ${CI_PIPELINE_ID}" >> check_backup_report_${CI_PIPELINE_ID}.txt
  after_script:
    - docker rm -f psql-test
    - docker volume rm db_test_data
  artifacts:
    paths:
      - ./check_backup_report_${CI_PIPELINE_ID}.txt
    expire_in: 1 week
  rules:
    - if: $CI_PIPELINE_SOURCE == "schedule"
```

## 🔗 Stay connected with DockerMe! 🚀

**Subscribe to our channels, leave a comment, and drop a like to support our content. Your engagement helps us create more valuable DevOps and cloud content!** 🙌

[![Site](https://img.shields.io/badge/Dockerme.ir-0A66C2?style=for-the-badge&logo=docker&logoColor=white)](https://dockerme.ir/) [![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ahmad-rafiee/) [![Telegram](https://img.shields.io/badge/telegram-0A66C2?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/dockerme) [![YouTube](https://img.shields.io/badge/youtube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/@dockerme) [![Instagram](https://img.shields.io/badge/instagram-FF0000?style=for-the-badge&logo=instagram&logoColor=white)](https://instagram.com/dockerme)