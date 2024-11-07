import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class NativeModule {
  static const _platform = MethodChannel('native_module');
  final logger = Logger();

  Future<void> showToast(String message) async {
    try {
      await _platform.invokeMethod('show-toast', {
        'message': message,
      });
    } on PlatformException catch (e) {
      logger.e("Error in Toast native module: ${e.message}");
    }
  }
}
