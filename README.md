# Hosting Static Website with Terraform on AWS - MyMusic

This repository contains the infrastructure code to host a static website on AWS using Terraform. The website serves as a simple interface to allow Android users to download the **[MyMusic](http://mybuck-terraform-s3.s3-website-sa-east-1.amazonaws.com/)** application through a QR code. This project was developed as part of the **[Software Architecture](https://unbarqdsw2024-1.github.io/2024.1_G2_My_Music/)** course, taught by Milene Serrano.

## 🎯 Project Overview

The goal of this project was to demonstrate the use of infrastructure as code (IaC) by deploying a static website on Amazon Web Services (AWS) using Terraform.

## 🚀 Key Features

- **Static Website Hosting on AWS S3**: The website is hosted on an S3 bucket configured for static website hosting. This approach offers high availability, durability, and scalability with minimal management overhead.

- **Infrastructure as Code (IaC)**: The entire AWS infrastructure, including the S3 bucket and its configuration, was provisioned using Terraform. This approach provides several advantages:
  - **Consistency**: Ensures that the infrastructure is consistently deployed across different environments.
  - **Scalability**: Terraform allows easy scaling of resources or addition of new features without manual configuration.
  - **Version Control**: Infrastructure configurations are stored in code, allowing versioning, auditing, and rollback of changes if needed.
  - **Automation**: Facilitates automated deployment processes, reducing the potential for human error and increasing efficiency.

## 📖 How It Works

1. **Access the Website**: When Android users visit the [website](http://mybuck-terraform-s3.s3-website-sa-east-1.amazonaws.com/), they are presented with a QR code.
2. **Scan the QR Code**: Users can scan the QR code with their mobile device's camera.
3. **Download the MyMusic App**: The QR code redirects Android users to the appropriate download link for the MyMusic app, where they can install and start enjoying music immediately.
