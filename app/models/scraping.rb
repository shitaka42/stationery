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
    links = []
    agent = Mechanize.new
    cate_page = agent.get(category)
    elements = cate_page.search('p.figure a')
    elements.each do |ele|
      links << ele.get_attribute('href')
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
    price = page.at('p.price span').inner_text
    image_url = page.at('p.figure img')[:src]
    maker = page.at('.outer .breadcrumb span[itemprop = "child"] span[itemprop = "title"]')
    category = page.at('.breadcrumb span[itemprop = "child"] span a span' )

    product = Product.new(title: title,  detail: detail, price: price, image_url: image_url, maker: maker, category: category)
    product.save
  end
end