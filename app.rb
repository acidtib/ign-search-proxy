class Nani < Sinatra::Base

	register Sinatra::Cors
	register Sinatra::Namespace
	register Sinatra::StrongParams

	set :show_exceptions, :after_handler

	set :allow_origin, "*"
  set :allow_methods, "GET,HEAD,POST"
  set :allow_headers, "content-type,if-modified-since"
  set :expose_headers, "location,link"

	before do
    content_type 'application/json'
  end

  get "/" do
    "Hello World!".to_json
  end

	namespace '/api/v1' do

		# matches "GET /api/v1/search/wiki?q=Cyberpunk 2077"
		get '/search/:mode', needs: [:mode, :q], allows: [:all] do
			q = params[:q]
			all = params[:all] || 0
			mode = params[:mode]

			google = Google.new()

			if mode == "wiki"
				doc = google.wiki(q)
			elsif mode == "site"
				doc = google.site(q)
			else
				raise RuntimeError, "wrong mode, site or wiki"
			end

			payload = {data: []}

			doc.css("#search #rso div.g").each do |result|
				sec = result.xpath("./div/div[1]/div/a")[0]
				url = sec["href"]
				title = sec.xpath("./h3").text

				match = title.downcase.scan(Regexp.union(q.downcase.split))
				
				if all.to_i == 1
					payload[:data] << {title: title, url: url}
				else
					if q.downcase.split.length == match.length
						payload[:data] << {title: title, url: url}
						break
					end
				end
			end

			payload.to_json
		end

	end


	error do
		[500, {error: 'Sorry there was a nasty error - ' + env['sinatra.error'].message}.to_json]
	end

	error RequiredParamMissing do
		[400, {error: env['sinatra.error'].message}.to_json]
	end

	error RuntimeError do
		[500, {error: env['sinatra.error'].message}.to_json]
	end

end