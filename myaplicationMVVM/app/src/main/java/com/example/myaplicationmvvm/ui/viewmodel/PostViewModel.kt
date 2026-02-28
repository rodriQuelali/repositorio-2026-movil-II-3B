package com.example.myaplicationmvvm.ui.viewmodel

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import com.example.myaplicationmvvm.data.dao.PostDao
import com.example.myaplicationmvvm.data.model.PostModel
import com.example.myaplicationmvvm.data.repository.PostsRepository

class PostViewModel (application: Application): AndroidViewModel(application){

    private val postDao: PostDao

    val posts: LiveData<List<PostModel>> get() = postDao.posts
    val error: LiveData<String> get() = postDao.error

    init {
        val postsRepositori = PostsRepository()
        postDao = PostDao(postsRepositori)
    }

    fun getPosts(){
        //viewModelScope.launch {
        postDao.getPosts()  // Asumiendo que getPosts() maneja todo internamente
        //}
    }
}