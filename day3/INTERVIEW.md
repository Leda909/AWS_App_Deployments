# Example interview questions:

### What is cloud computing?

Cloud computing is the on-demand delivery of IT resources—like compute power, storage, databases, and applications—over the internet with pay-as-you-go pricing. It allows users to consume resources from a cloud provider (like AWS) instead of owning and maintaining physical data centers.

### Why do companies want to migrate to cloud?

Key reasons include:
- Cost Savings: Avoiding large upfront capital expenditures (CapEx) for hardware.
- Scalability: Easily scaling resources up or down based on demand.
- Agility: Faster deployment of new applications and services.
- Reliability & Disaster Recovery: Leveraging the provider's global infrastructure for resilience.
- Focus on Core Business: Shifting IT management burden to the cloud provider.

### What is a virtual machine/instance?

A virtual machine (VM) or instance (like an EC2 instance) is a virtualized computer that runs its own operating system and functions like a physical computer, but it is created and runs on top of the physical hardware of a host machine (hypervisor).

### How have you used EC2 in the past?

(Tailor this to your actual experience. Example below:) I've used EC2 primarily to host web applications (like a WordPress site or a custom API) and as development/testing environments. I've configured security groups, monitored performance, and used different instance types based on compute and memory needs.

### What is SSH? What is an SSH Key Pair?

* SSH (Secure Shell): A protocol used to securely connect to a remote server or instance over an unsecured network.

* SSH Key Pair: A set of cryptographic keys (a public key stored on the instance and a corresponding private key held by the user) used for secure, passwordless authentication.

### What is a port?

A port is a communication endpoint used by an operating system to direct network traffic to a specific process, service, or application running on a computer. They are numbered (e.g., HTTP uses port 80, SSH uses port 22).

### What is an AMI?

An AMI (Amazon Machine Image) is a template that contains the software configuration (operating system, application server, and applications) required to launch an EC2 instance. It essentially defines the initial state of the instance.

### What is a basic way to ensure a low level of security for your EC2 instance?

The most basic way is by configuring the Security Group. A Security Group acts as a virtual firewall that controls inbound and outbound traffic to the instance, ensuring only necessary ports and trusted IP addresses are allowed access.

### What is a script? 

A script is a sequence of commands written in a scripting language (like Bash, Python, or PowerShell) that is interpreted and executed by an environment or program to automate tasks, manage systems, or run applications without manual intervention.

### Why is Linux so popular for servers?

Linux is popular due to its:

- Stability and Reliability: It rarely crashes and can run for long periods without reboots.

- Security: Its permissions model and open-source nature make it highly secure.

- Flexibility and Customization: It can be tailored precisely to the server's needs.

- Cost: It's typically free and open-source.

### What considerations should you think of when you are making an EC2 instance?

Key considerations include:

- Instance Type: Choosing the right family (compute, memory, storage optimized) for the workload.

- AMI: Selecting the correct operating system and pre-installed software.

- Security Group: Defining precise ingress/egress rules for network access.

- Storage (EBS): Deciding on volume size, type (HDD/SSD), and encryption.

- Cost: Balancing performance needs with budget constraints.

### What do the commands "sudo apt update" and "sudo apt upgrade" do? Why run them?

These commands are used on Debian/Ubuntu-based Linux systems:

* sudo apt update: Refreshes the local list of available packages from the repositories. It doesn't install or upgrade anything.

* sudo apt upgrade: Installs newer versions of the packages already installed on the system, using the package list updated by the previous command.

Why run them: To ensure the system's software is current, secure, and has the latest patches and features.


Tell me about yourself

What type of colleague would you like to work with?

Tell me about a time that you failed

What is your biggest weakness?

What gets you out of bed in the morning?

### What is your approach to teaching others?

How do you prioritise at work?

Tell me something you are proud of achieving