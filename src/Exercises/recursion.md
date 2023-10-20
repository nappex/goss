---
Title: Handle recursion
Date: 2021-6-25
Category: Exercises
Tags: exercises, beginners, recursion
Slug: handle_recursion
Authors: David
Summary: Simple example of how to make recursion
Status: published
---

[TOC]

# Recursion of paths to file originally created as dict

The goal of this example is to join path parts
save in dict to full path and saved to list.

Let imagine that we parse paths to file to dict as following:

```python
paths_as_dict = {
                {'home':
                    {'web_app1': {
                        'index1.html': b'Content of file',
                        'index2.html': b'Content of file'}
                    },
                    {'web_app2': {
                        'index.html': b'Content of file'},
                        'static': {'image.jpg': b'Content of file'}
                    }
                }
                'index.html',
            }
```

result of example shoudld be:

```python
result = [
            'home/web_app1/index1.html',
            'home/web_app1/index2.html',
            'home/web_app2/index.html',
            'home/web_app2/static/image.jpg',
            'index.html'
        ]
```


## Solution without recursion

```python
result = []
for key1, value1 in paths_as_dict.items():
    if isinstance(value1, bytes):
        result.append(key1)
    else:
        for key2, value2 in value1.items():
            if isinstance(value2, bytes):
                result.append(key1 + '/' + key2)
            else:
                for key3, value3 in value2.items():
                    if isinstance(value3, bytes):
                        result.append(key1 + '/' + key2 + '/' + key3)
                    else:
                        ...

```

This solution is fine. It is working and we get the result. But it is obvious
the solution will work fine only for specific input.

This solution have these problems:

- we get input with very long path. we have to make 10 `for cycle` if our the longest
path will contain 10 parts. So imagine case when you will not know length of the
longest path. We can solve this problem - we will create 30 `for cycle`.
We have to believe, we never get longer path. We do not want to write code like that.
So the solution won't work for every input.

- DRY - Don't Repeat Yourself. The code has several `for cycles` which contain
same parts. Only two parts are updated:
    - path, which is saved to result,
    - and input dictionary.


To resolve problems above we use recursion.

## Recursion solution

Arguments will be variable which are updated in solution without recusrion:
- path, which is saved to result `path_so_far`,
- and input dictionary `input_dict`.

```python
result = []

def recursion_solution(input_dict, path_so_far):
    for key, value in input_dict.items():
        if isinstance(value, bytes):
            result.append(path_so_far + key)
        else:
            recursion_solution(value, path_so_far + key + '/')

recursion_solution(paths_as_dict, '')
```

Obviously, the recursion solution is much more elegant then previous solution.

The most hardest part was to define variable `path_so_far` in combination
with variable `key` and slash '/'.