# Terraform Infrastructure Setup

This repository contains reusable Terraform modules to provision:
- **VPC**
- **Security Group**
- **EC2 Instances**
  
Environment-specific configurations (e.g., `dev`, `qa`, `prod`) are stored under `envs/`.

---

## 📂 Project Directory Structure
RootFolder/
├── modules/
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── security-group/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── envs/
    └── dev/
        ├── main.tf
        ├── variables.tf
        ├── terraform.tfvars
        └── backend.tf


       ┌──────────────────────────────────────────────────────┐
       │                     AWS Provider                     │
       └──────────────────────────────────────────────────────┘
                              │
                              ▼
       ┌──────────────────────────────────────────────────────┐
       │                  VPC Module (dev)                    │
       │  - VPC (10.0.0.0/16)                                 │
       │  - 2 Subnets (dev-subnet-1, dev-subnet-2)            │
       │  - Internet Gateway                                  │
       │  - Route Table + Route                               │
       └──────────────────────────────────────────────────────┘
                              │
                              ▼
       ┌──────────────────────────────────────────────────────┐
       │          Security Group Module (dev)                 │
       │  - Common SG (dev-common-sg)                         │
       │  - Default ports: 22, 80, 443                        │
       │  - Extra ports: 8080 (dev specific)                  │
       └──────────────────────────────────────────────────────┘
                              │
                              ▼
       ┌──────────────────────────────────────────────────────┐
       │                EC2 Module (dev)                      │
       │  - Instance: dev-Dev-EC2                             │
       │  - Subnet: dev-subnet-1                              │
       │  - SG: dev-common-sg                                 │
       │  - Key Pair: New_Test                                │
       │  - User Data: dev-init.sh                            │
       └──────────────────────────────────────────────────────┘


---

### ✅ How It Works
- **VPC Module** → Creates VPC, Subnets, IGW, Route Table
- **Security Group Module** → Common SG with default ports + extra ports for environment
- **EC2 Module** → EC2 in VPC Subnet, attached to SG

---

## 🚀 Next Steps
- Add **Remote Backend** (S3 + DynamoDB)
- Add **NAT Gateway & Private/Public Subnets**
- Extend for **QA / PROD** by copying `envs/dev` and updating variables
