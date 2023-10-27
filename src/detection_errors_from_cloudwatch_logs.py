import json
import base64
import gzip
import logging
import sys
import boto3
import os

def lambda_handler(event, context):
    return ErrorNotification(event, context).execute()


class ErrorNotification():

    def __init__(self, event, context) -> None:
        self.logger = self.__initialize_logger()
        self.event = event
        self.context = context
        self.decoded_data = self.__decode_awslogs_data()
        self.sns_client = None


    def execute(self) -> dict:
        self.logger.info(self.decoded_data['logEvents'][0])
        message = self.decoded_data['logEvents'][0]['message']
        self.__send_email(message)

        return {
            'statusCode': 200,
            'body': json.dumps('Hello from Lambda!')
        }


    def __initialize_logger(self) -> logging.Logger:
        logger = logging.getLogger()
        logger.setLevel(logging.DEBUG)
        #handler = logging.StreamHandler(sys.stdout)
        #logger.addHandler(handler)

        return logger


    def __decode_awslogs_data(self) -> dict:
        json_data = None
        encoded_and_gzip_compressed_data = self.event['awslogs']['data']
        gzip_compressed_data = base64.b64decode(encoded_and_gzip_compressed_data)
        text_data = gzip.decompress(gzip_compressed_data)
        json_data = json.loads(text_data)

        return json_data


    def __sns_client(self) -> boto3.client:
        if self.sns_client is None:
            self.sns_client = boto3.client('sns')

        return self.sns_client


    def __send_email(self, message: str) -> None:
        self.__sns_client().publish(
            TopicArn = os.environ['SNS_TOPIC_ARN'],
            Subject = 'Transfer CloudWatch Logs to SNS Email',
            Message = message,
        )
