
# Rahbia Live Coding

- [Rahbia Live Coding](#rahbia-live-coding)
  - [Organized by DockerMe group](#organized-by-dockerme-group)
  - [Video Link:](#video-link)
  - [🔴 Live Coding Session 26: Create CI/CD multi-repo project](#-live-coding-session-26-create-cicd-multi-repo-project)
  - [HLD Design](#hld-design)
  - [Pipeline box from result project (downstream)](#pipeline-box-from-result-project-downstream)
  - [Pipeline box from devops project (upstream)](#pipeline-box-from-devops-project-upstream)
  - [Pipeline and CI/CD](#pipeline-and-cicd)
  - [📌 Next Steps](#-next-steps)
  - [🔗 Stay connected with DockerMe! 🚀](#-stay-connected-with-dockerme-)


## Organized by DockerMe group
  - **Speaker:** [Ahmad Rafiee](https://www.linkedin.com/in/ahmad-rafiee)
  - **Date:** 26 August 2025
  - **Number of Sessions:** 26 (Session 26)

## Video Link:
[![YouTube](http://i.ytimg.com/vi/9AnKATPlUpU/hqdefault.jpg)](https://www.youtube.com/live/9AnKATPlUpU)

## 🔴 Live Coding Session 26: Create CI/CD multi-repo project

In Live Coding Session 26, This Session contains create CI/CD multi-repo project 

## HLD Design
![HLD](../images/Multi-repo-CICD.png)

## Pipeline box from result project (downstream)
![downstream](../images/multi-repo-cicd-downstream.png)

## Pipeline box from devops project (upstream)
![upstream](../images/multi-repo-cicd-upstream.png)

## Pipeline and CI/CD
all pipeline in `cicd/multirepo-voting-app` folder

```bash
.
├── devops-service
│   ├── compose.yml
│   ├── .env
│   └── .gitlab-ci.yml
├── result-service
│   ├── docker-compose.test.yml
│   ├── Dockerfile
│   ├── .gitlab-ci.yml
│   ├── package.json
│   ├── package-lock.json
│   ├── server.js
│   ├── tests
│   └── views
├── seed-service
│   ├── Dockerfile
│   ├── generate-votes.sh
│   ├── .gitlab-ci.yml
│   └── make-data.py
├── vote-service
│   ├── app.py
│   ├── Dockerfile
│   ├── .gitlab-ci.yml
│   ├── requirements.txt
│   ├── static
│   └── templates
└── worker-service
    ├── Dockerfile
    ├── .gitlab-ci.yml
    ├── Program.cs
    └── Worker.csproj
```

## 📌 Next Steps

✅ Moving forward, we aim to complete these items and address them thoroughly:

  - add gitlab component and catalog
  - load-test from stage and production
  - backup and restore postgres database

## 🔗 Stay connected with DockerMe! 🚀

**Subscribe to our channels, leave a comment, and drop a like to support our content. Your engagement helps us create more valuable DevOps and cloud content!** 🙌

[![Site](https://img.shields.io/badge/Dockerme.ir-0A66C2?style=for-the-badge&logo=docker&logoColor=white)](https://dockerme.ir/) [![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ahmad-rafiee/) [![Telegram](https://img.shields.io/badge/telegram-0A66C2?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/dockerme) [![YouTube](https://img.shields.io/badge/youtube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/@dockerme) [![Instagram](https://img.shields.io/badge/instagram-FF0000?style=for-the-badge&logo=instagram&logoColor=white)](https://instagram.com/dockerme)