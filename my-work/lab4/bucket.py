#This is the url that was generated https://ds2022-twg3sr.s3.amazonaws.com/downloaded_file.gif?AWSAccessKeyId=AKIA2S2Y4CTHNMIVLUOL&Signature=%2BiK5GC31rR2zMeJz5zeYLD6pr2c%3D&Expires=1728257150

import requests
import boto3
from botocore.exceptions import NoCredentialsError, ClientError

bucket_name = "ds2022-twg3sr"
object_name = "downloaded_file.gif"  
file_url = "https://media.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif"
file_path = "downloaded_file.gif" 
expiration = 604800  

response = requests.get(file_url)
s3 = boto3.client('s3')
s3.upload_file(file_path, bucket_name, object_name)

presigned_url = s3.generate_presigned_url(
  'get_object',
   Params={'Bucket': bucket_name, 'Key': object_name},
   ExpiresIn=expiration
)
print(presigned_url)

