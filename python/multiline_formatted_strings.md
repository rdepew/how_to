# Multiline formatted strings in Python

This is immediately useful, because you will use it to make
JSON objects.

* Use triple quotes """, the standard way to generate multiline
  strings in Python.
* Use f-string formatting to insert variables.
* Note that any brackets used in the JSON content must be escaped, that is 
  doubled: {{ and }} instead of { and }.  This is because the f-string 
  uses single brackets for variables.

## Example

```
a="Hello"
b=f"""{{
    'pigs': 33
    'dogs': 'arf arf'
    'greeting': '{a}'
}}"""
```

Output is:
```
{
    'pigs': 33,
    'dogs': 'arf arf',
    'greeting': 'Hello
}
```
