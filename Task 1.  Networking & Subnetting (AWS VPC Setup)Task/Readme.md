# Task 1 – AWS VPC Networking Setup  
## Author: Vivek Yadav

---

## 📌 Objective

Create a basic AWS network architecture using Terraform that includes:

- One VPC  
- Two Public Subnets  
- Two Private Subnets  
- Internet Gateway for public subnet access  
- NAT Gateway for private subnet outbound internet access  
- Separate Route Tables for Public and Private subnets  

---

## 🏗 VPC Design

| Component | Name | CIDR | Availability Zone | Purpose |
|------------|----------------------|-----------|------------------|----------------|
| VPC | Vivek_yadav | 10.0.0.0/16 | N/A | Main Virtual Private Cloud |
| Public Subnet 1 | Vivekyadav_subnet1 | 10.0.1.0/24 | eu-north-1a | Internet-facing resources |
| Public Subnet 2 | Vivekyadav_subnet2 | 10.0.2.0/24 | eu-north-1b | Internet-facing resources |
| Private Subnet 1 | Vivekyadav_privsub1 | 10.0.3.0/24 | eu-north-1c | Backend services |
| Private Subnet 2 | Vivekyadav_privsub2 | 10.0.4.0/24 | eu-north-1a | Backend services |

---

## 🎯 Why These CIDR Ranges?

- **10.0.0.0/16** provides enough IP range for future growth.  
- Each subnet uses a **/24** block, giving 256 IPs per subnet.  
- Public and private subnets are separated for security.  
- Private subnets do not expose resources directly to the internet.  
- NAT Gateway enables safe outbound access for private resources.  

---

## 🧩 Network Architecture

Internet
|
Internet Gateway
|
Public Subnets
|
NAT Gateway
|
Private Subnets


# Terraform Code
Terraform configuration for this setup is inside:

main.tf :- 
The script provisions:
- VPC and subnets  
- Internet Gateway  
- NAT Gateway with Elastic IP  
- Public and Private Route Tables  
- Routing rules and associations  
