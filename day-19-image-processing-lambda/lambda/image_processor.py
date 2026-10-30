import os
import json
import boto3
import urllib.parse
from PIL import Image
from io import BytesIO

s3 = boto3.client("s3")

OUTPUT_BUCKET = os.environ["OUTPUT_BUCKET"]


def lambda_handler(event, context):

    try:
        for record in event["Records"]:

            input_bucket = record["s3"]["bucket"]["name"]

            input_key = urllib.parse.unquote_plus(
                record["s3"]["object"]["key"]
            )

            print(f"Processing image: {input_key}")

            # Download original image
            response = s3.get_object(
                Bucket=input_bucket,
                Key=input_key
            )

            image_content = response["Body"].read()

            # Open image using Pillow
            with Image.open(BytesIO(image_content)) as image:

                image.thumbnail((300, 300))

                # Convert image to JPEG
                if image.mode not in ("RGB", "L"):
                    image = image.convert("RGB")

                output_buffer = BytesIO()

                image.save(
                    output_buffer,
                    format="JPEG",
                    quality=85
                )

                output_buffer.seek(0)

                # Generate output filename
                output_key = f"thumbnails/{input_key.rsplit('/', 1)[-1].rsplit('.', 1)[0]}.jpg"

                # Upload processed image
                s3.put_object(
                    Bucket=OUTPUT_BUCKET,
                    Key=output_key,
                    Body=output_buffer.getvalue(),
                    ContentType="image/jpeg"
                )

            print(f"Thumbnail created: {output_key}")

        return {
            "statusCode": 200,
            "body": json.dumps(
                "Image processed successfully"
            )
        }

    except Exception as error:

        print(f"Image processing failed: {str(error)}")

        raise
