# Makefile for source rpm: file
# $Id$
NAME := file
SPECFILE = $(firstword $(wildcard *.spec))

include ../common/Makefile.common
