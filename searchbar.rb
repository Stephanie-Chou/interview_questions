def search
	@results = getSearchResults(params[:input])

	if request.xhr?
		render :json => @results.to_json
	end
end

describe "GET Index" do
	it "render template" do
		get :index
		expect (response).to render_template(:index)
	end

	it 'succeed' do
		get :index
		expect (response.status).to_eq(200)
	end
end

arr = [1,22,3,4,5,64]

class Array
	def my_each
		self.length.times do |i|
			yield(self[i])
		end
	end

	def my_select
		arr = []
		self.my_each do |i|
			arr << i if yield(i)
		end
		arr
	end

	def my_reject
		arr = []
		self.my_each do |i|
			arr << i unless yield(i)
		end
		arr
	end

	def my_find
		self.my_each do |i|
			return i if yield(i)
		end
	end

	def my_map
		arr = []
		self.my_each do |i|
			arr << yield(i)
		end
		arr
	end

	def my_reduce(start)
		total = start
		self.my_each do |i|
			total = yield(total,i)
		end
		return total
	end

	def my_all
		self.my_each do |i|
			return false unless yield(i)
		end
		return true
	end
end

# arr.my_each{|i| i }

# p select_arr = arr.my_select{|i| i.even?}
# p reject_arr = arr.my_reject{|i| i.even?}
# p find_arr = arr.my_find{|i| i%5 == 0}
# p map_arr = arr.my_map{|i| i*2}
# p "*"*10
# p reduce_arr = arr.my_reduce(0){|total, element| total+element}
# p arr.reduce(0){|total, element| total+element}

# p all_arr = arr.my_all{|i| i.even?}
# p all_arr = arr.my_all{|i| (i*2).even?}


str = "my name is stephanie. i like cookies."

def longestword(str)
	str = str.gsub(/[^\w\s]/, '')
	max_word = ''
	str.split(' ').each do |word|
		max_word = word if word.length > max_word.length
	end
	return max_word
end

p str.gsub(/[^\w\s]/, '')
p longestword(str)
p str.gsub(/[^\w\s]/, '').split(' ').map {|word| word.length}
