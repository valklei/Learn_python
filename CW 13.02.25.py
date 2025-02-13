from bs4 import BeautifulSoup
import requests
from pathlib import Path

url = "https://www.flickr.com/explore"

def image_parser(url: str) -> list[str]:
    raw_html = requests.get(url).text
    soupe = BeautifulSoup(raw_html, "html.parser")
    images_block = soupe.find(
        "div",
        {"class" : "view photo-list-view requiredToShowOnServer"}
    )
    images = images_block.find_all("img")
    img_links = [f"https:{image["src"]}" for image in images]
    #print(img_links)
    return img_links

def save_images(data:list[str]):
    target_dir = Path(__file__).parent /"downloaded_images"
    if not target_dir.exists():
        target_dir.mkdir()
    for link in data:
        file_name = f"{target_dir}/image_{link.split('/')[-1]}"
        with open(file_name, "wb") as f:
            req_link = requests.get(link)
            f.write(req_link.content)


links = image_parser(url)

save_images(links)