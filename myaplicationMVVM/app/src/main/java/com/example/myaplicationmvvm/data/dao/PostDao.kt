package com.example.myaplicationmvvm.data.dao

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.example.myaplicationmvvm.data.model.PostModel
import com.example.myaplicationmvvm.data.repository.PostsRepository

class PostDao (private val postsRepository: PostsRepository){
    private val _posts = MutableLiveData<List<PostModel>>()
    val posts: LiveData<List<PostModel>> get() = _posts

    private val _error = MutableLiveData<String>()
    val error: LiveData<String> get() = _error


    private val _result = MutableLiveData<Boolean>()
    val result: LiveData<Boolean> get() = _result

    fun getPosts() {
        postsRepository.getPost(
            callback = { postList ->
                _posts.value = postList // Notifica a los observadores en el ViewModel
            },
            errorCallback = { throwable ->
                _error.value = throwable.message // Notifica el error al ViewModel
            }
        )
    }

    fun addPost(post: PostModel) {
        postsRepository.createPost(post, callback = {
            _result.value = true // Éxito en el guardado
        }, errorCallback = { throwable ->
            _result.value = false // Error en el guardado
        })
    }
}