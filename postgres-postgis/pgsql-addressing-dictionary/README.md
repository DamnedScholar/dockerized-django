# TSearch Address Dictionaries

## Motivation

Trying to use full-text indexing for address data with the default [language configurations](http://www.postgresql.org/docs/9.3/static/textsearch-dictionaries.html) doesn't work well: if you use an 'english' configuration, you end up getting street names stemmed by the english dictionary. Using the 'simple' configurations is better but still not optimal: there is no handling of obvious abbreviations, so you might fail to match "12 N Oak st" to "12 North Oak Street", or vice versa.

This extension provides an 'addressing_en' configuration that has common (Canada Post enumerated) street type abbreviations, direction tokens (n, s, e, w, etc) and numeric street variants (first/1st) handled. There's sure to be piles more, as well as many cases that cannot be handled with a simple full-text tokenizing strategy (st = street or saint?). However, using full-text features for basic geocoding is too convenient to ignore.

Using full-text indexing for nationwide address data might still be a bad idea, since there are so many possible false or multiple matches to find, but for a single city, county or even state, this approach can generate a quick'n'dirty address lookup routine perfect to tying to an autocomplete form field on a web page.

Currently there is only support for English (really, North American English) addressing -- pull requests gratefully received.

## Installation

Clone the repository, ensure that `pg_config` is on your path, and run `make install` to copy the dictionary files into place.

## Examples

    > CREATE EXTENSION addressing_dictionary;

    > SELECT to_tsvector('addressing_en', '1234 n main st');

                     to_tsvector                  
    ----------------------------------------------
     '1234':1 'main':4 'n':2 'north':3 'street':5

## Caveats
If using v1.1, then cardinal directions are tokenized as both the single letter abbreviation, and the word. This is to avoid ambiguity. See example above.
