package com.example.coffee_app.modules

import android.content.Context
import android.widget.Toast

class NativeModules {
    companion object{
         fun showToast(message: String, context: Context) {
            Toast.makeText(context, message, Toast.LENGTH_SHORT).show()
        }
    }
}