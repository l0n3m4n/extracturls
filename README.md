# ExtractURLs

A simple Bash utility for extracting URLs from [GoSpider](https://github.com/jaeles-project/gospider) output, filtering them by a target domain, removing duplicates, and saving the results to a file.

## Features

- Reads files from a GoSpider output directory
- Extracts URLs using `xurls`
- Filters URLs for the specified target domain
- Removes duplicate URLs
- Saves results to `<domain>_urls.txt`

## Requirements

- Linux
- Bash
- Go
- `xurls`
- GoSpider output

## Gospider command 
```bash
gospider -S https-subs.txt -o gooutput -c 10 -d 3 -t 20
```

## Installation

Clone the repository:

## Install xurls   
```bash
go install github.com/mvdan/xurls/cmd/xurls@latest
```

```bash
git clone https://github.com/l0n3m4n/extracturls.git
cd extracturls
```
```bash
./extracturls.sh -f <gospider_output_folder> -d <target_domain>
./extracturls.sh -f gospider_output -d example.com
```
#### Ouput 
```bash
example.com_urls.txt
```
