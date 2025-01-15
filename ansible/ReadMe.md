
### Requirements File `requirements.txt`
The requirements.txt file is used in Python projects to list all the dependencies (external libraries or packages) that are required to run your application or project. This file allows users to easily install the necessary dependencies using pip, the Python package installer.
```bash
pip install -r requirements.txt
```

### Ansible Configuration File `ansible.cfg`
The ansible.cfg file defines key configuration settings for running Ansible playbooks and managing target servers. This file allows customization of various options, including connection details, logging, and roles directory paths, making it easier to manage Ansible behavior across different environments.

## Playbooks:
Playbooks are used to execute multiple roles and tasks across targeted servers.
  - `hardening.yml` This playbook is designed to strengthen security on Linux servers by implementing key hardening steps for both the operating system and SSH configurations.
  - ‍‍`docker.yml`This is a Docker playbook that allows us to invoke the Docker role

## Roles:
Each role in this project is modular, focused on a specific area of system security, and designed to be reusable.
  - `os_hardening` This role provides numerous security-related configurations, providing all-round base protection.
  - `ssh_hardening` This role provides secure ssh-client and ssh-server configurations. It is intended to be compliant with the [DevSec SSH Baseline](https://github.com/dev-sec/ssh-baseline).
  - `docker_setup` With this role, you can install and configure Docker.


