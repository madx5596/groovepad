-keep class ** { *; }
-keepclassmembers class ** { *; }

# AudioPlayers
-keep class com.google.android.exoplayer2.** { *; }
-keep interface com.google.android.exoplayer2.** { *; }

# Flutter
-keep class io.flutter.** { *; }
-keep interface io.flutter.** { *; }
