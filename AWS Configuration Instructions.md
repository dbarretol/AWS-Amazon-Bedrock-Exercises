# 🛠️ Install AWS CLI v2

Visit the [AWS CLI v2 installation guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) and follow the instructions based on your operating system (Windows, macOS, Linux).

---

## ✅ Verify AWS CLI Installation

Run the following commands in your terminal:

```bash
# Show the path to the AWS CLI executable (Linux)
which aws

# Display the installed AWS CLI version
aws --version
# Expected output similar to: aws-cli/2.31.27 Python/3.13.9 Windows/11 exe/AMD64
```

---

# 🔐 AWS IAM User Setup for CLI Access

Follow the [IAM user creation guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html#id_users_create_console).

### Step 1: Sign in to AWS Console

Go to [AWS IAM Console](https://console.aws.amazon.com/iam/) and sign in as an administrator.

### Step 2: Create a New IAM User

- Navigate to **Users** and click **Create user**
- Enter a username (e.g., `cli-user`)
- Under **Select AWS access type**, check:
  - ✅ Access key - Programmatic access
  - ✅ Password - AWS Console access (optional)
- Click **Next**

### Step 3: Set Permissions

Choose one of the following:

- **Option A**: Add the user to an existing group with the required policies (e.g., `AmazonBedrockFullAccess`)
- **Option B**: Attach policies directly (only for development or test):
  - `AmazonBedrockFullAccess` : full Bedrock API and console access
  - `AmazonS3ReadOnlyAccess` : read access to S3 data sources
  - `CloudWatchLogsFullAccess` : (optional) for model usage logging
  - `IAMReadOnlyAccess`

> ⚠️ For production, create a least-privilege custom policy.

### Step 4: (Optional) Add Tags

Add metadata like `Project=AI`, `Owner=YourName`.

### Step 5: Review and Create User

Review settings and click **Create user**.

### Step 6: Generate and Download Access Keys

- Open the user’s details page
- Go to **Security credentials** tab
- Scroll to **Access keys** section
- Click **Create access key**
- Choose **Command Line Interface (CLI)** as the use case
- Download the `.csv` file or copy the keys immediately

> ⚠️ The Secret Access Key is shown only once!

---

## ⚙️ Configure AWS CLI Locally

Run the following command to configure your CLI profile:

```bash
aws configure --profile <profile-name>
```

Enter:

- Access Key ID
- Secret Access Key
- Default region (e.g., `us-east-1`)
- Output format (e.g., `json`)

If using temporary credentials:

```bash
aws configure set aws_session_token "xxxxxxxxxxxxx" --profile <profile-name>
```

> Using `--profile <profile-name>` is optional but recommended to avoid conflicts.

### Credential File Locations

- **Linux/macOS**: `~/.aws/credentials` and `~/.aws/config`
- **Windows**: `C:\Users\<USERNAME>\.aws\credentials` and `C:\Users\<USERNAME>\.aws\config`

### Example File Contents

```ini
# ~/.aws/credentials
[<profile-name>]
aws_access_key_id = *****
aws_secret_access_key = *******
aws_session_token = ***********************

# ~/.aws/config
[profile <profile-name>]
region = us-east-1
output = json
```

---

## 🔍 Verify Configuration

```bash
# View current configuration
aws configure list --profile <profile-name>

# List all profiles
aws configure list-profiles

# Change region for a profile : 
# aws configure set <varname> <value> [--profile profile-name]
aws configure set region us-east-1 --profile bedrock-user
```

---

## 🧪 Test Your Setup

```bash
# Confirm credentials are valid
aws sts get-caller-identity --profile <profile-name>

# Verify Bedrock access
aws bedrock list-foundation-models
```

---

## 🔄 Update Configuration Variables

```bash
# Syntax
aws configure set <varname> <value> [--profile <profile-name>]

# Example
aws configure set default.region us-east-2
```