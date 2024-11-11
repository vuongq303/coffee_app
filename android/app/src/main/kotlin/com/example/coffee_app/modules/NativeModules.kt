package com.example.coffee_app.modules

import android.app.Activity
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.annotation.RequiresApi
import androidx.core.app.NotificationCompat
import com.example.coffee_app.R

class NativeModules {
    companion object {
        fun showToast(message: String, context: Context) {
            Toast.makeText(context, message, Toast.LENGTH_SHORT).show()
        }

        fun createNotification(channelId: String, context: Context) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                val channel =
                    NotificationChannel(channelId, "create notification", NotificationManager.IMPORTANCE_HIGH)
                val notificationManager =
                    context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
                notificationManager.createNotificationChannel(channel)
            }

        }

        fun pushNotification(
            context: Context,
            channelId: String,
            notificationTitle: String,
            notificationBody: String,
            notificationId: Int
        ) {
            val notificationManager =
                context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

            val notificationBuilder =
                NotificationCompat.Builder(context, channelId)
                    .setSmallIcon(R.drawable.avatar)
                    .setContentTitle(notificationTitle)
                    .setContentText(notificationBody)
                    .setPriority(NotificationCompat.PRIORITY_HIGH)
                    .setCategory(NotificationCompat.CATEGORY_RECOMMENDATION)

            notificationManager.notify(notificationId, notificationBuilder.build())
        }
    }
}