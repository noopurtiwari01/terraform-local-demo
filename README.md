# 🌱 Terraform Local Experiments

This repository contains hands-on Terraform experiments that **run entirely on your local machine** — no AWS, Azure, or GCP accounts needed.

These examples are ideal for learning the basics of Terraform, including resources, provisioners, variables, loops, and local modules.

---

## 🛠 Prerequisites

Ensure the following are installed on your system:

### ✅ Terraform (>= 1.0.0)
```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
terraform -version
```

### Docker (Optional: for folder3-docker-provider)
Install Docker Desktop for Mac: https://www.docker.com/products/docker-desktop

## 📁 Project Structure
Each folder below contains an isolated example with its own Terraform config:

### 📂 folder1-local-file
Objective: 1. Create a simple local file using Terraform

- Uses local_file resource from the hashicorp/local provider.
- Shows how to initialize, plan, and apply a simple .tf file.
- File hello.txt is created with static content.

### 📂 folder2-null-resource
Objective: Run a local shell command using Terraform.

- Uses null_resource with local-exec provisioner.
- Executes a shell command (echo) that creates a file (script_output.txt).
- ⚠️ Note: Terraform does not manage this file; it won’t be deleted on terraform destroy.

### 📂 folder3-docker-provider
Objective: Use Terraform to pull and run a Docker container locally.

- Uses the kreuzwerker/docker provider.
- Pulls the nginx image and runs a container on port 8080.
- ✅ Make sure Docker is running before applying.

### 📂 folder4-variables-outputs
Objective: Introduce Terraform variables and outputs.

- Creates a file greeting.txt using values from variables.tf.
- Prints the created filename as an output after terraform apply.

### 📂 folder5-loops-for-each
Objective: Use for_each to create multiple resources dynamically.

- Iterates over a list of strings and creates a .txt file for each.
- Demonstrates use of each.key with dynamic filenames and content.

### 📂 folder6-local-module
Objective: Create and use a local module.

- Root main.tf calls a module from modules/file_writer.
- Module accepts filename and content, and writes the file.
- Demonstrates:
    - Local modules
    - Input variables
    - Outputs
- ✅ Requires folder modules/file_writer with:
    - main.tf
    - variables.tf
    - outputs.tf

## 🚀 Usage
For each folder:

```bash
cd folderX
terraform init
terraform apply
```

To destroy resources:

```bash
terraform destroy
```

To format files:

```bash
terraform fmt
```

## 💬 Notes
- All configurations use the local provider.
- Provider and version declarations are done only in the root module (best practice).
- Syntax is not indentation-sensitive, but good formatting helps.
- Comments in .tf files can use # or //.

## 🧠 Concepts Covered
- Providers (local, docker)
- Resources and provisioners
- Input variables and outputs
- Loops: count, for_each
- Local modules and reuse
- State and .terraform.lock.hcl behavior

## 🧼 Cleanup
To clean up all generated Terraform state files, provider folders, and any files created by resources (like .txt files), you can run the following:

```bash
# ⚠️ WARNING: This will recursively delete Terraform-generated files and folders.
find . -type f \( -name "*.txt" -o -name "terraform.tfstate*" -o -name ".terraform.lock.hcl" \) -delete
find . -type d -name ".terraform" -exec rm -rf {} +
```

#### ⚠️ Warning:
This will permanently delete all .txt files and Terraform state/config files in all folders. Use only if you're sure you want to reset everything.

## 📌 License
MIT License — free to use and modify.

Happy Terraforming! 🌍
