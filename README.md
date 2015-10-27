ruby-shorty
===========
Very simple URL shortener

How it works?
-------------
- ```GET /<rid>``` redirects to rid's URL
- ```PUT``` puts URL and returns it's ```rid```

As ruby-shorty doesn't care about any auth one should secure ```PUT``` on his/her own.
