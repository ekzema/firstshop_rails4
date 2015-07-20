RailsAdmin.config do |config|
config.model Order do
  label "Заказы" 
  label_plural "Заказы"  
  configure :name do
    label 'Имя'
  end 
  configure :email do
    label 'Почта'
  end    
  configure :address do
    label 'Адрес'
  end  
  configure :pay_type do
    label 'Способ оплаты'
  end  
  configure :line_items do
    label 'Товарная позиция'
  end
  configure :created_at do
    label 'Создан'
  end 
  configure :updated_at do
    label 'Обновлён'
  end 
end

config.model Catalog do
  label "Каталоги" 
  label_plural "Каталоги"
  configure :name do
    label 'Имя'
  end 
  configure :created_at do
    label 'Создан'
  end 
  configure :updated_at do
    label 'Обновлён'
  end 
  configure :image_catalog do
    label 'Изображение'
  end 
  configure :boxes do
    label 'Вид товара'
  end 
end

config.model Filtr do
  label "Фильтры катологов" 
  label_plural "Фильтры катологов"
  configure :body do
    label 'Фильтр'
  end 
  configure :box do
    label 'Вид товара'
  end 
  configure :created_at do
    label 'Создан'
  end 
  configure :updated_at do
    label 'Обновлён'
  end 
  configure :categories do
    label 'Категория'
  end 
   configure :product do
    label 'Товар'
  end
end

config.model Slider do
  label "Слайды" 
  label_plural "Слайды"
  configure :name do
    label 'Имя'
  end 
  configure :url_item do
    label 'Ссылка на товар'
  end 
  configure :created_at do
    label 'Создан'
  end 
  configure :updated_at do
    label 'Обновлён'
  end 
  configure :image do
    label 'Изображение'
  end
end

config.model Product do
  label "Товары" 
  label_plural "Товары"
  configure :description do
    label 'Описание'
  end
  configure :addinformation do
    label 'Дополнительная информация'
  end
  configure :price do
    label 'Цена'
  end
  configure :model do
    label 'Модель'
  end
  configure :warranty do
    label 'Гарантия'
  end
  configure :madein do
    label 'Страна производитель'
  end
  configure :brand do
    label 'Бренд'
  end
  configure :spec_column1 do
    label 'Доп колонка1'
  end
  configure :spec_column2 do
    label 'Доп колонка2'
  end
  configure :title do
    label 'Заголовок'
  end
  configure :image_product do
    label 'Изображение'
  end
  configure :orders do
    label 'Заказан пользователем'
  end
  configure :line_items do
    label 'Товарная позиция'
  end
  configure :categories do
    label 'Категория'
  end
   configure :filtrs do
    label 'фильтр'
  end
  configure :comments do
    label 'Отзывы'
  end
  configure :created_at do
    label 'Создан'
  end 
  configure :updated_at do
    label 'Обновлён'
  end 
end

config.model Specification do
  label "Характеристики товара" 
  label_plural "Характеристики товара"
  configure :title do
    label 'Заголовок'
  end 
  configure :column_1 do
    label 'Колонка 2'
  end 
  configure :column_2 do
    label 'Колонка 1'
  end 
  configure :product do
    label 'Продукт'
  end 
  configure :created_at do
    label 'Создан'
  end 
  configure :updated_at do
    label 'Обновлён'
  end 
end

config.model Imagespec do
  label "Фотографии товаров" 
  label_plural "Фотографии товаров"
  configure :product do
    label 'Товар'
  end 
  configure :created_at do
    label 'Создан'
  end 
  configure :updated_at do
    label 'Обновлён'
  end 
  configure :image do
    label 'Изображение'
  end 
end

config.model Comment do
  label "Отзывы к товарам" 
  label_plural "Отзывы к товарам"
  configure :name do
    label 'Имя'
  end 
  configure :body do
    label 'Отзыв'
  end 
  configure :commentable do
    label 'Тип отзыва'
  end 
  configure :created_at do
    label 'Создан'
  end 
  configure :updated_at do
    label 'Обновлён'
  end 
  configure :comments do
    label 'Отзывы'
  end 
end

config.model Cart do
  label "Корзины пользавателей" 
  label_plural "Корзины пользавателей"
  configure :created_at do
    label 'Создан'
  end 
  configure :updated_at do
    label 'Обновлён'
  end 
  configure :line_items do
    label 'Товарная позиция'
  end
end

config.model Brand do
  label "Бренды товаров" 
  label_plural "Бренды товаров"
  configure :name do
    label 'Имя'
  end 
  configure :box do
    label 'Вид товара'
  end 
  configure :created_at do
    label 'Создан'
  end 
  configure :updated_at do
    label 'Обновлён'
  end 
  configure :image_brand do
    label 'Изображение'
  end 
  configure :products do
    label 'Товар'
  end 
end

config.model Box do
  label "Виды товаров" 
  label_plural "Виды товаров"
  configure :name do
      label 'Имя'
    end 
  configure :catalog do
    label 'Каталог'
  end  
  configure :created_at do
    label 'Создан'
  end 
  configure :updated_at do
    label 'Обновлён'
  end   
  configure :image do
    label 'Изображение'
  end  
  configure :brands do
    label 'Бренд'
  end 
  configure :filtrs do
    label 'Фильтр'
  end
end

config.model Category do
 visible false
end

config.model LineItem do
 visible false
end

config.model Admin do
 visible false
end


  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :admin
   end
   config.current_user_method(&:current_admin)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
