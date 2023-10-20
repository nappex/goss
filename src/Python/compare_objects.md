---
Title: Comparing objects in python
Date: 2020-11-19
Category: Python
Tags: python, intermediate
Slug: object-comparing
Authors: David
Summary: How we can compare objects in python and where are differents
Status: published
---

[TOC]

# Comparison operators

**Python basic comparison operators:**

These operators compare the **values** of comparing objects. In other words we are comparing values saved inside the variable. Each int, float or string type is saved in memory as object in python. And we want to compare content of these objects with operators below.

In generally, its are operators which we've already known from school.

Operator | Name | Example
:-------:|:----:|:------:
`==`     | equal| x == y
`!=`     |not equal| x != y
`>`      |bigger  | x > y
`<`      |lower | x < y
`>=`     |bigger or equal to| x >= y
`<=`     |lower or equal to | x <= y

----
**Python identical operators:**

These operators compared if two objects are same objects.
For better understanding. Every object in python has its own **id number**.
We can get id number of certain object in python by method `id()`.
So when two objects are identical than they have same id number.

Operator | Description | Example
:-------:|:----:|:------:
`is`|Returns True if compared objects are same, if id number is same for both| x is y
`is not` |Returns True if compared objects are not same| x is not y


See example below.

Variable `a` and `b` have same values saved in but they have different id.

```shell
>>> a = 3100
>>> b = 3100
>>> id(a)
4332864560
>>> id(b)
4332864880
```

# Identical objects - The singletones

The singleton is one of the simplest design pattern of object in Python.

Examples of singleton are:

* `None`
* `True`
* `False`

What does it means ? Whenever we create one of these object above in our code
always will be one same object.

It can't be two `None` objects with different id number.

Although if we have two and more `None` in our code, always it is referenced to one object saved in memory.

```shell
>>> id(None)
4407467184
```

All `None` objects in my certain code have id number equal to **4407467184**.


# Difference between `==` and `is` in examples

```shell
>>> a = 3100
>>> b = 3100
>>> id_a = id(a)
>>> id_b = id(b)
>>> id_a
4332864560
>>> id_b
4332864880
>>> a is b
False
>>> a == b
True

```

Comparison `a is b` can be rewrite as `id_a == id_b`, so we just compare id number of each object, in other words if two id integers are same. In some cases it is much faster than compare values of objects, expecially when we compare list of values.

Comparison `a == b` compares values saved in each variable. In this case we compare two integers saved in `3100 == 3100`.

This explanation is same for `!=` and `is not`. But with vice versa logic.

# Compare objects identical number in examples

**`None` examples:**

```shell
>>> def my_func():
...     return None
...
>>> oliver = {"age": 20}
>>> my_func() is None
True
>>> oliver.get("height", None) is None
True
>>> oliver.get("age", None) is None
False
>>> oliver.get("age", None) is not None
True
```

**`True` examples:**

```shell
>>> 3 == 3 is True
True
```

Python will evaluate like that:

`3 == 3` = `True`, than `id(True) is id(True)` = `True`


**Two lists:**

```shell
>>> a = [1, 2, 3]
>>> b = a
>>> a is b
True
>>> a == b
True
>>> b.append(4)
>>> a
[1, 2, 3, 4]
>>> b
[1, 2, 3, 4]
>>> a is b
True
>>> a == b
True
>>> del a
>>> a
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'a' is not defined
>>> b
[1, 2, 3, 4]
>>> a = [1, 2, 3, 4]
>>> a is b
False
>>> a == b
True
```

Notice at the end of code I've created new list `a` which has same values as list `b`. But when I've created new list, than the new list is a new object with new `id` number.
