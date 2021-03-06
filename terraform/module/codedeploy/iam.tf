resource "aws_iam_role" "codedeploy_deployment_group_sample" {
  name = "SampleCodeDeployDeploymentGroupRole"

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : "sts:AssumeRole",
          "Principal" : {
            "Service" : "codedeploy.amazonaws.com"
          },
          "Effect" : "Allow",
        }
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "codedeploy_deployment_group_sample" {
  role       = aws_iam_role.codedeploy_deployment_group_sample.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRoleForLambdaLimited"
}
