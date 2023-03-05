# Black Jack in Dart/Flutter

To run the program properly, first you will need to install Flutter and Dart.
- [How to: Set up Flutter and dart on your Windows machine](https://docs.flutter.dev/get-started/install/windows)

After you have downloaded the file and extracted it to an easily accessible place, open the "flutter" folder and run the "flutter_console.bat" file \(Double click\).

Once in the Flutter console, run the command "flutter doctor". This should display all the required dependencies required to run a Flutter program, whether you already have them installed or not. The two most common dependencies that are not already installed are Visual Studio code with "Desktop Development with C++" and Android Studio with command line tools. If your "flutter doctor" command passes with no issues, skip to the bottom step.

- [Install Visual Studios Community Edition](https://visualstudio.microsoft.com/vs/)
- [Install Android Studio Electric Eel](https://developer.android.com/studio)

At the end of the Visual Studios installation process, you will be prompted with specific modules from Visual Studios that you would like to install, make sure you check the "Desktop Development with C++" module under the Desktop & Mobile ection before finishing your installation. If you already have Visual Studio installed, open the Visual Studio Installer and click modify on the current version that you have installed. From there you can apply the "Desktop Development with C++" module.

Once you have installed Android Studios and applied the default configuration settings, open it up to the starting page where you can either choose to create a new project, open an existing project or, get from VCS. If this is your first time installing Android Studio, there will be a More Actions button, click that and then click SDK Manager. If you already have Android Studio installed and have used it for other projects, the More Actions button will appear in the top right as three vertical dots next to the Get from VCS button, then click SDK Manager. Once in the SDK Manager window, under where it says your Android SDK Location, click on the tab that says SDK Tools. In that menu that it loads, check the box next to Android SDK Command-line Tools (latest) \(It should be the third option from the top\). After the box is checked, click apply and let it install.

If you were missing the Visual Studio and Android Studio depedencies and followed those steps, try running the "flutter doctor" command again in the Flutter console. You will most likely get another error about Android licenses. To fix that run the command "flutter doctor --android-licenses" in the Flutter console. Type "y" to accept each of the licenses. Now if you run "flutter doctor" and all the checks pass and there are no issues, you are ready to go.

Use the Flutter console to change to the directory where the program is located, the commad would be like "cd *location*/blackjack/". Once in the directory, run the command "flutter run", you will then be prompted for a device to run the application on, type "1" to run it on Windows. It may take a minute to build it for the first time, but now you should be able to run the program. To run it again just repeat this step.
