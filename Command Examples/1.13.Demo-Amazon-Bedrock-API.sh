## 🧭 Understanding AWS Bedrock CLI Commands

### ⚠️ Two Bedrock CLI Namespaces:

# * `aws bedrock`

#   * Used for **configuration and management** of Bedrock.
#   * Examples: enabling models, features, permissions, etc.
# * `aws bedrock-runtime`

#   * Used **only for model invocation** (i.e., inference).

# > **Important**: Use `aws bedrock-runtime` when sending prompts to a model.


# in Windows cmd
aws bedrock-runtime invoke-model --model-id anthropic.claude-3-sonnet-20240229-v1:0 --body "{\"anthropic_version\": \"bedrock-2023-05-31\", \"max_tokens\": 1000, \"messages\": [{\"role\": \"user\", \"content\": \"What is the capital of France?\"}]}" --cli-binary-format raw-in-base64-out --profile bedrock-play --region us-east-1 output.json


# in windows powershell
aws bedrock-runtime invoke-model --model-id anthropic.claude-3-sonnet-20240229-v1:0 --body '{\"anthropic_version\": \"bedrock-2023-05-31\", \"max_tokens\": 1000, \"messages\": [{\"role\": \"user\", \"content\": \"What is the capital of France?\"}]}' --cli-binary-format raw-in-base64-out output.json

#external body
aws bedrock-runtime invoke-model --model-id anthropic.claude-3-sonnet-20240229-v1:0 --body file://body.json --cli-binary-format raw-in-base64-out output.json


