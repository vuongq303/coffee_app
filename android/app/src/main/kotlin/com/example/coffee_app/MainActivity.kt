package com.example.coffee_app

import android.Manifest.permission.POST_NOTIFICATIONS
import android.annotation.SuppressLint
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.example.coffee_app.modules.NativeModules
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val platformChannel = "native_module"
    private val channelId = "notification_channel"
    private val notificationId = 666

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

                "create-notification" -> {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                        ActivityCompat.requestPermissions(this, arrayOf(POST_NOTIFICATIONS), 1)
                        result.success("requested permission success")
                    }
                    NativeModules.createNotification(channelId, this)
                    result.success("requested permission failed")
                }

                "push-notification" -> {
                    NativeModules.pushNotification(
                        channelId = channelId,
                        context = this,
                        notificationId = notificationId,
                        notificationBody = "Hello this is a notification",
                        notificationTitle = "Notification title"
                    )
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
