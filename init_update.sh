#!/bin/bash
echo arg[$@]
git $@ submodule init
git $@ submodule update

