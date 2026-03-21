package com.example.mycarsproyect.data.remote

import com.example.mycarsproyect.data.user.model.User
import com.example.mycarsproyect.data.user.model.UserResponse
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.Headers
import retrofit2.http.POST

interface ApiServices {

    //empoints...
    //@POST("auth/api/token/")
    //@Headers("Content-Type:application/json")
    //suspend fun getLogin(@Body loginRequest: LoginRequest): LoginResponse

    @POST("users/")
    @Headers("Content-Type:application/json")
    suspend fun getRegisterUser(@Body user: User): Response<UserResponse>

}