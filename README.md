# Site Analytics

[![gh-actions](https://github.com/terenceponce/site_analytics/workflows/Continuous%20Integration/badge.svg)](https://github.com/terenceponce/site_analytics/actions?workflow=Continuous+Integration)
[![Coverage Status](https://coveralls.io/repos/github/terenceponce/site_analytics/badge.svg?branch=master)](https://coveralls.io/github/terenceponce/site_analytics?branch=master)

This tool processes data from a log file and shows information about a site's analytics.

## How to use

Just run the executable inside the `bin/` directory and select the file to process like so:

```
bin/analytics webserver.log
```

## Features/Things To Do

- [x] Basic Parsing and Presentation
- [x] Using a database to collect the parsed data
- [x] Sort pages according to number of views
- [x] Show number of unique visits
