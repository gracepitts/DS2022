#!/bin/bash

#The url is https://ds2022-twg3sr.s3.us-east-1.amazonaws.com/google_logo.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA2S2Y4CTHNMIVLUOL%2F20240929%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240929T224056Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=6906570e0527c551a413092c2dea5068734b91f948d03fbaffb0470d9e7c5060

BUCKET_NAME="ds2022-twg3sr" 
FILE_PATH="https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"   
EXPIRATION=604800
curl https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png > google_logo.png              
FILE_NAME="google_logo.png"

aws s3 cp FILE_NAME s3://BUCKET_NAME/
aws s3 cp "$FILE_PATH" "s3://$BUCKET_NAME/$FILE_NAME"

PRESIGNED_URL=$(aws s3 presign --expires-in $EXPIRATION "s3://$BUCKET_NAME/$FILE_NAME")
echo "$PRESIGNED_URL"


