# RepositoryPatternSwift

RepositoryPattern sample in iOS


### Installing xcodebuild command-line tool

```bash
 xcode-select --install
```

##### To see the list of available SDKs
```bash
 xcodebuild -showsdks
```


```bash
 xcodebuild -sdk iphonesimulator6.0
```
##### (This creates a build/Release-iphonesimulator directory in your Xcode project that contains the .apppackage)

## Testing:

   #### Test on device:
   ```bash
   xcodebuild test -project MyAppProject.xcodeproj -scheme MyApp -destination 'platform=iOS,name=Development iPod touch'
   ```

   #### Test on Simulator:
   ```bash
   xcodebuild test -workspace RepositorySampleiOS.xcworkspace -scheme RepositorySampleiOS -destination 'platform=iOS              Simulator,name=iPhone 7,OS=10.3'
   ``` 

