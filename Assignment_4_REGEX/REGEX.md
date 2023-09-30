# 1) Extract the date from the web page: www.timeanddate.com
## Regex String:

```bash
([0-9]{2}\/[0-9]{2}\/[0-9]{4})|([A-Z][a-z]{2,8} [0-9]{1,2}, [0-9]{4})
```

# 2) Extract the IPv4 address from the web page: https://www.myip.com/
## Regex String:

``` bash
((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)
```

# 3) Extract the main headline from the web page: www.ynet.co.il
## Regex String:

```bash
<h1 class="slotTitle"[^>]*><span[^>]*>\K[^<]*
```

# 4) Extract the download link from the web page: www.bugzilla.org
## Regex String:

```bash
<a title="Download Bugzilla" href="\K[^"]*
```

# 5) Extract the first tutorial name from the web page: https://jmeter.apache.org/
## Regex String:

```bash
Tutorials[a-z\s<>\"\d=:\-\/\.;_]*\">([\w ]*)<\/a>
```

# 6) Extract list of student names from the web page: www.moodle.sce.ac.il
## Regex String:

```bash
Unfortunately, Moodle does not allow web scraping. Protected by 2FA.
```

# 7) Extracting job titles from the web page: www.linkedin.com
## Regex String:

```bash
listedAt&quot;:[0-9]+,&quot;title&quot;:&quot;([\w ,;():\/\&]+)&quot;,&quot;
```

# 8) Extracting ‘software non-functional testing’ books from the web page: www.amazon.com
## Regex String:

```bash
<span class="a-size-medium a-color-base a-text-normal">\K[^<]+
```