# The watch command

Just discovered this command today, by looking over someone's shoulder.

`watch` allows you to run a command repeatedly, seeing how the output changes.

To watch the date update every second:
```
watch -n 1 'date'
```

To watch the date update every 5 seconds:
```
watch -n 5 'date'
```

To watch the /tmp/bogus-data directory contents change every 10 seconds:
```
watch -n 10 'ls /tmp/bogus-data'
```

`watch` has other useful options as well. Type `man watch` or `watch --help` to read about them.
