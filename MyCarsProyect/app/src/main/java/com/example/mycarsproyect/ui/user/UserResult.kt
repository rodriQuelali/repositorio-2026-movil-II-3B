package com.example.mycarsproyect.ui.user

import com.example.mycarsproyect.data.user.model.UserResponse


data class UserResult(
    val success: UserResponse? = null,
    val error: Int? = null
)