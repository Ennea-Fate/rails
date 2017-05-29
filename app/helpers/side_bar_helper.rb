module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'},
      {:name => 'Добавление роли',
       :controller => :roles, :action => :new,
       :icon => 'align-center',
       :class => 'long'},
      {:name => 'Водители',
       :controller => :drivers, :action => :index,
       :class => 'long',
       :icon => 'user'},
      {:name => 'Заказы',
       :controller => :orders, :action => :index,
       :icon => 'list',
       :class => 'long'},
      {:name => 'Поиск заказов',
       :controller => :orders, :action => :search,
       :icon => 'search',
       :class => 'long'}
    ]} 
    result
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s  
    else
      false
    end
  end
end
