# 1 단계 : AWS CodeCommit 리포지토리 생성


resource "aws_codecommit_repository" "ns08014" {
  repository_name = var.repo_name
  description     = "초보자 리포지토리"
  default_branch  = var.repo_default_branch
}


output "clone_repo_https" {
  value = aws_codecommit_repository.ns08014.clone_url_http
}


resource "aws_cloudformation_stack" "default" {
  count = var.enabled ? 1 : 0

  name = var.cf_stack_name
 # tags = module.label.tags

  template_url = var.template_url
 # parameters   = var.parameters
  capabilities = var.capabilities

  on_failure         = var.on_failure
  timeout_in_minutes = var.timeout_in_minutes

  policy_body = var.policy_body
}



output "outputs" {
  value = aws_cloudformation_stack.default[0].outputs
}


resource "aws_cloudformation_stack" "default-2" {
  count = var.enabled ? 1 : 0

  name = var.cf_stack_name_2
 # tags = module.label.tags

  template_url = var.template_url_2
 # parameters   = var.parameters
  capabilities = var.capabilities

  on_failure         = var.on_failure
  timeout_in_minutes = var.timeout_in_minutes

  policy_body = var.policy_body
}



output "outputs-2" {
  value = aws_cloudformation_stack.default-2[0].outputs
  #value = aws_cloudformation_stack.default-2.outputs
}
