#!/usr/bin/env bash

filepath=$1

VENDOR_DIR='vendor'
NODE_DIR='node_modules'
POD_DIR='Pods'

if [ -d "$filepath" ]; then
    echo "$filepath is a directory."
    # check if the directory include a php composer project
    COMPOSER_FILE='composer.json'
    if test -f "$filepath/$COMPOSER_FILE"; then
        echo "$COMPOSER_FILE has been found."
        if [ -d "$filepath/$VENDOR_DIR" ]; then
            echo "$VENDOR_DIR has been found."
        else
            echo "$VENDOR_DIR has not been found."
            mkdir "$filepath/$VENDOR_DIR"
            echo "$VENDOR_DIR has been created."
        fi

        xattr -w com.dropbox.ignored 1 "$filepath/$VENDOR_DIR"
        echo "$filepath/$VENDOR_DIR has been added to ignore list of Dropbox"
    fi

    # check if the directory include a CocoaPod project
    POD_FILE='Podfile'
    if test -f "$filepath/$POD_FILE"; then
        echo "$POD_FILE has been found."
        if [ -d "$filepath/$POD_DIR" ]; then
            echo "$POD_DIR has been found."
        else
            echo "$POD_DIR has not been found."
            mkdir "$filepath/$POD_DIR"
            echo "$POD_DIR has been created."
        fi

        xattr -w com.dropbox.ignored 1 "$filepath/$POD_DIR"
        echo "$filepath/$POD_DIR has been added to ignore list of Dropbox"
    fi

    # check if the directory include a node.js project
    PACKAGE_FILE='package.json'
    if test -f "$filepath/$PACKAGE_FILE"; then
        echo "$PACKAGE_FILE has been found."
        if [ -d "$filepath/$NODE_DIR" ]; then
            echo "$NODE_DIR has been found."
        else
            echo "$NODE_DIR has not been found."
            mkdir "$filepath/$NODE_DIR"
            echo "$NODE_DIR has been created."
        fi

        xattr -w com.dropbox.ignored 1 "$filepath/$NODE_DIR"
        echo "$filepath/$NODE_DIR has been added to ignore list of Dropbox"
    fi

else
    echo "Please provide a directory as a parameter." 
fi