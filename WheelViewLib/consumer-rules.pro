# Consumer ProGuard rules for WheelView library
# These rules will be applied to apps that use this library

# Keep all public classes and methods from the library
-keep public class com.lukedeighton.wheelview.** {
    public protected *;
}

# Keep custom view constructors
-keepclasseswithmembers class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

# Keep listener interfaces
-keep interface com.lukedeighton.wheelview.** { *; }