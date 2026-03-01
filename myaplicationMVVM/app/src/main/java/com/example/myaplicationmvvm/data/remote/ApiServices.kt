package com.example.myaplicationmvvm.data.remote

import com.example.myaplicationmvvm.data.model.PostModel
import retrofit2.Call
import retrofit2.http.Body

import retrofit2.http.GET
import retrofit2.http.POST


interface ApiServices {
    //empoints

    @GET("posts")
    fun getPosts(): Call<List<PostModel>>

    //, post, delete, put, etc.

    @POST("posts")
    fun createPost(@Body post: PostModel): Call<PostModel>
}