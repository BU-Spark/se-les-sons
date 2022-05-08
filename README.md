# Les Sons

Les Sons is a mobile app targeted at beginning French learners to learn French pronunciation and how to read any French words. The app provides textual information and audio files on French pronunciation following Alain’s extensive experience teaching French.

The content of the mobile app is based on a book written by Alain (a longtime french language instructor) which he has developed over the last 20 years. We adapted the content of the book to a mobile format, designing various UX elements and user interaction flows from lo-fi wireframes in order to best display the content

In addition to the written content each section has several recordings of various French words and sounds that need to be integrated into the app, as well as allowing users to record their own production of the sounds in order to compare and improve on their pronunciation.

## Technical Architecture

We are using Dart for our front-end. We chose it because it is a very intuitive and concise language that compared to other languages can make a better looking app with less amounts of code, and at BU using Flutter is encouraged and help is available. For the database, we haven't implemented it yet, but we will be using Firebase to store user’s progress and bookmarks, as well as the audios and text from the book. The primary reason we chose Firebase is because it seems that Flutter already has a ton of support around Firebase, specifically a plugin called FlutterFire, and is currently the most popular database to use alongside Flutter. In addition, Firebase already has something they call Firebase ML, which is useful for projects that utilize machine learning which in the future will be implemented. Alongside Firebase we will be using Google Cloud CDN. We chose to utilize a CDN (content delivery network) because we want to deliver a lot of information fast to the user so that they continue their lessons without issue and it was recommend that we use one. And since much of the information is audio, it would be very helpful. Google Cloud CDN and Firebase are both maintained by Google so they are both already tightly integrated with one another.

## Install and Run

Install flutter following this [guide](https://docs.flutter.dev/get-started/install). You will need to install Xcode, and cocoapods to set up the IOS simulator. The IOS simulator will only work on MacOS. To set up android you will need to install android studio, and android tool chain. All of the dependencies are explained in the guide.

Then go to our [github](https://github.com/BU-Spark/se-les-sons/tree/dev) and fork the repository.

Then clone the repo. Open your terminal, go to the path where you want to have your repo on your local machine.
```
git clone <ssh-url>
```
Enter the clone repo, cd se-les-sons

To download all of the dependencies run
```
flutter pub get
```

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

Now you should see two remotes, namely `upstream` and `origin`. Verify if the urls are correct. `upstream` should be our repo url. `origin` should be your repo url.

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
git rebase upstream/dev
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

To access the app to download onto an android device use this [link](https://drive.google.com/file/d/1nwvSQaRbu8CHS4YzaK-phgSZs3SNkmZw/view?usp=sharing).

To download: Go into settings and allow apps from Unknown Sources (this may be different depending on phone manufacturer). Download a file from the drive that works for your android device. Note: These APK files will only work on a device with a 64 bit architecture as per Google PlayStore 64 bit requirement.

Or you can follow these steps to install the APK on a connected Android device.

From the command line:

Connect your Android device to your computer with a USB cable.

Enter `cd se-les-sons`.

Run `flutter install`.

## Security Issues

As of right now our greatest security concern is authentication/authorization. However since the log in has not yet been implemented security features have not been added as well.

### Bugs and Errors

List of known bugs and erorrs:

1. Table of contents: Under the table of contents all of the pull downs for the different parts have part 1's pages instead of being empty (since only part one is implemented). Future teams will add the other parts pages and will update the table of contents to have the pull downs for those parts go to the pages for that part.
2. Recording pages: On the recording pages the user is only able to have one recording at a time, they can record multiple times but it will only save the newest recording. And it only save the recording while they are on that page once they leave the page it doesn't save it anoymore. All of this is becuase we do not have a database yet.


### Work for the Future
List of known work that need to be done for future teams:

1. Pofile needs to be implemented. Look at [figma](https://www.figma.com/file/qBaNdXu1HLB9GjImX2dDXS/LS%3A-Wireframes?node-id=206%3A518) for how to implement.
2. Implement the other parts of the app. As of now (5/7/2022) only part one was created in figma.
3. Update table of contents (look at bugs and errors for details).
4. Create database and CDN (look at Technical Architecture for more information).
5. Create a static box for recording button (look at figma on any recording page).
6. Allow for multiple recordings on recording pages and ability to save recordings (see database).
7. Implement exercise 7 "Spelling French Words" as of now (5/7/2022) this exercise is not created in figma.
8. Use a "resource file" or "string file" instead of embedding the text directly into the code. For more information look at this [issue](https://github.com/BU-Spark/se-les-sons/issues/14)
9. Use loops in the code espicially with the "Container" in Homepage.dart and "carousel" in lessons_1.dart. For more information look at this [issue](https://github.com/BU-Spark/se-les-sons/issues/13)
 

