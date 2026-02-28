package com.example.myaplicationmvvm

import android.os.Bundle
import android.util.Log
import androidx.activity.enableEdgeToEdge
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.example.myaplicationmvvm.ui.viewmodel.PostViewModel

class MainActivity : AppCompatActivity() {
    private val postViewModel: PostViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
        setupObservers()
        loadPosts()
    }


    //ui
    //DOS ESTADOS OBSERVER, LISTA POST Y EL ERROR

    private fun setupObservers() {
        // Observa los posts
        postViewModel.posts.observe(this) { posts ->
            posts?.forEach {
                // Actualiza la UI con la lista de posts
                Log.d("Posts", "Número de posts: ${it.id}")
                // Aquí puedes actualizar tu RecyclerView o cualquier otro componente UI
            }
        }

        // Observa los errores
        postViewModel.error.observe(this) { errorMessage ->
            errorMessage?.let {
                Log.e("Error", it)
                // Aquí puedes mostrar un mensaje de error en la UI
            }
        }
    }
    private fun loadPosts() {
        postViewModel.getPosts() // Carga los posts
    }
}