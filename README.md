# IGN Search Proxy

Small google search proxy for [ign.com](https://ign.com) and [ign.com/wikis](https://ign.com/wikis)

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

### Search Site
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

```json
# use all=1 to get all matches

GET /api/v1/search/site?q=Cyberpunk 2077&all=1

response-
{
  "data": [
    {
      "title": "Cyberpunk 2077 [News] - IGN",
      "url": "https://www.ign.com/games/cyberpunk-2077"
    },
    {
      ....
    },
  ]
}
```