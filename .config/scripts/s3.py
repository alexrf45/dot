"""
Creates a quick private bucket
"""
import logging
import boto3
import boto3auth

logger = logging.getLogger()
logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s: %(levelname)s: %(message)s')

BUCKET_NAME=input('Enter Bucket Name: ')
AWS_REGION=input('Enter Desired region: ')

def create_bucket():
    """Create an S3 bucket in a specified region

    If a region is not specified, the bucket is created in the S3 default
    region (us-east-1).

    :param bucket_name: Bucket to create
    :param region: String region to create bucket in, e.g., 'us-west-2'
    :return: True if bucket created, else False
    """

    # Create bucket
    session = boto3auth.Boto3Auth(AWS_REGION)
    session.auth('s3', 'client' )
    client = boto3.client("s3", region_name=AWS_REGION)
    response = client.create_bucket(
        ACL='private',
        Bucket=BUCKET_NAME,
        ObjectOwnership='BucketOwnerEnforced'
        )
    logger.info(response)

create_bucket()
