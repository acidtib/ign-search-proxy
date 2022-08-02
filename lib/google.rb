require_relative "html_parser"

class Google
  include HTTParty
  format :html
	parser HtmlParserIncluded

	base_uri "https://www.google.com"

	headers "Accept" => "text/html", "User-Agent" => UA.random

	resend_on_redirect

	def site(query = nil)
		raise ArgumentError, "You must search for something" if query.nil?

		options = {
			query: {
				q: "site:ign.com #{query}"
			}
		}

		self.class.get("/search", options)
	end

	def wiki(query = nil)
		raise ArgumentError, "You must search for something" if query.nil?

		options = {
			query: {
				q: "site:ign.com/wikis #{query}"
			}
		}

		self.class.get("/search", options)
	end
end