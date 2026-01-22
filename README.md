# Secure Deployment of a Production Website on AWS EC2

## Project Overview
This project demonstrates the deployment of a secure, production-ready website on AWS using EC2 and Ubuntu Linux.  
It covers:
- IAM configuration for secure access
- EC2 instance deployment and configuration
- Linux server administration
- Network security via security groups
- Website deployment
- Elastic IP configuration
- Server hardening
- Professional documentation

---

## Architecture
The deployed website uses a single EC2 instance with:
- Ubuntu Server 22.04 LTS
- Apache web server
- Security group with SSH and HTTP access
- Elastic IP for persistent public access
- IAM user group managing EC2 access (no root account usage)

---

## Task 1: IAM Configuration
**Objective:** Create IAM group and user for EC2 administration while ensuring root account is not used.

**Steps:**
1. **Create IAM Group:**  
   - Created a user group named `EC2-Admins` to centralize EC2 management permissions.  
   - Using a group ensures easier scaling and consistent permission management across multiple users.

2. **Attach Managed Policy:**  
   - Attached AWS managed policy `AmazonEC2FullAccess` to the group.  
   - This policy allows full EC2 administrative control, following AWS best practices.

3. **Create IAM User and Assign Group:**  
   - Created a new IAM user named `userkachi`.  
   - Assigned the user to `EC2-Admins` so it inherits all group permissions.  
   - Verified the user can log in via AWS console but not root.

4. **Avoid Root Account:**  
   - The AWS root account was reserved for account-level operations only.  
   - All EC2 operations were performed using the IAM user for better security and accountability.

**Screenshots:**
- ![IAM User](screenshots/task1-iam/iam-user.png)
- ![IAM Group Permissions](screenshots/task1-iam/iam-group-permissions.png)

---

## Task 2: Key Pair & Security Configuration
**Objective:** Configure secure access to EC2 instance using key pairs and a least-privilege security group.

**Steps:**
1. **Create EC2 Key Pair:**  
   - Generated an RSA key pair in AWS named `EttaProjectOne1.pem`.  
   - Downloaded the private key and set proper file permissions in Ubuntu (`chmod 400`).  
   - This key is required for secure SSH access to the EC2 instance.

2. **Create Security Group:**  
   - Configured inbound rules:
     - SSH (port 22) → Allowed only from the student’s current public IP.  
     - HTTP (port 80) → Allowed from all IPs (`0.0.0.0/0`).  
   - All other ports were blocked to follow the **least privilege principle**.

3. **Verification:**  
   - Verified that only the specified ports are open using AWS console.

**Screenshots:**
- ![Key Pair](screenshots/task2-keypair-security/keypair-created.png)
- ![Security Group](screenshots/task2-keypair-security/security-group.png)

---

## Task 3: EC2 Instance Deployment
**Objective:** Deploy a Linux web server instance on AWS with public access.

**Steps:**
1. **Launch EC2 Instance:**  
   - Selected Ubuntu Server 22.04 LTS, t2.micro instance type.  
   - Attached previously created key pair and security group.  
   - Ensured the instance has a public IPv4 address.

2. **Verify Instance Status:**  
   - Confirmed the instance is running and passed all AWS status checks.

**Screenshot:**  
![EC2 Running](screenshots/task3-ec2-deployment/ec2-running.png)

---

## Task 4: Server Access & Configuration
**Objective:** Configure the EC2 instance for hosting a website.

**Steps:**
1. **SSH Access:**  
   - Logged into the EC2 instance using the private key and Ubuntu user.  
   - Verified terminal access.

2. **Update System Packages:**  
   ```bash
   sudo apt update && sudo apt upgrade -y

