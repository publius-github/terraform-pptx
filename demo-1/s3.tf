resource "aws_s3_bucket" "default" {
  bucket = "${var.organization_name}-demo-1-${var.environment}"
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_policy" "default" {
  bucket = aws_s3_bucket.default.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyDeleteBucket",
      "Action": [
        "s3:DeleteBucket"
      ],
      "Effect": "Deny",
      "Resource": [
        "${aws_s3_bucket.default.arn}",
        "${aws_s3_bucket.default.arn}/*"
      ],
      "Principal": {
        "AWS": "arn:aws:iam::${var.account_id}:root"
      }
    },
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.default.arn}",
        "${aws_s3_bucket.default.arn}/*"
      ],
      "Principal": {
          "AWS": [
            "${aws_iam_role.default.arn}"
          ]
      }
    }
  ]
}
POLICY
}
