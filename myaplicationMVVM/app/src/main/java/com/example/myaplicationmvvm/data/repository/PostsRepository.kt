package com.example.myaplicationmvvm.data.repository

import com.example.myaplicationmvvm.data.model.PostModel
import com.example.myaplicationmvvm.data.remote.ApiClient
import com.example.myaplicationmvvm.data.remote.ApiServices
import org.jetbrains.annotations.Async
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class PostsRepository {

    private val apiServices: ApiServices = ApiClient.instancias

    fun getPost(callback: (List<PostModel>?)-> Unit, errorCallback: (Throwable)-> Unit){
        apiServices.getPosts().enqueue(object : Callback<List<PostModel>>{
            override fun onResponse(
                call: Call<List<PostModel>?>,
                response: Response<List<PostModel>?>
            ) {
                //TODO("Not yet implemented")
                if(response.isSuccessful){
                    callback(response.body())
                }else{
                    errorCallback(Exception("Error: ${response.code()}"))
                }
            }

            override fun onFailure(call: Call<List<PostModel>?>, t: Throwable) {
                //TODO("Not yet implemented")
                errorCallback(t)
            }
        })

    }

    fun createPost(post: PostModel, callback: (PostModel) -> Unit, errorCallback: (Throwable) -> Unit) {
        apiServices.createPost(post).enqueue(object : Callback<PostModel> {
            override fun onResponse(call: Call<PostModel>, response: Response<PostModel>) {
                if (response.isSuccessful) {
                    callback(response.body()!!)
                    //callback() cuando solo devuelve un 200, ok sin cuerpo.
                } else {
                    errorCallback(Throwable("Error en la respuesta"))
                }
            }

            override fun onFailure(call: Call<PostModel>, t: Throwable) {
                errorCallback(t)
            }
        })
    }
}