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
<details>
  <summary>RahBia Live Coding Sessions</summary>

Below is a list of the sessions we've already completed in the RahBia Live Coding Series. Each session builds upon the previous one, providing you with a step-by-step guide to mastering essential DevOps skills. If you've missed any session, you can always catch up and continue from where we left off!

  - **[Session 01:](2024-Sessions/Session-01-06-November.md)** Getting Started, Setting the Stage - Server Setup & Initial Configuration
  - **[Session 02:](2024-Sessions/Session-02-13-November.md)** Server and ssh Hardening
  - **[Session 03:](2024-Sessions/Session-03-20-November.md)** Install and config Docker service
  - **[Session 04:](2024-Sessions/Session-04-27-November.md)** Automating VM Creation on vCenter with Ansible
  - **[Session 05:](2024-Sessions/Session-05-04-December.md)** Automating VM Creation and delete on vCenter with Ansible
  - **[Session 06:](2024-Sessions/Session-05-11-December.md)** Create iptables rules with ansible and create minio services

Feel free to check out the session's detailed steps and resources in the respective session folders. We’ll keep updating this list as we progress through more advanced topics in DevOps.

</details>


### Here’s What We’ll Be Doing:
Below is a list of the tasks and topics we’ll be covering in this series. This list is not fixed—it will evolve over time as we dive deeper into the world of DevOps and tackle new challenges together. Stay tuned for updates as we progress!

<details>
  <summary>All Steps List</summary>

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
  - [ ] Mitogen for Ansible
  - [x] Create a VM template on VMware and write an Ansible playbook to automate VM creation
  - [ ] Deploy the project as a service on a server with a database and cache, demonstrating the challenges and complexities
  - [ ] Set up GitLab on Docker to continue the project
  - [ ] Set up Nexus on Docker to continue the project
  - [ ] Set up MinIo on Docker to continue the project
  - [ ] Write an Ansible playbook to automate all tasks completed so far
  - [ ] Draw a High-Level Design (HLD) diagram of the services built and the path taken
  - [ ] Review Dockerfiles, build images and push them to a registry
  - [ ] Write a Compose file to containerize the project setup
  - [ ] Add environment variables for configurable project settings
  - [ ] Use Traefik as a reverse proxy for the entire project
  - [ ] Use Nginx as a reverse proxy for the entire project
  - [ ] Draw an HLD diagram for the services created and the path followed
  - [ ] Write CI/CD for the project with deployment to 3 different environments with unique configurations
  - [ ] Write tests for services using SonarQube
  - [ ] Write tests for services using Trivy Scanner
  - [ ] Perform load testing on the services with ab
  - [ ] Perform load testing on the services with k6
  - [ ] Create backups for stateful services
  - [ ] Store backups in the server and send them to object storage
  - [ ] Test backups by restoring them on other runners
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

</details>

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