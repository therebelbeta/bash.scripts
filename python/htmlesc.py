#! /usr/bin/python
# -*- coding: utf-8 -*-
import cgi
str = "□      <White>"
def htmlescape(text):
    text = (text).decode('utf-8')

    from htmlentitydefs import codepoint2name
    d = dict((unichr(code), u'&%s;' % name) for code,name in codepoint2name.iteritems() if code!=38) # exclude "&"    
    if u"&" in text:
        text = text.replace(u"&", u"&amp;")
    for key, value in d.iteritems():
        if key in text:
            text = text.replace(key, value)
    return text

str = htmlescape(str)
print str

