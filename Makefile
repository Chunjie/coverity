#philippeg oct2014
#
#various utilities to administer the Coverity CIM, through the SOAP apis
#See: cov_platform_web_service_api_ref.html
#
.PHONY: getallproj createproj getcompmaps
SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
configFile:=$(SELF_DIR)/.config
# Read config params from .config file
config=$(lastword $(shell grep $(1) $(configFile)))
host:=$(call config,'host')
port:=$(call config,'port')
user:=$(call config,'username')
pass:=$(call config,'password')
csv:=$(call config,'csvfile')
getprojects:
	python getProjects.py --host $(host) --port $(port) --user $(user) --password $(pass) --csvfile $(csv)
createproj:
	python createproject.py --host $(host) --port $(port) --user $(user) --password $(pass) --csvfile $(csv)
getcompmaps:
	python getComponentMaps.py  --host $(host) --port $(port) --user $(user) --password $(pass) --csvfile $(csv)
createcompmap:
	python createComponentMap.py --host $(host) --port $(port) --user $(user) --password $(pass) --csvfile compmap.csv




