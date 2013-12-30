#!/usr/bin/python
#-*- coding: utf-8 -*-

import bs4
from bs4 import BeautifulSoup
from collections import OrderedDict
import json,pprint
import string

out = OrderedDict()

def scrape(fn):
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



for l in string.ascii_uppercase+'_':
	scrape ("ref"+l+".html")

esc = json.dumps

for k, i in out.iteritems():
	for x in i['syntax']:
		print "(be syntax (",k,esc(x),")"
	print "(be doc (",k,esc(i['doc']),")"
	print "(be example (",k,esc(i['example']),")"

