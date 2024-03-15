#!/usr/bin/env sh
    set -eu
    echo "Removing all files from ${WORKSPACE_SOURCE_PATH} ..."
    # Delete any existing contents of the directory if it exists.
    #
    # We don't just "rm -rf ${WORKSPACE_SOURCE_PATH}" because ${WORKSPACE_SOURCE_PATH} might be "/"
    # or the root of a mounted volume.
    if [ -d "${WORKSPACE_SOURCE_PATH}" ] ; then
      # Delete non-hidden files and directories
      rm -rf "${WORKSPACE_SOURCE_PATH:?}"/*
      # Delete files and directories starting with . but excluding ..
      rm -rf "${WORKSPACE_SOURCE_PATH}"/.[!.]*
      # Delete files and directories starting with .. plus any other character
      rm -rf "${WORKSPACE_SOURCE_PATH}"/..?*
    fi