# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

-dontwarn vn.minerva.sale.**
-keep class vn.minerva.sale.** { *; }
-keep public class * implements com.bumptech.glide.module.GlideModule
-keepclassmembers class * implements android.os.Parcelable { static ** CREATOR; }
-dontwarn com.google.android.gms.**
-keep class com.google.android.gms.** { *; }
-keep class com.google.firebase.** { *; }
-keep class io.branch.** { *; }
-keep class io.fabric.sdk.android.** { *; }
-keep class io.socket.** { *; }
-keep class com.crashlytics.android.** { *; }
-keep class com.facebook.internal.FacebookInitProvider.** { *; }
-keep class com.facebook.FacebookSdk.** { *; }
-keep class com.facebook.imagepipeline.** { *; }
-keep class com.facebook.common.** { *; }

-keep class com.facebook.drawee.backends.pipeline.Fresco.** { *; }
-keep class android.support.v4.app.NotificationManagerCompat.** { *;}

-keep class io.reactivex.subjects.**{ *; }
# RxJava 0.21
-keep class androidx.appcompat.widget.** { *; }
-keep class rx.schedulers.Schedulers {
    public static <methods>;
}
-keep class rx.schedulers.ImmediateScheduler {
    public <methods>;
}
-keep class rx.schedulers.TestScheduler {
    public <methods>;
}
-keep class rx.schedulers.Schedulers {
    public static ** test();
}
-keep class rx.Observable
# OkHttp3
-keepattributes Signature
-keepattributes *Annotation*
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**
## Retrolambda specific rules ##

# as per official recommendation: https://github.com/evant/gradle-retrolambda#proguard
-dontwarn java.lang.invoke.*


# Keep our interfaces so they can be used by other ProGuard rules.
# See http://sourceforge.net/p/proguard/bugs/466/
-keep,allowobfuscation @interface com.facebook.common.internal.DoNotStrip
-keep,allowobfuscation @interface com.facebook.soloader.DoNotOptimize

# Do not strip any method/class that is annotated with @DoNotStrip
-keep @com.facebook.common.internal.DoNotStrip class *
-keepclassmembers class * {
    @com.facebook.common.internal.DoNotStrip *;
}

# Do not strip any method/class that is annotated with @DoNotOptimize
-keep @com.facebook.soloader.DoNotOptimize class *
-keepclassmembers class * {
    @com.facebook.soloader.DoNotOptimize *;
}

# Keep native methods
-keepclassmembers class * {
    native <methods>;
}

# Do not strip SoLoader class and init method
-keep public class com.facebook.soloader.SoLoader {
    public static void init(android.content.Context, int);
}
# Mapbox
-keep class com.mapbox.android.telemetry.**
-keep class com.mapbox.android.core.location.**
-keep class android.arch.lifecycle.** { *; }
-keep class com.mapbox.android.core.location.** { *; }
-dontnote com.mapbox.mapboxsdk.**
-dontnote com.mapbox.android.gestures.**
-dontnote com.mapbox.mapboxsdk.plugins.**
# Other Android
-keep public class com.google.firebase.** { public *; }
-keep class com.google.firebase.** { *; }
-dontnote com.google.firebase.**
-dontnote com.google.android.gms.internal.**
-dontnote android.net.http.*
-dontnote org.apache.commons.codec.**
-dontnote org.apache.http.**
-dontwarn org.xmlpull.v1.**
-dontnote org.xmlpull.v1.**
-keep class org.xmlpull.** { *; }
-keepclassmembers class org.xmlpull.** { *; }
# --- Java ---
-dontwarn java.awt.Color
-dontwarn com.mapbox.api.staticmap.v1.models.StaticMarkerAnnotation
-dontwarn com.mapbox.api.staticmap.v1.models.StaticPolylineAnnotation
-dontwarn com.sun.istack.internal.NotNull


#Realm
-keep class io.realm.annotations.RealmModule
-keep @io.realm.annotations.RealmModule class *
-keep class io.realm.internal.Keep
-keep @io.realm.internal.Keep class * { *; }
-dontwarn javax.**
-dontwarn io.realm.**

#Arcore
-keepclassmembers class com.google.ar.core.** { *; }


