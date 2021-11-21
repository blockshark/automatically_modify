import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:automatically_modify/automatically_modify.dart';

void main() {
  const MethodChannel channel = MethodChannel('automatically_modify');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AutomaticallyModify.platformVersion, '42');
  });
}
