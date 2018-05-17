# crystal-methrics

Send any metric, from anywhere, using a simple HTTP request and get it visualized.
No SDKs, not pricey metric frameworks, and no special strcuture or scheme: `<crystal-methrics-domain>/metric/my-event/value/100`

## Data Flow

Crystal Router --> Redis Cache --> Logstash Enrichment --> ElasticSearch --> Visualization

## Installation

Lazy?
```
docker compose up
```
Yes, that's it.

Looking for robustness? 
Deploy logstash as a container service in your production infrastructure.
Deploy Redis anywhere e.g ElasticCache.
Deplou ElasticSearch anywhere e.g AWS's ElasticSearch as a Service.
Deploy Crystal Methrics as a binary / docker container / whereever.

## Usage

```
<crystal-methrics-domain>/metric/my-event/value/100
```

## Contributing

1. Fork it ( https://github.com/[your-github-name]/crystal-methrics/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[your-github-name]](https://github.com/[your-github-name]) omerxx - creator, maintainer
