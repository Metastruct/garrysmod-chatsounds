Chatsounds
==========

Chat sounds system for Garry's Mod (with extra sounds)
<img align="right" src="https://metastruct.net/github/garrysmod-chatsounds/ci-status.svg?branch=master" />

## NOTICE 2020-01-13

 - Repository was rewritten and forced pushed on 2020-01-13. Commit messages, commits and files were altered or removed to attempt removing sounds violating [GitHub AUP](https://help.github.com/en/github/site-policy/github-acceptable-use-policies#3-conduct-restrictions). You will have to force pull the repository to get all changes. You can use `repo-reset.cmd` to do that. [better_profanity](https://pypi.org/project/better-profanity/) python module was used for the removal. 
 - tl;dr: run [repo-reset.cmd](https://raw.githubusercontent.com/Metastruct/garrysmod-chatsounds/master/repo-reset.cmd) in the chatsounds directory
 - **Please report any remaining offensive or otherwise GitHub AUP violating sounds you might find by creating a new issue!**

## How to install
 - Install subversion client: http://tortoisesvn.net/downloads.html
 - Checkout: https://github.com/Metastruct/garrysmod-chatsounds/trunk
  - Save to ```garrysmod/addons/chatsounds```
  - To see if you installed it correctly, you should now have ```garrysmod/addons/chatsounds/lua``` folder

### How to install (alternative)
 - Install a git client (tortoise git https://tortoisegit.org or github client https://desktop.github.com ) 
 - Git clone: https://github.com/Metastruct/garrysmod-chatsounds.git
  - Save to ```garrysmod/addons/chatsounds```
  - To see if you installed it correctly, you should now have ```garrysmod/addons/chatsounds/lua``` folder

## How to install on server (lua only)
 - create directory ```garrysmod/addons/chatsounds```
 - Checkout: ```https://github.com/Metastruct/garrysmod-chatsounds/trunk/lua``` to ```garrysmod/addons/chatsounds/lua```
  - To see if you installed it correctly, you should now have ```garrysmod/addons/chatsounds/lua/autorun/chatsounds.lua``` file.

## How to contribute more sounds to this repository
 - [Read this](https://github.com/Metastruct/garrysmod-chatsounds/blob/master/HOW%20TO%20ADD%20SOUNDS.txt).
 - We accept pull requests
 - Running the preprocessor is not mandatory anymore - if you don't run it, lists will be auto-generated about 3 minutes after you commit/push the changes
 - SOUNDS MUST OBEY GITHUB AUP AT https://help.github.com/en/github/site-policy/github-acceptable-use-policies#3-conduct-restrictions
 
If you do not understand, you can ask people who have already added sounds to add them for you.

## Want to preview or link sounds over the Web?
 - Check out the Web version [here](http://cs.3kv.in/). (updates every 30 mins.)
