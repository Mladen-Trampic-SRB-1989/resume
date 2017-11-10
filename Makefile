# Your resume file
RESUME ?= resumes/mladen_trampic.yaml

# Your rsync upload path
RSYNC_LOCATION ?= example.com:/var/www/resume/

# Here you can also override other variables from Makefile, like BUILD_DIR
BUILD_DIR ?= /mnt/e/nginx-1.13.6/html/

PYTHON ?= $(shell which python3)
RSYNC ?= $(shell which rsync)
RSYNC_ARGS ?= aAXv

BUILD_ARGS ?= --output_dir $(BUILD_DIR)
BUILD ?= $(PYTHON) build.py $(BUILD_ARGS)


.PHONY: clean html pdf publish

all: clean html pdf

html:
	$(BUILD) --format html $(RESUME)
	@echo "Done"

pdf:
	$(BUILD) --format pdf $(RESUME)

clean:
	@rm -rf $(BUILD_DIR)/*

