resource "aws_iam_instance_profile" "ssm_instance_profile" {
  name = "ssm-instance-profile"
  role = aws_iam_role.ssm_role.name
}

resource "aws_iam_role" "ssm_role" {
  name = "ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy_attachment" "ssm_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  roles      = [aws_iam_role.ssm_role.name]
}

resource "aws_instance" "company1_instance" {
  # ... (previous configuration)

  iam_instance_profile = aws_iam_instance_profile.ssm_instance_profile.name
}

resource "aws_instance" "company2_instance" {
  # ... (previous configuration)

  iam_instance_profile = aws_iam_instance_profile.ssm_instance_profile.name
}
