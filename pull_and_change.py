import wget
import requests
import json
import random


def main():
    try:
        page = requests.get(
            'https://api.unsplash.com/photos/random?client_id=aaaf91ab8754ae02756508328bdf10a5f9d502405683f853c6ce302e04f98d4f&orientation=landscape')
        content = json.loads(page.content)
        url = content["urls"]["raw"]
        out_filepath = '/Users/furkan/Pictures/Selection/Unsplash/' + str(random.randint(100, 100000000)) + ".jpg"
        # 'sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = \"/Users/Furkan/Pictures/Selection/night-1.jpg\"";'
        filename = wget.download(url, out=out_filepath)
        return filename
    except:
        filename = "FAIL"
        return filename

if __name__ == "__main__":
    print main()