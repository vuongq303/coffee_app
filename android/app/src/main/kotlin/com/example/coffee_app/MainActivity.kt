package com.example.coffee_app

import android.widget.Toast
import com.example.coffee_app.modules.NativeModules
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val platformChannel = "native_module"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            platformChannel
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "show-toast" -> {
                    val message = call.argument<String>("message") ?: "No message"
                    NativeModules.showToast(context = this, message = message);
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
