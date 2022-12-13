icons:
		flutter pub run flutter_launcher_icons:main

splash:
		flutter pub run flutter_native_splash:create

gen:
		flutter packages run build_runner build --delete-conflicting-outputs
		flutter pub run build_runner build --delete-conflicting-outputs


fmt:
		flutter format lib test

apk:
		flutter build apk  --flavor production --target lib/main_production.dart -vv

		flutter build apk --debug --flavor development --target lib/main_development.dart

apk-stg:
		flutter build apk  --flavor staging --target lib/main_staging.dart

sort:
		flutter pub run import_sorter:main

aab:
		flutter build appbundle  --flavor production --target lib/main_production.dart

base64:
		cat path/to/file.png | openssl base64 | tr -d '\n' | pbcopy

ipa:
		flutter build ipa  --flavor production --target lib/main_production.dart -vv

sha1:
		keytool -list -v -keystore ~/.android/debug.keystore