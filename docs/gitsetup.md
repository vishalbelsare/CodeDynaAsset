Back to [Fan](https://fanwangecon.github.io)'s
[Dynamic Assets Repository](https://fanwangecon.github.io/CodeDynaAsset/) Table of Content.

# Setting up GIT to pull from this repository

To view the various files, you can pull from the repository following instructions below. Alternatively, can click on *Clone or Download* and click *Download Zip*, which will download all files in CodeDynaAsset repository.

Additionally, *HTML* links are directly viewable on the github pages site: *[https://fanwangecon.github.io/CodeDynaAsset/](https://fanwangecon.github.io/CodeDynaAsset/)*. To view *HTML* files inside the repository page *[https://github.com/FanWangEcon/CodeDynaAsset](https://github.com/FanWangEcon/CodeDynaAsset)* directly, append this to the beginning of the current HTML page's full URL: *http://htmlpreview.github.io/?* (see https://github.com/htmlpreview/htmlpreview.github.com for more information on how)

You can set up your own github account if you would like. That is however not necessary for completing the following steps. Github allows us to host and share codes in the form of git repositories. git is a type of repository.

## Installing and Open up Git:
1. Download Git from [here](https://git-scm.com/downloads). Install the git program, follow on-screen instructions.
2. Search for the **git bash** program on your computer, open it. A window with black background opens up.
3. Type in: *cd ~/*, press enter, this takes your to the user directory on your computer. Type in: *pwd*, press enter, this shows you the path to your user directory, for me, it is for example:
  ```console
  /c/Users/fan
  ```

## First time clone:
This is for **first time** set-up. We clone a repository from github to your local drive.
1. Create a directory under your user main for git repositories (only have to do this once)
  ```console
  mkdir ~/GitRepos
  ```
2. Enter into the directory, it is just a folder on your computer
  ```console
  cd ~/GitRepos
  ```
3. Clone our repository inside GitRepos. Note that this is just downloading a folder to your computer, but rather than clicking on web page, we are downloading via command-line.
  ```console
  git clone https://github.com/FanWangEcon/CodeDynaAsset
  ```
4. Now you can go to your folder and see our latest files. And you can open up matlab and set the directory to the one that contains CodeDynaAsset. For me that would be this folder, this is a git folder:
  ```console
  /c/Users/fan/GitRepos/CodeDynaAsset
  ```

## Updating existing CodeDynaAsset Git Repository:
I will be updating the files in our shared repository. You can pull from the shared repository to get the latest files.

The instructions below will eliminate any local changes you have made to the files and replace them with latest from our github repository. If you want to save your local changes, re-save the files that you have modified in another folder for yourself before you proceed with the codes below.

1. Go to our CodeDynaAsset folder:
  ```console
  cd ~/GitRepos/CodeDynaAsset
  ```
2. First fetch all changes from origin (which we defined previously)
  ```console
  git fetch origin
  ```
3. Reset your local repository
  ```console
  git reset --hard origin/master
  ```
4. Pull from remote replace local
  ```console
  git pull origin master
  ```
