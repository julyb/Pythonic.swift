#!/usr/bin/env xcrun swift -I. -i

import Pythonic

assert(re.search("^foo", "foobarzonk"))
assert(bool(re.search("^bar", "foobarzonk")) == False)
assert(re.search("^foo.*zonk$", "foobarzonk"))
assert(re.search("foo", "foobarzonk"))
assert(bool(re.search("hello", "foobarzonk")) == False)
assert(re.search("o", "foobarzonk"))

assert(bool([1]))
assert(bool(1))
assert(bool(0) == False)
assert(bool("foo"))
assert(bool("") == False)
assert(bool(None) == False)
assert(str(123) == "123")
assert(bool(None) == False)
assert(len(["foo"]) == 1)
assert(len(["foo", "bar"]) == 2)
assert(len(["foo", "bar", "baz"]) == 3)
assert(len("") == 0)
assert(len("foo") == 3)
assert(True)
assert([1, 2, 3])
assert([1, 2])
assert([1])
assert(bool(0.0) == False)
assert(0.00000001)
assert(1.0)
assert(bool(float(0.0)) == False)
assert(float(0.00000001))
assert(float(1.0))
assert(bool(0) == False)
assert(1)
assert(bool("") == False)
assert(" ")
assert("".strip() == "")
assert(" foobar ".strip() == "foobar")
assert("foobar".strip() == "foobar")
assert("  \n   foobar       \n   ".strip() == "foobar")
assert("FooBar".upper() == "FOOBAR")
assert("FooBar".lower() == "foobar")
assert("fzzbar".replace("z", "o") == "foobar")
assert("foobar"[0] == "f")
assert("foobar".startswith("foo"))
assert("foobar".endswith("bar"))
assert("foo baR".capitalize() == "Foo bar")
assert("foo".capitalize() == "Foo")
assert("fo".capitalize() == "Fo")
assert("f".capitalize() == "F")
assert("".capitalize() == "")
assert("foo bar".title() == "Foo Bar")
assert(bool(all(["", "bar", "zonk"])) == False)
assert(all(["foo", "bar", "zonk"]))
assert(bool(all([False, False, False])) == False)
assert(bool(all([False, False, True])) == False)
assert(all([True, True, True]))
assert(any(["", "foo", "bar", "zonk"]))
assert(bool(any([False, False, False])) == False)
assert(any([False, False, True]))
assert(max([1, 2, 3]) == 3)
assert(max([1, 2]) == 2)
assert(max(1, 2) == 2)
assert(max(1, 2, 3) == 3)
assert(min([1, 2]) == 1)
assert(min([1, 2, 3]) == 1)
assert(min(1, 2) == 1)
assert(min(1, 2, 3) == 1)
assert(sum([1, 2, 3]) == 6)
assert(sum([1, 2, 3], 1) == 7)
assert(chr(97) == "a")
assert(chr(ord("b")) == "b")
assert(ord("a") == 97)
assert(ord(chr(98)) == 98)
assert(oct(0) == "0")
assert(oct(1) == "01")
assert(oct(10) == "012")
assert(oct(100) == "0144")
assert(oct(1000) == "01750")
assert(":".join(["foo", "bar", "baz"]) == "foo:bar:baz")
assert(["foo", "bar", "zonk"].index("zonk") == 2)
assert([1, 2, 3].index(3) == 2)
assert(list(["a", "b", "c"]).index("b") == 1)
assert([1, 2, 2, 3, 3, 3].count(1) == 1)
assert([1, 2, 2, 3, 3, 3].count(2) == 2)
assert([1, 2, 2, 3, 3, 3].count(3) == 3)

// BUG: Due to a compiler bug (?) the following cannot be imported. Must be in same source file.
extension Array {
    mutating func pop(index: Int?) -> Array.Element? {
        var i = index ? index! : self.count - 1
        if self.count == 0 || i < 0 || i >= self.count {
            return nil
        }
        var ret = self[i]
        self.removeAtIndex(i)
        return ret
    }

    // NOTE: To allow for re.search(…).group(…)
    func group(i: Int) -> Array.Element? {
        if self.count == 0 || i < 0 || i >= self.count {
            return nil
        }
        return self[i]
    }

    mutating func pop() -> Array.Element? {
        return self.pop(nil)
    }
}



let pythonIncompatibleTests = True
if pythonIncompatibleTests {
    assert(re.search("^foo", "foobarzonk").group(0) == "foo")

    var mutableArray = [1, 2, 3]
    assert(mutableArray.pop() == 3)
    assert(mutableArray.pop(0) == 1)
    assert(mutableArray.pop(1) == nil)
    assert(mutableArray.pop(0) == 2)
    assert(mutableArray.pop() == nil)

    var anotherMutableArray = [3, 2, 1, 3]
    anotherMutableArray.remove(0)
    assert(equal(anotherMutableArray, [3, 2, 1, 3]))
    anotherMutableArray.remove(2)
    assert(equal(anotherMutableArray, [3, 1, 3]))
    anotherMutableArray.remove(1)
    assert(equal(anotherMutableArray, [3, 3]))
    anotherMutableArray.remove(3)
    assert(equal(anotherMutableArray, [3]))
    anotherMutableArray.remove(3)
    assert(equal(anotherMutableArray, []))

    assert(equal(re.search("", "foobarzonk"), []))
    assert(["foo", "bar", "zonk"].index(1) == None)
    assert([1, 2, 3].index(4) == None)
    assert([1, 2, 3].index("foo") == None)
    assert(len(list<str>()) == 0)
    assert(len(dict<str, str>()) == 0)
    assert(len(["foo": "bar"]) == 1)
    assert(len(["foo": "bar", "baz": "foo"]) == 2)
    assert(!list<int>())
    assert("x" as Character)
    assert(["foo": "bar"])
    assert(!dict<str, str>())

    // TODO: Implement array equality test (String[] == String[])
    assert(equal("foo:bar:baz".split(":"), ["foo", "bar", "baz"]))
    assert(equal(":".join(["foo", "bar", "baz"]), "foo:bar:baz"))
    assert(equal(("foobar").split(""), ["foobar"]))
    assert(equal(("foo bar").split(" "), ["foo", "bar"]))

    assert("foobar".startsWith("foo"))
    assert("foobar".endsWith("bar"))
    assert("foobar"[0..2] == "fo")
    assert("they're bill's friends from the UK".title() == "They're Bill's Friends From The Uk")

    // TODO: Implement array equality test (Int[] == Int[])
    assert(equal(range(10), [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]))
    assert(equal(range(1, 11), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
    assert(equal(range(0), []))
    assert(equal(range(1, 0), []))
    assert(equal(range(0, 5, -1), []))
    assert(equal(range(0, 10, 2), [0, 2, 4, 6, 8]))
    assert(equal(range(0, 50, 7), [0, 7, 14, 21, 28, 35, 42, 49]))
}

println("All tests successfully passed when executing as Swift code.")
