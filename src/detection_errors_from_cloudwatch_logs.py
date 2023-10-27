import json
import base64
import gzip
import logging
import sys


def lambda_handler(event, context):
    return ErrorNotification(event, context).execute()


class ErrorNotification():

    def __init__(self, event, context) -> None:
        self.logger = self.__initialize_logger()
        self.event = event
        self.context = context
        self.decoded_data = self.__decode_awslogs_data()


    def execute(self):
        self.logger.info(self.decoded_data['logEvents'][0])

        return {
            'statusCode': 200,
            'body': json.dumps('Hello from Lambda!')
        }


    def __initialize_logger(self):
        logger = logging.getLogger()
        logger.setLevel(logging.DEBUG)
        #handler = logging.StreamHandler(sys.stdout)
        #logger.addHandler(handler)

        return logger


    def __decode_awslogs_data(self):
        json_data = None
        encoded_and_gzip_compressed_data = self.event['awslogs']['data']
        gzip_compressed_data = base64.b64decode(encoded_and_gzip_compressed_data)
        text_data = gzip.decompress(gzip_compressed_data)
        json_data = json.loads(text_data)

        return json_data
