#!/bin/bash
# Sincronizza index.html in tutte le sottocartelle e fa push
cp index.html giuliamonaco/index.html
git add index.html giuliamonaco/index.html
git commit -m "sync: update all dashboard copies from root index.html"
git push
