# platform_utils

Returns value or run a function based on Platform.
If the context is passed, it will get the platform by Theme.of(context).platform.
Otherwise, it will use defaultTargetPlatform.


```
PlatformUtils.select(ios: "ios", android: "android", fuchsia: "fuchsia", web: "web", defaultWhenNull: "default");
```


[API Reference](https://pub.dev/documentation/platform_utils/latest/)

Example:

On Android, value is primitive types
```
final result = PlatformUtils.select(android: "value is string");
// result = value is string
```

On Android, value is a function
```
final result = PlatformUtils.select(android: () => "value from function");
// result = value from function
```

On Android, value is not passed, returns null
```
final result = PlatformUtils.select();
// result = null
```

On Android, value is not passed and defaultWhenNull is set
```
final result = PlatformUtils.select(defaultWhenNull: "default");
// result = default
```