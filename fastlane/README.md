fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Available Actions
## iOS
### ios generate_all_keys
```
fastlane ios generate_all_keys
```
Generate Certificates, Push Certificates and Provisionings
### ios generate_keys
```
fastlane ios generate_keys
```
Generate Certificates, Push Certificates and Provisionings

Optional -> production:[boolean]
### ios just_upload_screenshots
```
fastlane ios just_upload_screenshots
```
Just Upload Screenshots
### ios just_upload_metadata
```
fastlane ios just_upload_metadata
```
Just Upload Metadata
### ios just_upload_metadata_and_screenshots
```
fastlane ios just_upload_metadata_and_screenshots
```
Just Upload Metadata
### ios just_upload_binary
```
fastlane ios just_upload_binary
```
Just Upload Binary
### ios submit_for_review
```
fastlane ios submit_for_review
```
Submit For Review

Required -> build:[string_build_number]
### ios just_build
```
fastlane ios just_build
```
Just Build
### ios run_deliver
```
fastlane ios run_deliver
```
Run Deliver
### ios screenshots
```
fastlane ios screenshots
```


----

This README.md is auto-generated and will be re-generated every time to run [fastlane](https://fastlane.tools).
More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [GitHub](https://github.com/fastlane/fastlane/tree/master/fastlane).