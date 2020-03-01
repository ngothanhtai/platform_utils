import 'package:flutter_test/flutter_test.dart';
import 'package:platform_utils/platform_utils.dart';

void main() {
  test("without Context, value is string", () {
    final result = PlatformUtils.select(
        ios: "ios", android: "value is string", fuchsia: "fuchsia");

    expect(result, "value is string");
  });

  test("without Context, value is Function", () {
    final result = PlatformUtils.select(
        ios: "ios", android: () => "value from function", fuchsia: "fuchsia");

    expect(result, "value from function");
  });

  test("based platform value is not passed", () {
    final result = PlatformUtils.select();

    expect(result, null);
  });

  test("returns default value if params are not passed", () {
    var result = PlatformUtils.select(defaultWhenNull: "default");

    expect(result, "default");

    result = PlatformUtils.select(defaultWhenNull: () => "default");

    expect(result, "default");
  });
}
