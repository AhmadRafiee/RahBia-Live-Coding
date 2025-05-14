
# Rahbia Live Coding
### Organized by DockerMe group
  - **Speaker:** [Ahmad Rafiee](https://www.linkedin.com/in/ahmad-rafiee)
  - **Date:** 13 May 2025
  - **Number of Sessions:** 18 (Session 18)

### Video Link:
[![YouTube](http://i.ytimg.com/vi/Sp5z2zhXRbs/hqdefault.jpg)](https://www.youtube.com/live/Sp5z2zhXRbs)

### 🔴 Live Coding Session 18: Voting App Deployment on Docker with gitlab CI/CD

In Live Coding Session 18, This Session contains the deployment process of the Voting App using CI/CD method, deploy to development stage.

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

variables:
  VERSION: v1.0.2
  server_port: 8090
  server_user: root
  service_dir: /opt/service/voting-app
  image_directory: devops/monorepo-voting-app

.build:
  stage: build
  image: docker:latest
  before_script:
    - docker login ${CI_REGISTRY} --username ${CI_REGISTRY_USER} --password ${CI_REGISTRY_PASSWORD}
  script:
    - cd ${service_name}
    - docker build -t ${CI_REGISTRY}/${image_directory}/${service_name}:${CI_COMMIT_SHORT_SHA} .
    - docker tag ${CI_REGISTRY}/${image_directory}/${service_name}:${CI_COMMIT_SHORT_SHA} ${CI_REGISTRY}/${image_directory}/${service_name}:${VERSION}
    - docker push ${CI_REGISTRY}/${image_directory}/${service_name}:${CI_COMMIT_SHORT_SHA}
    - docker push ${CI_REGISTRY}/${image_directory}/${service_name}:${VERSION}

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

scanning-vote-image:
  image:
    name: docker.io/aquasec/trivy:latest
    entrypoint: [""]
  # needs: ["build-vote-service"]
  variables:
    service_name: vote
    FULL_IMAGE_NAME: ${CI_REGISTRY}/${image_directory}/${service_name}:${VERSION}
  script:
    - trivy --version
    - trivy clean --all --cache-dir .trivycache/
    # update vulnerabilities db
    - time trivy image --download-db-only 
        --db-repository=ghcr.io/aquasecurity/trivy-db:2 
        --no-progress 
        --cache-dir .trivycache/

    - time trivy --exit-code 0 --cache-dir .trivycache/ \
        --no-progress --format template --template "@/contrib/gitlab.tpl" \
        --output "$CI_PROJECT_DIR/gl-container-scanning-report.json" "$FULL_IMAGE_NAME"
    - time trivy --exit-code 0 --cache-dir .trivycache/ --no-progress "$FULL_IMAGE_NAME"
    - time trivy --exit-code 1 --cache-dir .trivycache/ --severity CRITICAL --no-progress "$FULL_IMAGE_NAME"
  cache:
    paths:
      - .trivycache/
  artifacts:
    when: always
    reports:
      container_scanning: gl-container-scanning-report.json
  # only:
  #   changes:
  #     - vote/**/*

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
```


✅ Setup Development and production stage with Gitlab CI/CD


#### Deployment Steps

  1. CI/CD Implementation
    - Automated service deployment using gitlab CI/CD.


#### 🚀 Completed Steps

✅ Setup Development and production stage with Gitlab CI/CD

  - deploy to production
  - modify deploy stage
  - modify buils stage
  - pipeline efficiency
  - add container scanning

#### 📌 Next Steps

Moving forward, we aim to complete these items and address them thoroughly:
  - container scanning with trivy
  - add gitlab component and catalog
  - add load test scenario
  - create backup from database 
  - move backup to object storage
  - database backup test
  - gitlab image clean up policy
  - check gitlab backup

### 📢 Stay tuned for the next steps! 🚀


## 🔗 Links
[![Site](https://img.shields.io/badge/Dockerme.ir-0A66C2?style=for-the-badge&logo=docker&logoColor=white)](https://dockerme.ir/)
[![YouTube](https://img.shields.io/badge/youtube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/@dockerme)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ahmad-rafiee/)
[![Telegram](https://img.shields.io/badge/telegram-0A66C2?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/dockerme)
[![Instagram](https://img.shields.io/badge/instagram-FF0000?style=for-the-badge&logo=instagram&logoColor=white)](https://instagram.com/dockerme)