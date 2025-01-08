terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.66.0"
        }
    }

    backend "s3" {
        bucket = "remote-state-bucket-aws"
        region = "us-east-1"
        key = "practice"
        dynamodb_table = "for-each-table"
    }
}

provider aws  {
    region = "us-east-1"
}