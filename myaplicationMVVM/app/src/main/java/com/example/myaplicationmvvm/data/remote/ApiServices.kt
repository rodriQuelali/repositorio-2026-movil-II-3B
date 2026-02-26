package com.example.myaplicationmvvm.data.remote

import com.example.myaplicationmvvm.data.model.PostModel
import retrofit2.Call
import retrofit2.http.GET

interface ApiServices {
    //empoints

    @GET("posts")
    fun getPosts(): Call<List<PostModel>>

    //, post, delete, put, etc.
}