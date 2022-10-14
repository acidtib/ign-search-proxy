# IGN Search Proxy

Small google search proxy for [ign.com](https://ign.com), [ign.com/games](https://ign.com/games), [ign.com/articles](https://ign.com/articles) and [ign.com/wikis](https://ign.com/wikis)

## Quick Start
---
```
bundle install
```

```
foreman start
```

visit `http://localhost:5000`

## Deploy to Production
[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/f220i8?referralCode=nLHZEt)

## API

There is an instance running at `https://ign-search.acidtib.com`

### Search Wiki Guides
```
GET /api/v1/search/wiki
params: 
		q = search query
		all = return all results, default is 0
```
examples:
```json
# by default only 1 matching result is returned

GET /api/v1/search/wiki?q=Cyberpunk 2077

response-
{
  "data": [
    {
      "title": "Cyberpunk 2077 Wiki Guide - IGN",
      "url": "https://www.ign.com/wikis/cyberpunk-2077/"
    }
  ]
}

# search by game objective

GET /api/v1/search/wiki?q=Cyberpunk 2077 The Heist

response-
{
  "data": [
    {
      "title": "The Heist - Cyberpunk 2077 Wiki Guide - IGN",
      "url": "https://www.ign.com/wikis/cyberpunk-2077/The_Heist"
    }
  ]
}
```

```json
# use all=1 to get all matches

GET /api/v1/search/wiki?q=Cyberpunk 2077&all=1

response-
{
  "data": [
    {
      "title": "Cyberpunk 2077 Wiki Guide - IGN",
      "url": "https://www.ign.com/wikis/cyberpunk-2077/"
    },
    {
      ....
    },
  ]
}
```

---
### Search Games
```
GET /api/v1/search/game
params: 
		q = search query
		all = return all results, default is 0
```
examples:
```json
# by default only 1 matching result is returned

GET /api/v1/search/game?q=Scorn

response-
{
  "data": [
    {
      "title": "Scorn - IGN",
      "url": "https://www.ign.com/games/scorn"
    }
  ]
}
```

---
### Search Articles
```
GET /api/v1/search/article
params: 
		q = search query
		all = return all results, default is 0
```
examples:
```json
# by default only 1 matching result is returned

GET /api/v1/search/article?q=Scorn

response-
{
  "data": [
    {
      "title": "Scorn Review - IGN",
      "url": "https://www.ign.com/articles/scorn-review"
    }
  ]
}
```

---
### Search Entire Site
```
GET /api/v1/search/site
params: 
		q = search query
		all = return all results, default is 0
```
examples:
```json
# by default only 1 matching result is returned

GET /api/v1/search/site?q=Cyberpunk 2077

response-
{
  "data": [
    {
      "title": "Cyberpunk 2077 [News] - IGN",
      "url": "https://www.ign.com/games/cyberpunk-2077"
    }
  ]
}
```