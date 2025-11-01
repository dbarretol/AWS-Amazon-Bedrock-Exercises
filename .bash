# =========================================
# STARTING POINT
# =========================================
# 📁 Navigate to your project root folder
cd /path/to/your/project

# 🧪 Create a virtual environment with a custom name (e.g., 'myenv')
uv venv myenv

# ******⚡ Activate the virtual environment ******

# 👉 On Windows (PowerShell)
myenv\Scripts\Activate.ps1

# 👉 On Windows (CMD)
myenv\Scripts\activate.bat

# 👉 On macOS/Linux
source myenv/bin/activate

#  ******📦 Install dependencies from requirements.txt ******
uv pip install -r requirements.txt

# ✅ Verify installed packages
uv pip list

# To execute the notebooks or scripts, you need to set up AWS credentials by following the instructions in the file titled **AWS Configuration Instructions.md**.
