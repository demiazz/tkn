# coding: utf-8

slide <<-EOS, :center
   \e[1m***** ***** *   * ***** *     ***** **
   *       *   ** ** *   * *     *     **
   *****   *   * * * ***** *     ***   **
*   *   *   * *     *     *
   ***** ***** *   * *     ***** ***** **\e[0m

  \e[1mBUT NOT AS EASY AS PIE\e[0m



  Alexey "demiazz" Plutalov <demiazz.py@gmail.com>

  Twitter: @demiazz
  Github: demiazz
EOS

section "Дьявол кроется в мелочах" do

  slide <<-EOS, :center
    А вы задумывались что такое веб-формы?
  EOS

  slide <<-EOS, :block
    \e[1mВики считает, что:\e[0m
        "Форма (англ. form) в HTML — раздел документа, позволяющий пользователю
         вводить информацию для последующей обработки системой.
         Синтаксически форма в HTML задаётся с помощью элемента form
         и в дополнение к разметке обычных элементов содержит разметку
         для элементов управления, надписей и других."
  EOS

  slide <<-EOS, :center
    Бесполезное определение...
  EOS

  section "Форма в HTML глазами пользователя" do

    slide <<-EOS, :center
      Спросим самих пользователей!
    EOS

    slide <<-EOS, :block
      \e[1mРепортер:\e[0m
          "Надежда, скажите нам, что такое веб-форма?"
      \e[1mНадя, студентка философского факультета:\e[0m
          "Я думаю это такие поля, куда набираешь текст, нажимаешь красивую
           кнопку, и перед взором открывается вся тайна бытия."
    EOS

    slide <<-EOS, :block
      \e[1mРепортер:\e[0m
          "Дедфуд, скажи, что хочет видеть пользователь в веб-форме?"
      \e[1m0xd34df00d, разработчик LeechCraft:\e[0m
          "За время разработки лифкрафтов, я очень много слышал жалоб на
           веб-разработчиков, которые умудрялись не обращать внимания на
           содержимое форм, подписи к элементам, кнопкам, уведомлении об
           ошибках, или когда встречали английские названия на русском
           сайте, и наоборот."
    EOS

    slide <<-EOS, :block
      \e[1mРепортер:\e[0m
          "Василий Петрович, какими должны быть формы на всем сайте?"
      \e[1mВасилий Петрович, фрезеровщик 1-го разряда:\e[0m
          "Меня очень раздражает когда сайты выглядят не красиво. Я по профессии
           люблю красоту и единообразие, поэтому и когда во время отдыха я выхожу
           в интернет, меня очень коробят сайты, где все абы как."
    EOS

    slide <<-EOS, :block
      \e[1mРепортер:\e[0m
          "Мария Ивановна, как ваши дети относятся к нестандартным элементам формы?"
      \e[1mМария Ивановна, учитель информатики в начальных классах:\e[0m
          "Дети вполне хорошо ориентируются на сайтах (пожалуй лучше меня),
           легко работают с разными формочками, где могут быть непривычные
           поля, кнопки или элементы."
    EOS

    slide <<-EOS, :block
      \e[1mРепортер:\e[0m
          "Евгений, как вы относитесь к сайтам, в которых используются Twitter
           Bootstrap, или Zurb Foundation?"
      \e[1mЕвгений, фрилансер:\e[0m
          "Нормально. Это очень популярные инструменты, которые используют
           очень многие. Мне часто поступают заказы, с бюджетным дизайном,
           который рассчитан на использование подобных инструментов, а также
           иногда просят сделать что-то для внутреннего использования, и о
           профессиональном дизайне речи не идет."
    EOS

  end

  section "Форма в HTML с точки зрения Rails" do

    slide <<-EOS, :center
      Пуповина, через которую, пользователь кормит приложение.
    EOS

    slide <<-EOS, :center
      PUT, DELETE, PATCH... мы не умеем!
    EOS

    slide <<-EOS, :center
      Протокол в себе.
    EOS

    slide <<-EOS, :center
      Форма - взгляд на модель сквозь немного кривоватую призму.
    EOS

    slide <<-EOS, :center
      Не только поля, но и коллекции и ассоциации.
    EOS

    slide <<-EOS, :center
      А как же дочерние модели?
    EOS

  end

  section "Форма в HTML с точки зрения backend разработчика" do

  end

  section "Форма в HTML с точки зрения frontend разработчика" do

  end

  slide <<-EOS, :center
    \e[1mЭто все, с чем мы сталкиваемся ежедневно...\e[0m
  EOS

  slide <<-EOS, :center
    \e[1m...но не задумываемся об этом!\e[0m
  EOS

end

section "Жизненный цикл или Раковая опухоль на проекте" do

  slide <<-EOS, :code, lang: :ruby
    class User < ActiveRecord::Base

      attr_accessor :password_confirmation
      attr_accessible :email, :password, :password_confirmation

    end

    class CreateUsers < ActiveRecord::Migration

      def change
        create_table :users do
          t.string :email, null: false, default: ''
          t.string :password, null: false, default: ''
        end

        add_index :users, :email, unique: true
      end

    end
  EOS

  slide <<-EOS, :center
    Теперь у нас есть пользователи! Но им же надо регистрироваться!
  EOS

  slide <<-EOS, :code, lang: :erb
    <%= form_for @user, url: users_path, html: { method: :post } do |f| %>
      <div class="inputs">
        <div class="input">
          <%= f.label :email %>
          <%= f.text_field :email %>
        </div>
        <div class="input">
          <%= f.label :password %>
          <%= f.password_field :password %>
        </div>
        <div class="input">
          <%= f.label :password_confirmation %>
          <%= f.password_field :password %>
        </div>
      </div>
      <div class="actions">
        <%= f.submit %>
      </div>
    <% end %>
  EOS

  slide <<-EOS, :center
    Что-то забыли? Кажется да... Поддержка HTML5!
  EOS

  slide <<-EOS, :code, lang: :erb
    <%# Заменим этот код %>
    <%= f.text_field :email %>

    <%# следующим кодом %>
    <%= f.email_field :email %>

    <%# и получим валидацию email на клиенте! %>
  EOS

  slide <<-EOS, :center
    Добавим валидаторы для пользователей
  EOS

  slide <<-EOS, :code, lang: :ruby
    class User < ActiveRecord::Base

      attr_accessor :password_confirmation
      attr_accessible :email, :password, :password_confirmation

      validates :email, :password, presence: true
      validates :password, confirmation: true

    end
  EOS

  slide <<-EOS, :center
    У нас появились ошибки. Так покажем их пользователю!
  EOS

  slide <<-EOS, :code, lang: :erb
    <%# Для вывода ошибок добавим такой код в начало формы %>

    <% if @user.errors.any? %>
      <h2><%= pluralize(@user.errors.count, "error") %> prohibited this user from being saved:</h2>
      <ul>
        <% @user.errors.full_messages.each do |msg| %>
          <li><%= msg %></li>
        <% end %>
      </ul>
    <% end %>

    <%# P.S. Это не наигранно! Такой код генерируется Rails для scaffold. %>
  EOS

  slide <<-EOS, :center
    Наше приложение будет на нескольких языках.

    Воспользуемся средствами интернационализации.
  EOS

  slide <<-EOS, :code, lang: :yaml
    ru:
      activerecord:
        attributes:
          user:
            email: 'Электронная почта'
            password: 'Пароль'
            password_confirmation: 'Повторите пароль'
      helpers:
        submit:
          user:
            create: "Зарегистрироваться!"
  EOS

  slide <<-EOS, :center
    Расширим нашу форму регистрации, чтобы она стала более правдоподобной.
  EOS

  slide <<-EOS, :code, lang: :ruby
    class User < ActiveRecord::Base

      attr_accessor :password_confirmation
      attr_accessible :email, :password, :password_confirmation

      has_one :profile, dependent: :destroy

      validates :email, :password, presence: true
      validates :password, confirmation: true

    end
  EOS

  slide <<-EOS, :code, lang: :ruby
    class City < ActiveRecord::Base
    end

    class CreateCities < ActiveRecord::Migration

      def change
        create_table :cities do |t|
          t.string :name, null: false, default: ''
        end
      end

    end
  EOS

  slide <<-EOS, :code, lang: :ruby
    class Profile < ActiveRecord::Base

      attr_accessible :first_name, :last_name, :bio, :birthday, :city_id

      belongs_to :user
      belongs_to :city

      validates :first_name, :last_name, :bio, :birthday, presence: true

    end

    class CreateProfiles < ActiveRecord::Migration

      def change
        create_table :profiles do |t|
          t.string :first_name, null: false, default: ''
          t.string :last_name, null: false, default: ''
          t.text :bio, null: false, default: ''
          t.date :birthday, null: false
          t.references :user
          t.references :city
        end

        add_index :profiles, :user_id, unique: true
        add_index :profiles, :city_id
      end

    end
  EOS

  slide <<-EOS, :center
    Теперь добавим профиль на форму регистрации.
  EOS

  slide <<-EOS, :code, lang: :ruby
    <%= form_for @user, url: users_path, html: { method: :post } do |f| %>
      <%# ... %>
        <%= f.fields_for :profile do |pf| %>
          <div class="input">
            <%= pf.label :first_name %>
            <%= pf.text_field :first_name %>
          </div>
          <div class="input">
            <%= pf.label :last_name %>
            <%= pf.text_field :last_name %>
          <div>
          <div class="input">
            <%= pf.label :birthday %>
            <%= pf.date_select :birthday %>
          </div>
          <div class="input">
            <%= pf.label :city %>
            <%= pf.select :city, options_from_collection_for_select(City.all, :id, :name) %>
          </div>
          <div class="input">
            <%= pf.label :bio %>
            <%= pf.text_area :bio %>
          </div>
        <% end %>
      <%# ... %>
    <% end %>
  EOS

  slide <<-EOS, :center
    Это была только подформа. Для полной формы экрана уже не хватит.
  EOS

  slide <<-EOS, :center
    Какие еще мелочи остались за кадром?
  EOS

  slide <<-EOS, :center
    Поля обязательные для заполнения

    - подписи к полям должны быть помечены (например, звездочкой);
    - хелперам полей нужно явно передать `required: true`, если используется HTML5.
  EOS

  slide <<-EOS, :center
    В примере не использовались CSS классы, и расширенная верстка.

    - представим, если форма изначально будет переписана на Twitter Bootstrap;
    - а потом будет привязан готовый дизайн.
  EOS

  slide <<-EOS, :center
    За кадром остались вопросы подсказок и сообщений об ошибках:

    - подсказки и их локализация на плечах разработчиков;
    - нет стандартного инструмента для выдачи сообщений об ошибках около полей.
  EOS

  slide <<-EOS, :center
    Расползание нестандартных решений по проекту методом copy/paste.
  EOS

  slide <<-EOS, :center
    \e[1mСОПРОВОЖДЕНИЕ => АД\e[0m

    \e[1mФОРМЫ => ОГРОМНАЯ РАКОВАЯ ОПУХОЛЬ\e[0m
  EOS

end

section "Хватит это терпеть! или Профилактика рака" do

  slide <<-EOS, :center
    \e[1mВстречаем: Simple Form от Plataformatec (создатели Devise)\e[0m

    Лекарство от рака найдено!
  EOS

  slide <<-EOS, :code, lang: :erb
    <%= simple_form_for @user do |f| %>

      <div class="inputs">
        <%= f.input :email %>
        <%= f.input :password %>
        <%= f.input :password_confirmation %>
        <%= f.simple_fields_for @profile do |pf| %>
          <%= pf.input :first_name %>
          <%= pf.input :last_name %>
          <%= pf.input :birthday %>
          <%= pf.association :city %>
          <%= pf.input :bio %>
        <% end %>
      </div>

      <div class="actions">
        <%= f.submit %>
      </div>

    <% end %>
  EOS

  slide <<-EOS, :center
    \e[1mIT'S AMAZING! I'M SUPERHERO!\e[0m
  EOS

  section "Элементы управления" do

    slide <<-EOS, :code, lang: :erb
      <%# Подписи к полям, а также подсказки можно изменить %>
      <%= f.input :email, label: 'Custom label', hint: 'Custom hint' %>
    EOS

    slide <<-EOS, :code, lang: :erb
      <%# HTML атрибуты можно передать как для label, так и для input %>
      <%= f.input :email, label_html: { ... }, input_html: { ... } %>
    EOS

    slide <<-EOS, :code, lang: :erb
      <%# Можно также передать HTML атрибуты для обрамляющего элемента %>
      <%= f.input :email, wrapper_html: { ... } %>
    EOS

    slide <<-EOS, :code, lang: :erb
      <%# Надписи и подсказки можно вообще отключить %>
      <%= f.input :email, label: false, hint: false %>
    EOS

    slide <<-EOS, :code, lang: :erb
      <%# Или сделать надпись в одну строку %>
      <%= f.input :remember_me, inline_label: 'Remember me?' %>
    EOS

    slide <<-EOS, :code, lang: :erb
      <%# Для совсем извращенных случаев, есть отдельные блоки %>

      <%= simple_form_for @user do |f| %>
        <%= f.label :username %>
        <%= f.input_field :username %>
        <%= f.hint 'No special characters, please!' %>
        <%= f.error :username, :id => 'user_name_error' %>
        <%= f.full_error :token %>
        <%= f.submit 'Save' %>
      <% end %>

      <%# ПРЕДУПРЕЖДАЮ: РУКИ БУДУ ОТРУБАТЬ ЗА ТАКОЕ %>
    EOS

  end

  section "Коллекции и ассоциации" do

    slide <<-EOS, :code, lang: :erb
      <%= simple_form_for @user do |f| %>
        <%= f.input :user %>
        <%= f.input :age, :collection => 18..60 %>
        <%= f.button :submit %>
      <% end %>
    EOS

    slide <<-EOS, :code, lang: :erb
      <%# Можно задать приглашение для выбора %>
      <%= f.input :age, :collection => 18..60, :prompt => "Select your age" %>

      <%# А вот так можно отсортировать %>
      <%= f.input :country_id, :collection => @continents, :as => :grouped_select, :group_method => :countries %>

      <%# И даже выставить приоритеты %>
      <%= f.input :shipping_country, :priority => [ "Brazil" ], :collection => [ "Australia", "Brazil", "New Zealand"] %>
    EOS

    slide <<-EOS, :code, lang: :erb
      <%= simple_form_for @user do |f| %>
        <%= f.input :name %>
        <%= f.association :company %>
        <%= f.association :roles %>
        <%= f.button :submit %>
      <% end %>

      <%# Можно указать какой виджет использовать %>
      <%= f.association :company, :as => :radio_buttons %>
      <%= f.association :roles,   :as => :check_boxes %>

      <%# Можно явно задать коллекцию %>
      <%= f.association :company, :collection => Company.active.all(:order => 'name'), :prompt => "Choose a Company" %>

      <%= f.association :company, :label_method => :company_name, :value_method => :id, :include_blank => false %>
    EOS

    slide <<-EOS, :code, lang: :erb
      <%# Немножно новогодней магии %>
      <%= f.association :company do |c| %>
        <%= c.input :name %>
        <%= c.input :type %>
      <% end %>

      <%= f.simple_fields_for :company do |c| %>
        <%= c.input :name %>
        <%= c.input :type %>
      <% end %>
    EOS

  end

  section "Интеграция с ActiveModel" do
    slide <<-EOS, :block
      Simple Form сам определит:

      - когда поле обязательное;
      - тип поля, и наиболее подходящий ему элемент управления.
    EOS

    slide <<-EOS, :code, lang: :erb
      <%# Механизм mapping сам определяет какой элемент управления больше соответствует полю модели %>
      <%= f.input :email %> <%# => <input type="email" ... /> %>

      <%# Но можно явно указать и вручную %>
      <%= f.input :email, as: :text %>
    EOS
  end

  section "Интернационализация" do

    slide <<-EOS, :code, lang: :yaml
      en:
        simple_form:
          labels:
            user:
              username: 'User name'
              password: 'Password'
          hints:
            user:
              username: 'User name to sign in.'
              password: 'No special characters, please.'
          placeholders:
            user:
              username: 'Your username'
              password: '****'
    EOS

    slide <<-EOS, :code, lang: :yaml
      en:
        simple_form:
          labels:
            user:
              username: 'User name'
              password: 'Password'
              edit:
                username: 'Change user name'
                password: 'Change password'
    EOS

    slide <<-EOS, :code, lang: :yaml
      en:
        simple_form:
          labels:
            defaults:
              username: 'User name'
              password: 'Password'
              new:
                username: 'Choose a user name'
          hints:
            defaults:
              username: 'User name to sign in.'
              password: 'No special characters, please.'
          placeholders:
            defaults:
              username: 'Your username'
              password: '****'
    EOS

    slide <<-EOS, :code, lang: :yaml
      en:
        simple_form:
          options:
            user:
              gender:
                male: 'Male'
                female: 'Female'
    EOS

    slide <<-EOS, :code, lang: :yaml
      en:
        helpers:
          submit:
            user:
              create: "Add %{model}"
              update: "Save Changes"
    EOS

    slide <<-EOS, :code, lang: :yaml
      en:
        activerecord:
          models:
              admin/user: User
          attributes:
              admin/user:
                  name: Name
        simple_form:
          labels:
              admin_user:
                  name: Name
    EOS

  end

  section "Расширяемость" do

    slide <<-EOS, :code, lang: :ruby
      # app/inputs/currency_input.rb
      class CurrencyInput < SimpleForm::Inputs::Base
        def input
          "$ \#{@builder.text_field(attribute_name, input_html_options)}".html_safe
        end
      end

      f.input :money, :as => :currency
    EOS

    slide <<-EOS, :code, lang: :ruby
      # app/inputs/date_time_input.rb
      class DateTimeInput < SimpleForm::Inputs::DateTimeInput
        def input
          template.content_tag(:div, super)
        end
      end
    EOS

    slide <<-EOS, :code, lang: :ruby
      # app/inputs/collection_select_input.rb
      class CollectionSelectInput < SimpleForm::Inputs::CollectionSelectInput
        def input_html_classes
          super.push('chosen')
        end
      end
    EOS

    slide <<-EOS, :code, lang: :ruby
      def custom_form_for(object, *args, &block)
        options = args.extract_options!
        simple_form_for(object, *(args << options.merge(:builder => CustomFormBuilder)), &block)
      end

      class CustomFormBuilder < SimpleForm::FormBuilder
        def input(attribute_name, options = {}, &block)
          options[:input_html].merge! :class => 'custom'
          super
        end
      end
    EOS

  end

  section "Конфигурация" do

    slide <<-EOS, :code, lang: :ruby
      config.wrappers :tag => :div, :class => :input,
                      :error_class => :field_with_errors do |b|

        # Form extensions
        b.use :html5
        b.optional :pattern
        b.use :maxlength
        b.use :placeholder
        b.use :readonly

        # Form components
        b.use :label_input
        b.use :hint,  :wrap_with => { :tag => :span, :class => :hint }
        b.use :error, :wrap_with => { :tag => :span, :class => :error }
      end

      :label         # The <label> tag alone
      :input         # The <input> tag alone
      :label_input   # The <label> and the <input> tags
      :hint          # The hint for the input
      :error         # The error for the input
    EOS

    slide <<-EOS, :code, lang: :ruby
      # Оболочка с преферансом и красивыми женщинами

      config.wrappers do |b|
        b.use :placeholder
        b.use :label_input
        b.wrapper :tag => :div, :class => 'separator' do |component|
          component.use :hint,  :wrap_with => { :tag => :span, :class => :hint }
          component.use :error, :wrap_with => { :tag => :span, :class => :error }
        end
      end
    EOS

    slide <<-EOS, :code, lang: :ruby
      # Внутренние оболочки можно именовать

      config.wrappers do |b|
        b.use :placeholder
        b.use :label_input
        b.wrapper :my_wrapper, :tag => :div, :class => 'separator' do |component|
          component.use :hint,  :wrap_with => { :tag => :span, :class => :hint }
          component.use :error, :wrap_with => { :tag => :span, :class => :error }
        end
      end

      # Completely turns off the custom wrapper
      f.input :name, :my_wrapper => false

      # Configure the html
      f.input :name, :my_wrapper_html => { :id => 'special_id' }

      # Configure the tag
      f.input :name, :my_wrapper_tag => :p
    EOS

    slide <<-EOS, :code, lang: :ruby
      # Использование опциональных элементов

      config.wrappers :placeholder => false do |b|
        b.use :placeholder
        b.use :label_input
        b.wrapper :tag => :div, :class => 'separator' do |component|
          component.optional :hint, :wrap_with => { :tag => :span, :class => :hint }
          component.use :error, :wrap_with => { :tag => :span, :class => :error }
        end
      end
    EOS

  end

  section "И еще немножко печенек" do
    slide <<-EOS, :code, lang: :ruby
      # Включение/отключение режима HTML5
      SimpleForm.html5 = false

      # Или только HTML5 валидации
      SimpleForm.browser_validations = false

      # HTML5 валидацию также можно отключить и для отдельно взятой формы
      # <%= simple_form_for(resource, :html => {:novalidate => true}) do |form| %>
    EOS

    slide <<-EOS, :center
      \e[1mИнтеграция с Twitter Bootstrap из коробки\e[0m
    EOS

    slide <<-EOS, :block
      \e[1mИнтеграция с Zurb Foundation из коробки\e[0m

      * в минорной следующей версии;
      ** конфигурацию можно взять уже сейчас;
      *** hint в режиме интеграции Foundation отключены
    EOS
  end

end

section "Неужели нет конкурентов?" do

  slide <<-EOS, :center
    Конкуренты? Конечно есть!
  EOS

  slide <<-EOS, :center
    Встречаем formtastic!
  EOS

  slide <<-EOS, :block
    Но мне он ненравится, потому что:

    - оно тянет свои стили (красиво, но я*** лошадки примерзли к забору);
    - нет понятия оболочек. Совсем.
    - а теперь еще и нельзя наследовать свои form builders.

    В целом неплохо. Но все таки, Бразилия круче.
  EOS

end

section "Зачем вы слушали меня?" do end

section "Скажем маленькое спасибо" do

  slide <<-EOS, :block
    Создателям:

    José Valim (Plataformatec / Бразилия)
    Carlos Antonio da Silva (Plataformatec / Бразилия)
    Rafael Mendonça França (Plataformatec / Бразилия)
    Vasiliy Ermolovich (BrainSpec / Белоруссия)
  EOS

  slide <<-EOS, :center
    Спасибо Вам за внимание!
  EOS

  slide <<-EOS, :center
    И особое спасибо тем, для кого это не просто yet another presentation.
  EOS

end

section "Спасибо за внимание! Теперь ваша очередь." do end
