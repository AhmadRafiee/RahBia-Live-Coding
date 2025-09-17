# RahBia DevOps Live Coding Series

Welcome to the **RahBia DevOps Live Coding Series**! In this project, we’ll explore the entire DevOps lifecycle—from configuring servers to setting up production-ready services.

### About This Project

This live coding series is designed to guide you through each stage of a DevOps project in a hands-on way. Starting with foundational skills, we’ll gradually move toward complex and advanced setups, such as containerization, orchestration, and cloud infrastructure.

Each session builds upon the previous one, allowing you to develop a deep understanding of each component in a DevOps environment. By the end, you’ll be equipped with the skills to handle a full production deployment.

### What You'll Learn
In this series, you’ll gain hands-on experience in a wide range of essential DevOps skills:

  - **Linux:** Core commands, server setup, and administration.
  - **Networking:** Configuring networks, firewalls, and secure access.
  - **Docker:** Container building, deployment, and management.
  - **Ansible:** Infrastructure automation and configuration management.
  - **Kubernetes:** Container orchestration, workload management, and scaling.
  - **Monitoring, Logging, and Tracing:** Observability practices for efficient troubleshooting and insights.
  - **CI/CD Pipelines:** Building continuous integration and deployment flows.
  - **GitOps:** Git-based workflows for managing infrastructure and applications.
  - **Infrastructure as Code (IaC):** Automating infrastructure using code.
  - **OpenStack:** Creating and managing scalable cloud resources.
  - **Ceph:** Distributed storage solutions for high availability and resilience.

By the end of this series, you’ll have a complete toolkit to handle production-ready deployments and optimize DevOps workflows.

### Let’s Work Together!

In this series, we’ll progress side by side, getting hands-on with each topic and learning through experience. Together, we’ll **encounter challenges**, **troubleshoot errors**, and find solutions as we move forward. This journey is all about exploring and overcoming DevOps challenges together!

### Previous Sessions
Below is a list of the sessions we've already completed in the RahBia Live Coding Series. Each session builds upon the previous one, providing you with a step-by-step guide to mastering essential DevOps skills. If you've missed any session, you can always catch up and continue from where we left off!

  - **[Session 01:](2024-Sessions/Session-01-06-November.md)** Getting Started, Setting the Stage - Server Setup & Initial Configuration
  - **[Session 02:](2024-Sessions/Session-02-13-November.md)** Server and ssh Hardening
  - **[Session 03:](2024-Sessions/Session-03-20-November.md)** Install and config Docker service
  - **[Session 04:](2024-Sessions/Session-04-27-November.md)** Automating VM Creation on vCenter with Ansible
  - **[Session 05:](2024-Sessions/Session-05-04-December.md)** Automating VM Creation and delete on vCenter with Ansible
  - **[Session 06:](2024-Sessions/Session-06-11-December.md)** Create iptables rules with ansible and create minio services
  - **[Session 07:](2024-Sessions/Session-07-18-December.md)** Setup Traefik and Minio services with docker and ansible
  - **[Session 08:](2024-Sessions/Session-08-25-December.md)** Setup Traefik and gitlab services with docker and ansible
  - **[Session 09:](2025-Sessions/Session-09-01-January.md)** Setup and config gitlab services with docker and ansible
  - **[Session 10:](2025-Sessions/Session-10-08-January.md)** We’ll finalize the GitLab service setup
  - **[Session 11:](2025-Sessions/Session-11-15-January.md)** Finalize the GitLab service setup
  - **[Session 12:](2025-Sessions/Session-12-22-January.md)** the Nexus service setup
  - **[Session 13:](2025-Sessions/Session-13-05-February.md)** Automated Nexus Repository Configuration with Ansible
  - **[Session 14:](2025-Sessions/Session-14-12-February.md)** Nexus Configuration and Traefik Setup
  - **[Session 15:](2025-Sessions/Session-15-19-February.md)** Voting App Deployment on Docker
  - **[Session 16:](2025-Sessions/Session-16-26-February.md)** Voting App Deployment on Docker with gitlab CI/CD
  - **[Session 17:](2025-Sessions/Session-17-06-May.md)** Voting App Deployment on Docker with gitlab CI/CD
  - **[Session 18:](2025-Sessions/Session-18-13-May.md)** Deploy to multiple environments and pipeline efficiency
  - **[Session 19:](2025-Sessions/Session-19-20-May.md)** Container scanning with trivy, load test with ab and gitlab image cleanup policy
  - **[Session 21:](2025-Sessions/Session-21-23-July.md)** Backup and Restore Operations for Production PostgreSQL with Gitlab CI/CD
  - **[Session 22:](2025-Sessions/Session-22-30-July.md)** Restore Production PostgreSQL Backup and Verification with Gitlab CI/CD
  - **[Session 24:](2025-Sessions/Session-24-13-August.md)** Update all service with Ansible
  - **[Session 26:](2025-Sessions/Session-26-26-August.md)** Create multi-project CI/CD
  - **[Session 27:](2025-Sessions/Session-27-02-September.md)** Complete multi-project CI/CD and gitlab CI/CD-Catalog and Components

Feel free to check out the session's detailed steps and resources in the respective session folders. We’ll keep updating this list as we progress through more advanced topics in DevOps.

### Here’s What We’ll Be Doing:
Below is a list of the tasks and topics we’ll be covering in this series. This list is not fixed—it will evolve over time as we dive deeper into the world of DevOps and tackle new challenges together. Stay tuned for updates as we progress!

#### All Steps List:
  - [x] Explain the live coding video path
    - [x] Project introduction and code review (Voting app)
    - [x] Infrastructure overview (VMware, Debian OS)
    - [x] Automation tool introduction (Ansible)
  - [x] Create the project on GitHub and set up storage for static files on Google Drive
  - [x] Install a Linux OS and focus on the following:
    - [x] Disk partitioning and implementation of required standards
    - [x] Review the partitioning
    - [x] Update and install basic required tools
    - [x] Perform system hardening using the Lynis tool
  - [x] Use an Ansible project to modify and harden Linux servers to achieve a security score above 80
  - [x] Use an Ansible project to modify, install, and configure Docker on servers
  - [x] Use an Ansible project to create and change iptables
  - [x] Use an Ansible project to create and change ssh config
  - [x] Use an Ansible project to create and change password
  - [x] Mitogen for Ansible
  - [x] Create a VM template on VMware and write an Ansible playbook to automate VM creation
  - [ ] Deploy the project as a service on a server with a database and cache, demonstrating the challenges and complexities
  - [x] Set up GitLab on Docker to continue the project
    - [x] create gitlab runner server
    - [x] register gitlab runner service
    - [x] create gitlab backup script
      - [x] move and put to minio
      - [x] encrypt backup file
      - [x] create cron tab for gitlab backup
  - [x] Set up Nexus on Docker to continue the project
      - [x] change nexus password
      - [x] config anonymous
      - [x] change Realms
      - [x] create user | role | assign
      - [x] create docker proxy traefik config
      - [x] create docker blob store | repository | cleanup policy
      - [x] create apt blob store | repository | cleanup policy
      - [x] create raw blob store | repository | cleanup policy
      - [x] create pipy blob store | repository | cleanup policy
  - [x] Set up Traefik on Docker to continue the project
  - [x] Set up MinIo on Docker to continue the project
    - [x] create bucket
    - [ ] create user
    - [ ] create policy
    - [ ] match user with policy
  - [x] Write an Ansible playbook to automate all tasks completed so far
  - [x] Draw a High-Level Design (HLD) diagram of the services built and the path taken
  - [x] Review voting project Dockerfiles, build images and push them to a registry
  - [x] Write a Compose file to containerize the voting project setup
  - [x] Add environment variables for configurable project settings
  - [x] Use Traefik as a reverse proxy for the entire project
  - [x] Draw an HLD diagram for the services created and the path followed
  - [x] Write CI/CD for the project with deployment to 3 different environments with unique configurations
    - [x] Build stage
    - [x] Test stage
    - [x] Deploy to development
    - [x] Deploy to production
    - [x] container scanning with trivy
    - [x] add load test scenario
    - [x] create backup from database 
    - [x] move backup to object storage
    - [x] database backup test
    - [x] gitlab image clean up policy
    - [ ] encrypt and decrypt psql backup
    - [x] add gitlab component and catalog
    - [x] check gitlab backup
    - [x] create ci/cd multi-project
      - [x] trigger downstream project
      - [x] create multi-project pipeline
      - [x] create load test 
      - [x] create backup and restore database
  - [x] upgrade all services 
    - [x] update gitlab service
    - [x] update gitlab runner
    - [x] update minio service
    - [x] update nexus service
    - [x] update traefik service
    - [x] update and upgrade debian os
  - [ ] create sonarqube service for test
  - [ ] Write tests for services using SonarQube
  - [x] Write tests for services using Trivy Scanner
  - [x] Perform load testing on the services with ab
  - [ ] Perform load testing on the services with k6
  - [x] Create backups for stateful services
  - [x] Store backups in the server and send them to object storage
  - [x] Test backups by restoring them on other runners
  - [ ] Draw HLD diagrams of the monitoring services and the journey so far
  - [ ] Set up Prometheus stack on Docker for monitoring and alerting
  - [ ] Set up ELK stack on Docker for monitoring and logging
  - [ ] Set up Loki stack on Docker for logging
  - [ ] Set up Tempo stack on Docker for tracing
  - [ ] Review resource usage with monitoring tools
  - [ ] Analyze service logs with logging tools
  - [ ] Trace service requests using tracing tools
  - [ ] Write Ansible playbooks to automate the completed tasks
  - [ ] Draw HLD diagrams of the services and the journey so far
  - [ ] Plan to address single-node challenges
  - [ ] Transition project infrastructure to Docker Swarm
  - [ ] Cluster PostgreSQL without Orchestration
  - [ ] Cluster Redis without Orchestration
  - [ ] Investigation of clustering problems without orchestration
  - [ ] Cluster PostgreSQL on Docker Swarm
  - [ ] Cluster Redis on Docker Swarm
  - [ ] Deploy Voting app on Swarm
  - [ ] Deploy Prometheus stack on Swarm
  - [ ] Deploy Loki stack on Swarm
  - [ ] Adjust CI/CD for deployment on Swarm
  - [ ] Perform load tests with new scaling and observe service limits
  - [ ] Draw an HLD diagram for services created and the journey followed
  - [ ] Evaluate the design to ensure no Single Point of Failure (SPOF)
  - [ ] Begin transitioning the project towards Kubernetes and explore benefits
  - [ ] Explain Kubernetes design and draw an HLD diagram for it
  - [ ] Set up Kubernetes cluster with Kubeadm
  - [ ] Set up Kubernetes cluster with Kubespray
  - [ ] Draw HLD diagrams of services and journey so far
  - [ ] Install Kubernetes add-ons using Helm
  - [ ] Install Kubernetes add-ons using Terraform
  - [ ] Install Kubernetes add-ons using Argo CD
  - [ ] Install Kubernetes add-ons using Ansible
  - [ ] Set up Ceph cluster with Cephadm
  - [ ] Set up Ceph cluster with Cephadm and Ansible
  - [ ] Draw HLD diagrams of services and journey so far
  - [ ] Integrate Kubernetes with Ceph
  - [ ] Set up monitoring and logging for Kubernetes and Ceph clusters
  - [ ] Cluster PostgreSQL database on Kubernetes
  - [ ] Cluster Redis database on Kubernetes
  - [ ] Write manifests for the Voting app to deploy on Kubernetes
  - [ ] Draw HLD diagrams of services and journey so far
  - [ ] Back up the Kubernetes project
  - [ ] Back up etcd in Kubernetes
  - [ ] Use CI/CD and deploy on Kubernetes with GitLab
  - [ ] Use Argo CD for GitOps deployment of the project on Kubernetes
  - [ ] Combine CI/CD and GitOps for Kubernetes project deployment
  - [ ] Draw HLD diagrams of services and journey so far
  - [ ] Implement auto-scaling for the application on Kubernetes
  - [ ] Perform load testing and use auto-scaling to handle traffic on Kubernetes
  - [ ] Review if there is any SPOF in the project
  - [ ] Update the Kubernetes cluster without downtime
  - [ ] Draw HLD diagrams of services and journey so far
  - [ ] Federate monitoring systems
  - [ ] Cluster backend databases for monitoring, such as Mimir
  - [ ] Use VictoriaMetrics for monitoring and compare it with Prometheus
  - [ ] Use VictoriaLogs for logging and compare it with Loki
  - [ ] Update the Ceph cluster without downtime
  - [ ] Add nodes to the Ceph cluster
  - [ ] Simulate incidents within the Ceph cluster
  - [ ] Update the Kubernetes cluster without downtime
  - [ ] Add nodes to the Kubernetes cluster
  - [ ] Simulate incidents within the Kubernetes cluster
  - [ ] Set up chaos engineering services for Kubernetes (e.g., LitmusChaos)
  - [ ] Set up end-to-end testing for Kubernetes for example sonobuoy
  - [ ] Set up end-to-end testing for Ceph
  - [ ] Use Grafana on-call service to create shifts
  - [ ] Improve alerting with template alerts, grouping, etc.
  - [ ] Implement logging clustering for independent read/write pathways
  - [ ] Establish comprehensive monitoring and alerting for backups with action plans
  - [ ] Draw HLD diagrams of services and journey so far
  - [ ] Set up OpenStack to create a private cloud
  - [ ] Create VMs using Terraform
  - [ ] Create VMs using Ansible
  - [ ] Set up a Kubernetes cluster on OpenStack with automation
  - [ ] Deploy all previous components on Kubernetes within the private cloud
  - [ ] Set up monitoring, logging, and tracing for OpenStack
  - [ ] Update the OpenStack cluster without downtime
  - [ ] Add nodes to the OpenStack cluster
  - [ ] Simulate incidents within the OpenStack cluster
  - [ ] Set up end-to-end testing for OpenStack with rally project

### License
This project is licensed under the Apache-2.0 License. See the [LICENSE](LICENSE) file for more details.

### Support the Project
If you find this project useful and it helps you in your DevOps journey, please consider giving it a ⭐️ on GitHub! Your support not only encourages the continuous improvement of this repository, but also helps others discover and benefit from it.

You can also contribute by opening issues or pull requests with suggestions, improvements, or new content. Every contribution helps this project grow and reach more developers in the community!

### About Me
<table>
  <tr>
    <td>
      <img src="https://avatars.githubusercontent.com/u/19145573?v=4" alt="Ahmad Rafiee" width="750" style="border-radius: 750%;">
    </td>
    <td>
      <h2>Ahmad Rafiee</h2>
      <p>With over 15 years of experience in DevOps and infrastructure, I have been dedicated to designing and implementing a wide range of solutions, from small services and stacks to large cloud clusters. Throughout my career, I have gained extensive knowledge in various technologies and methodologies, enabling me to tackle complex challenges effectively.

I have also been passionate about sharing my expertise through teaching DevOps, empowering the next generation of professionals in the field. Additionally, I have served as a consultant on numerous projects, collaborating with diverse teams to enhance their DevOps practices and infrastructure.

My commitment to continuous learning and adaptation ensures that I stay at the forefront of the rapidly evolving tech landscape, making me a valuable asset to any organization or initiative.</p>
    </td>
  </tr>
</table>


## 🔗 Links
[![Site](https://img.shields.io/badge/Dockerme.ir-0A66C2?style=for-the-badge&logo=docker&logoColor=white)](https://dockerme.ir/)
[![YouTube](https://img.shields.io/badge/youtube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/@dockerme)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ahmad-rafiee/)
[![Telegram](https://img.shields.io/badge/telegram-0A66C2?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/dockerme)
[![Instagram](https://img.shields.io/badge/instagram-FF0000?style=for-the-badge&logo=instagram&logoColor=white)](https://instagram.com/dockerme)