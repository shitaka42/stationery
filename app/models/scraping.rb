  # require 'mechanize'
class Scraping

  def self.categories_urls
    categories = []
    agent = Mechanize.new
    current_page = agent.get("http://hands.net/cate/stationery")
    elements = current_page.search ('ul.categories li.category>a')
    elements.each do |ele|
      categories << ele.get_attribute('href')
    end

    categories.each do |category|
      products_urls(category)
    end
  end

  def self.products_urls(category)
    agent = Mechanize.new
    links = []

    next_url = category

num = 0
    while num < 19 do
      cate_page = agent.get(next_url)
      elements = cate_page.search('p.figure a')
      elements.each do |ele|
        links << ele.get_attribute('href')
      end

      next_url = cate_page.at('.pagination li.next a').get_attribute('href') if cate_page.at('.pagination li.next a')
      num += 1
      # break unless next_url
    end

    links.each do |link|
      get_product(link)
    end
  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('h1.name').inner_text
    detail = page.at('#description.section').inner_text
    price = page.at('p.price span').inner_text if page.at('p.price span')
    image_url = page.at('p.figure img')[:src]
    maker = page.at('.outer .breadcrumb span[itemprop = "child"] span[itemprop = "title"]').inner_text if page.at('.outer .breadcrumb span[itemprop = "child"] span[itemprop = "title"]')
    category = page.at('.breadcrumb span[itemprop = "child"] span a span' ).inner_text if page.at('.breadcrumb span[itemprop = "child"] span a span' )

    product = Product.where(title: title,  detail: detail, price: price, image_url: image_url, maker: maker, category: category).first_or_initialize
    product.save
  end
end