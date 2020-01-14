#!/bin/sh
:; # This file runs on both Windows and Linux. / (c) PotcFdk, 2018
:<<":GITRESET"
echo off
cls
if not exist .git goto PRESVNRESET
:GITRESET
:; if [ -d .git ]; then
echo Resetting working copy to origin/master...
git fetch && git checkout master && git reset --hard origin/master && git clean -xdf
:; elif [ -d .svn ]; then
:<<":SVNRESET"
goto END
:PRESVNRESET
if not exist .svn goto NONE
:SVNRESET
echo Resetting SVN working copy...
svn cleanup && svn revert --recursive .
:; elif false; then
goto END
:NONE
:; else
echo This seems to be neither a git nor an svn repository.
:; fi; if false; then
:END
:; fi
