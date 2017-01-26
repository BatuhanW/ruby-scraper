Tiny Restful API for parsing h1, h2, h3 and links for given url.

# Endpoints

GET 'v1/indexes'

POST 'v1/indexes', url: 'https://www.google.com'

# Index Model

default: ```<Index id: nil, url: "", content: {"h1"=>"", "h2"=>"", "h3"=>"", "links"=>[]}, status: "pending", created_at: nil, updated_at: nil>```

indexed: <Index id: 583916550, url: "https://www.wikipedia.com", content: {"h1"=>"Heading 1", "h2"=>"Heading 2", "h3"=>"Heading 3", "links"=>["https://www.google.com", "https://www.wikipedia.com"]}, status: "indexed", created_at: "2017-01-26 06:58:56", updated_at: "2017-01-26 06:58:56">

# Flow

Posting indexes url, will create Index record on the database with given url.

Index model will trigger IndexerJob to parse URL's elements, save to content json and update the status.

Indexer Job will parse html with ParserService.
