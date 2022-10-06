Chatsounds
==========

Chat sounds system for Garry's Mod (with extra sounds)
<a href="https://github.com/Metastruct/garrysmod-chatsounds/actions/workflows/push.yml"><img align="right" alt="check sounds and update lists" src="https://github.com/Metastruct/garrysmod-chatsounds/actions/workflows/push.yml/badge.svg?branch=master" /></a>

## NOTICE 2020-01-13
 - Repository was rewritten and forced pushed on 2020-01-13. Commit messages, commits and files were altered or removed to attempt removing sounds violating [GitHub AUP](https://help.github.com/en/github/site-policy/github-acceptable-use-policies#2-content-restrictions). You will have to force pull the repository to get all changes. You can use `repo-reset.cmd` to do that. [better_profanity](https://pypi.org/project/better-profanity/) python module was used for the removal. 
 - tl;dr: run [repo-reset.cmd](https://raw.githubusercontent.com/Metastruct/garrysmod-chatsounds/master/repo-reset.cmd) in the chatsounds directory
 - **Please report any remaining offensive or otherwise GitHub AUP violating sounds you might find by creating a new issue!**

## How to install
### Installing is not necessary to hear the sounds if the server has [neo-chatsounds](https://github.com/Earu/neo-chatsounds) installed
 - Install a git client ([GitKraken](https://www.gitkraken.com) or [GitHub Dekstop](https://desktop.github.com)) or use the [command line](https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html)
 - Git clone https://github.com/Metastruct/garrysmod-chatsounds.git into your addons folder
 - To see if you installed it correctly, you should now have ```garrysmod/addons/garrysmod-chatsounds/lua``` folder

<details>
 <summary>Old alternative install method (not recommended to use)</summary>

 - Install subversion client: http://tortoisesvn.net/downloads.html
 - Checkout: https://github.com/Metastruct/garrysmod-chatsounds/trunk
 - Save to ```garrysmod/addons/garrysmod-chatsounds```
 - To see if you installed it correctly, you should now have ```garrysmod/addons/garrysmod-chatsounds/lua``` folder
</details>

## How to install on server
Git clone or download zip of https://github.com/Earu/neo-chatsounds. This allows players not to have to download the entire repo to use chatsounds.

<details>
 <summary>Old method</summary>
 
 - Create directory ```garrysmod/addons/garrysmod-chatsounds```
 - Checkout: ```https://github.com/Metastruct/garrysmod-chatsounds/trunk/lua``` to ```garrysmod/addons/garrysmod-chatsounds/lua```
 - To see if you installed it correctly, you should now have ```garrysmod/addons/garrysmod-chatsounds/lua/autorun/chatsounds.lua``` file.
</details>

## How to contribute more sounds to this repository
 - **SOUNDS MUST OBEY [GITHUB AUP](https://help.github.com/en/github/site-policy/github-acceptable-use-policies#2-content-restrictions)**
 - [Read this](https://github.com/Metastruct/garrysmod-chatsounds/blob/master/HOW%20TO%20ADD%20SOUNDS.txt).
 - We accept pull requests
 - Running the preprocessor is not mandatory anymore - if you don't run it, lists will be auto-generated about 3 minutes after you commit/push the changes
 
If you do not understand, you can ask people who have already added sounds to add them for you.

## Want to preview or share sounds over the Web?
 - Check out the Web version [here](https://cs.spiralp.xyz/).
