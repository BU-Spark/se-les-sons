# Les Sons

Les Sons is a mobile app targeted at beginning French learners to learn French pronunciation and how to read any French words. The app provides textual information and audio files on French pronunciation following Alain’s extensive experience teaching French. 

The content of the mobile app is based on a book written by Alain (a longtime french language instructor) which he has developed over the last 20 years. We adapted the content of the book to a mobile format, designing various UX elements and user interaction flows from lo-fi wireframes in order to best display the content

In addition to the written content each section has several recordings of various French words and sounds that need to be integrated into the app, as well as allowing users to record their own production of the sounds in order to compare and improve on their pronunciation.


## Install and Run

Install flutter following this [guide](https://docs.flutter.dev/get-started/install). You will need to install Xcode, and cocoapods to set up the IOS simulator. The IOS simulator will only work on MacOS. To set up android you will need to install android studio, and android tool chain. All of the dependencies are explained in the guide.   

Then go to our [github](https://github.com/BU-Spark/se-les-sons/tree/dev) and fork the repository. 

Then clone the repo. Open your terminal, go to the path where you want to have your repo on your local machine.
```
git clone <ssh-url>
```
Enter the clone repo, cd se-les-sons

 To run `flutter run`

## Contributing

Check remote `git remote -v`

You should see url of your repository. Something like
```
https://github.com/<your_github_account_name>/<repository_name>.git
```
Add upstream to remote 
```
git remote add upstream <upstream repo link>
i.e git remote add upstream git@github.com:BU-Spark/se-les-sons.git
```

Check remote again `git remote -v`

 Now you should see two remotes, namely `upstream` and `origin`. Verify if the urls are corect. `upstream` should be our repo url. `origin` should be your repo url.

Once you have the the upstream set up you are ready to start contributing!

Check current branch `git branch`

Make sure you are on dev branch if not checkout to dev
```
git checkout dev
```

Save the files you changed, and check the status 
```
git status
```
Make sure `git status` returns what you are expecting. 

Ensure that your local repository is up-to-date with the changes in upstream.

Sync your branch with upstream 
```
git fetch upstream
```

Pick commits from upstream 
```
git rebase upstream/main
```

Add the file(s) to stage for git to track 
```
git add [file(s) name i.e lib/main.dart]
```
Make a commit 
```
git commit -m "[description of changes]"
```

Push the file 
```
git push origin dev
```

Verify if the file was pushed by checking it on GitHub web page. Click on the banner that is on top of the screen and create a pull request. 

## Download (Build) to an Android Device

To access the app to download onto an android device use this [link](https://drive.google.com/drive/folders/1FhflO38qpi3iNnggRRZZ9pDE8jXqYN7l?usp=sharing). 

To download: Go into settings and allow apps from Unknown Sources (this may be different depending on phone manufacturer). Download a file from the drive that works for your android device. Note: These APK files will only work on a device with a 64 bit architecture as per Google PlayStore 64 bit requirement. 

Or you can follow these steps to install the APK on a connected Android device.

From the command line:

Connect your Android device to your computer with a USB cable.

Enter `cd se-les-sons`.

Run `flutter install`.

## Security Issues

As of right now our greatest secutrity concern is authentication/authorization. However since the log in has not yet been implemented security features have not been added as well. 
