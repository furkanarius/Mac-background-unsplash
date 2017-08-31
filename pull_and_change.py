import wget
import requests
import json
import random


def main():
    try:
        page = requests.get(
            'https://api.unsplash.com/photos/random?client_id=CLIENT_ID_COMES_HERE&orientation=landscape')
        content = json.loads(page.content)
        url = content["urls"]["raw"]
        out_filepath = '/Users/USERNAME/Pictures/Selection/Unsplash/' + str(random.randint(100, 100000000)) + ".jpg"
        filename = wget.download(url, out=out_filepath)
        return filename
    except:
        filename = "FAIL"
        return filename

if __name__ == "__main__":
    print main()
