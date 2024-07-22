import scrapy

class BooksSpider(scrapy.Spider):
    name = "books"

    def start_requests(self):
        urls = ['https://books.toscrape.com/catalogue/page-1.html']
        
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        all_books = response.css('ol.row article.product_pod')

        for book in all_books:
            url = book.css('h3 a::attr(href)').get()
            book_title = book.css('h3 a::attr(title)').get()
            price = book.css('p.price_color::text').get()
            
            result = {
                'url': url,
                'book_title': book_title,
                'price': price,
            }

            yield result

        next_page = response.css('li.next a::attr(href)').get()
        if next_page is not None:
            next_page = response.urljoin(next_page)
            yield scrapy.Request(url=next_page, callback=self.parse)
