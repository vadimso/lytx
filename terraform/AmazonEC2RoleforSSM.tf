# 
resource "aws_iam_role" "ec2_ssm_role" {
  name = "EC2SSMRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "ssm_policy" {
  name        = "EC2SSMPolicy"
  description = "IAM policy for EC2 instances to use SSM"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ssm:StartSession",
        "ssm:DescribeSessions",
        "ssm:TerminateSession"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "ssm:CreateDocument",
      "Resource": "arn:aws:ssm:REGION:ACCOUNT-ID:document/*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2_ssm_role_attachment" {
  policy_arn = aws_iam_policy.ssm_policy.arn
  role       = aws_iam_role.ec2_ssm_role.name
}
