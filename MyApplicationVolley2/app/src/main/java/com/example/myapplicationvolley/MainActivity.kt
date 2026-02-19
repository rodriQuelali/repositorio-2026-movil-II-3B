package com.example.myapplicationvolley

import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets

        }
        cargarHttpPosts()

    }

    fun cargarHttpPosts(){
        val queue = Volley.newRequestQueue(this)
        val url: String = "https://jsonplaceholder.typicode.com/posts"
        val strintRequest = StringRequest(com.android.volley.Request.Method.GET, url,
            Response.Listener<String>{ response ->
                //mapeado o en list --- objeto.
                println("Los datos ${response}")
            },
            Response.ErrorListener { println("Erro en la peticion") })
        queue.add(strintRequest)
    }


}