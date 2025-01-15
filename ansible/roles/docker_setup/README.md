Install and Configure Docker Service
=========

This Ansible role is designed to automate the installation and configuration of Docker. It provides a streamlined way to set up Docker on multiple systems with consistent settings.

Features:
--------------

  - Installs Docker and its dependencies.
  - Configures Docker settings, such as daemon options and storage drivers.
  - Ensures Docker service is enabled and running.
  - Supports customization through role variables for flexible setups.

Role Variables
--------------

All variables used in this role are located in the default directory of the role. You can find and modify them in the `roles/docker-installation/defaults/main.yml`
These variables allow you to customize the Docker installation and configuration based on your requirements. Simply update the variables in this file to tailor the role's behavior to your environment.


Example Playbook
----------------

You can use the Docker role in a playbook like the example below to install and configure Docker:

    - name: install and configuration docker
      hosts: all
      become: true
      gather_facts: true
      roles:
        - ../roles/docker_setup