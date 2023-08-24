# output "website" {
#   value = aws_s3_bucket.resume_bucket.website_domain #The attribute "website_domain" is deprecated.
# }

# output "website_endpoint" {
#   value = aws_s3_bucket.resume_bucket.website_endpoint #The attribute "website_endpoint" is deprecated.
# }

output "bucket_domain_name" {
    description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
    value = aws_s3_bucket.resume_bucket.bucket_domain_name # Gets the value of the domain name of the s3 bucket
}

output "bucket_access_policy" {
  value = aws_s3_bucket_acl.bucket_acl.acl  # values not sure  
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in."
  value       = aws_s3_bucket.resume_bucket.region
}


