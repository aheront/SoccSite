module FormHelper
  def setup_user(user)
   user.street ||= Street.new

     user.streets.build
    user
  end
  def setup_street(street)
    street.city ||= City.new

    street.cities.build
    street
  end
  def setup_city(city)
    city.country ||= Country.new

    city.countries.build
    city
  end
end