provider "aws" {
  region = "us-east-1"
}
 
data "archive_file" "zip_the_python_code" {
type        = "zip"
source_dir  = "${path.module}/python/"
output_path = "${path.module}/python/hello-python.zip"
}
 
resource "aws_lambda_function" "terraform_lambda_func" {
filename                       = "${path.module}/python/hello-python.zip"
function_name                  = "Spacelift_Test_Lambda_Function"
role                           = arn:aws:iam::531190140983:role/service-role/testFc-role-l1r1aw1v
handler                        = "index.lambda_handler"
runtime                        = "python3.8"
}
