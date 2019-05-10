#!/usr/bin/python
#
#    This example shows how to use MITIE's text_categorizer from Python.
#
#
import newspaper
from goose3 import Goose
from unidecode import unidecode


# get newsarticles and save them in format described in the article
# Filename: title-<article_numer>.txt, example: title-1.txt
# Contents: The title of the news story.
# Filename: article-<article_numer>.txt, example: article-1.txt
# Contents: The contents of the news story.
# And optionally, also store the topic of the news article
# Filename: topic-<article_numer>.txt, example: topic-1.txt
# Contents: The actual “topic” (section or sub-section) under which the news story was
#           classified on the hosting website.

def get_articles(path, news_website = 'https://www.yahoo.com/news/', language='en', lm_articles = 300):
    # articles should be saved in /articles file
    # See Goose and newspaper3k documentation for explanation on how to use
    # these packages (tried to use Beautiful Soup for this but was 
    # frustratingly difficult, since it seems that the newspages load when
    # someone is actually on the side, instead of automatically loading 
    # everything).
    # https://github.com/goose3/goose3 for goose documentation

    cnn_paper = newspaper.build(news_website, language=language, memoize_articles=False)
    g = Goose()
    

    categories = cnn_paper.category_urls()
    N = len(cnn_paper.articles)
    print(f"Number of articles: {N}\n")

    print("Categories: ")
    for category in categories:
        print(category)
        
    print("\nArticles")
    file_id = 0
    for article in cnn_paper.articles:
        if 'html' in article.url:
            if (file_id < 10): 
                print(article.url)
            if (file_id == 10): 
                print(f"{article.url}\n...\n")
                
            if file_id < lm_articles:
                article_extr = g.extract(url=article.url)
                
                with open(path+f'/title-{file_id}.txt', 'w') as file: 
                    file.write(article_extr.title)
                with open(path+f'/article-{file_id}.txt', 'w') as file: 
                    file.write(unidecode(article_extr.cleaned_text))
                with open(path+f'/topic-{file_id}.txt', 'w') as file: 
                    file.write(article_extr.domain)
                file_id += 1
            else:
                break
        else:
            continue
                
    print(f"{file_id} articles. \n\n")

        