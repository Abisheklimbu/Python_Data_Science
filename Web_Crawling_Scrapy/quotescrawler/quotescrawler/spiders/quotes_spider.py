import scrapy

class QuotesSpider(scrapy.Spider):
    name = "quotes"

    def start_requests(self):
        urls = [
            'https://quotes.toscrape.com/page/1/',
            'https://quotes.toscrape.com/page/2/'
        ]
    
        # Generator Function 
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    # # For single quote
    # def parse(self, response):
    #     page_no = response.url.split('/')[-2]
    #     filename = f"quotes-{page_no}.html"

    #     with open(filename, "wb") as f:
    #         f.write(response.body)

    #     self.log(f"Saved file {filename}")


    # # For Multiple quote
    # def parse(self, response):
    #     all_quotes = response.css('div,quote')

    #     for quote in all_quotes:
    #         first_quote = quote.css('span.text::text').get()
    #         author = quote.css('small.author::text').get()
    #         tag = quote.css('a.tag::text').getall ()

    #         result = {
    #         'text' : first_quote,
    #         'author': author,
    #         'tags' : tag
    #         }

    #         # print(result)

    #         yield result


    # For all quote of multiple page
    def parse(self, response):
        all_quotes = response.css('div.quote')

        for quote in all_quotes:
            first_quote = quote.css('span.text::text').get()
            author = quote.css('small.author::text').get()
            tags = quote.css('a.tag::text').getall()

            if first_quote and author and tags:
                result = {
                    'text': first_quote,
                    'author': author,
                    'tags': tags
                }
                yield result

        next_page = response.css('li.next a::attr(href)').get()
        if next_page is not None:
            next_page = response.urljoin(next_page)
            yield scrapy.Request(url=next_page, callback=self.parse)
  
      