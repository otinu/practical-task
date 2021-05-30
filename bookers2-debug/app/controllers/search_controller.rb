class SearchController < ApplicationController
  def search
    @content = params['search']['content']
    @model = params['search']['model']
    @how = params['search']['how']
    @datas = search_for(@how, @model, @content)
  end

  private
  
  def search_for(how, model, content)
    case how
    when 'match'
      match(model, content) #matchメソッドはRuby自体にあるものの、本来は正規表現を扱う。ここではwhereメソッドを使いたいから、独自のmatchメソッドを定義。
    when 'forward'
      forward(model, content)
    when 'backward'
      backward(model, content)
    when 'partical'
      partical(model, content)
    end
  end
  
  def match(model, content)
    if model == 'user'
      User.where(name: content)
    elsif model == 'book'
      Book.where(title: content)
    end
  end

#前方一致から部分一致までは、whereの引数に注目。
#SQL文(風?)になっていて、第2引数の「%」の位置や数を調整することで前方一致や部分一致を実現している。

  def forward(model, content)
    if model == 'user'
      User.where('name LIKE ?', "#{content}%") 
    elsif model == 'book'
      Book.where('title LIKE ?', "#{content}%")
    end
  end

  def backward(model, content)
    if model == 'user'
      User.where('name LIKE ?', "%#{content}")
    elsif model == 'book'
      Book.where('title LIKE ?', "%#{content}")
    end
  end

  def partical(model, content)
    if model == 'user'
      User.where('name LIKE ?', "%#{content}%")
    elsif model == 'book'
      Book.where('title LIKE ?', "%#{content}%")
    end
  end

end

