# AWS EC2 Instance using Terraform

This project demonstrates how to create and manage an AWS EC2 instance using Terraform.  
It also supports importing an existing EC2 instance into Terraform state.


## Project Overview

The goal of this project is to provision an EC2 instance using Infrastructure as Code (IaC) through Terraform.  
The configuration creates an EC2 instance inside an existing VPC and subnet with a predefined AMI, security group, and key pair.

This repository can be used for:
- Creating an EC2 instance from scratch
- Importing an existing EC2 instance into Terraform
- Managing infrastructure in a repeatable and automated way

## AWS Environment Details

| Parameter            | Value |
|----------------------|-------|
| Region               | eu-north-1 (Stockholm) |
| Instance Type        | t3.micro |
| AMI ID               | ami-0f50f13aefb6c0a5d |
| VPC ID               | vpc-07bdd3941d1d7411d |
| Subnet ID            | subnet-05679908f3de34dc3 |
| Security Group ID    | sg-0290a81bcb028466e |
| Key Pair Name        | instances |
| Owner ID             | 627146568361 |
| Imported Instance ID | i-0096bcce81cc5dca8 |
| Instance ARN         | arn:aws:ec2:eu-north-1:627146568361:instance/i-0096bcce81cc5dca8 |


### EC2 Screenshot AWS
![EC2](https://github.com/vivekyadav03/Flentas_assignment/blob/main/Task%202%20EC2%20Static%20Website%20HostingTask/SCREENSHOTS/EC2.png)

### Nginx Screenshot AWS
![EC2](https://github.com/vivekyadav03/Flentas_assignment/blob/main/Task%202%20EC2%20Static%20Website%20HostingTask/SCREENSHOTS/Nginx.png)

### Resume_hosting_site Screenshot AWS
![EC2](https://github.com/vivekyadav03/Flentas_assignment/blob/main/Task%202%20EC2%20Static%20Website%20HostingTask/SCREENSHOTS/resume_hosting%20site.png)

### Security groups AWS
![EC2](https://github.com/vivekyadav03/Flentas_assignment/blob/main/Task%202%20EC2%20Static%20Website%20HostingTask/SCREENSHOTS/Securtiy%20group.png)
