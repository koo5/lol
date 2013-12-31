#!/usr/bin/python
#-*- coding: utf-8 -*-

"""
this thing will scrape the html files of the function
reference inside the doc directory of picolisp
and try to output an .l file with pilog asserts
and function "help" defined.
run it inside the doc directory and pipe to a file,
then load it

bugs:	<s in _
	^Js and \"s in output

you will need:
sudo apt-get install python-pip
pip install --user Beautifulsoup4
"""

import bs4
from bs4 import BeautifulSoup
from collections import OrderedDict
import json,pprint
import string


def scrape(fn):
	out = OrderedDict()
	html=open(fn, "r").read()
	s=BeautifulSoup(html)

	for i in s.dl.children:
		if i.__class__ == bs4.element.Tag:
			if i.name == 'dt':
				e = out[i.find('a').get('name')] = {}
				e['syntax'] = [i.find('code').text]

				#im getting the subsequent dts nested
				for m in i.find_all('dt'):
					e['syntax'].append(i.find('dt').find('code').text)

			if i.name == 'dd':
				e['example'] = i.find('pre').extract().text
				e['doc'] = i.text
	return out


def esc(X):
	return "\""+X.replace("\\n",chr(10)).replace("\\", "\\\\").replace("\"","\\\"").encode("utf-8")+"\""

for l in string.ascii_uppercase+'_':
	out = scrape ("ref"+l+".html")
	for k, i in out.iteritems():
			for x in i['syntax']:
				print "(assertz '(syntax (",k, esc(x),")))"
			print "(assertz '(doc (",k,esc(i['doc']),")))"
			print "(assertz '(example (",k,esc(i['example']),")))"

print """(de help (X)	(pilog (list(list 'syntax	X '@X)) (prinl @X))
			(pilog (list(list 'doc		X '@X)) (prinl @X))
			(pilog (list(list 'example	X '@X)) (prinl @X))
			())"""
