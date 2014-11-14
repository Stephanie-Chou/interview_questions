# readin text

def readText(txt)
  lines = File.readlines(txt)
end

# parse text
def parse(txt)
  country = {}
  app = {}

# ["country=USA", "app=fandango"...]
# [[country,USA], [app,fandango]...]
  lines = readText(txt)

  lines.each do |line|
    # remove first part of url
    line.gsub!('www.liftoff.io/analytics?','')

    line.split!('&')
    line.each do |pair|
      pair.split!('=')

      if pair.first == 'country'
        if country.has_key?(pair.last)
          country[pair.last] += 1
        else
          country[pair.last] = 1
        end
      end
      if pair.first == 'app'
        if app.has_key?(pair.last)
          app[pair.last] += 1
        else
          app[pair.last] = 1
        end
      end

    end
  end

  sorted_country = country.sort_by{|key, value| value}
  sorted_app = app.sort_by{|key,value| value}

  sorted_country.each do |element|
    print "#{element.first} #{element.last}"
  end
  sorted_app.each do |element|
    print "#{element.first} #{element.last}"
  end

end

def store