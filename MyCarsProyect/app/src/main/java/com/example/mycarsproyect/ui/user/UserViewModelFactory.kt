package com.example.mycarsproyect.ui.user

import android.content.Context
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.example.mycarsproyect.data.login.datasources.LoginDataSource
import com.example.mycarsproyect.data.login.repository.LoginRepository
import com.example.mycarsproyect.data.user.datasources.UserDataSource
import com.example.mycarsproyect.data.user.repository.UserRepository
import com.example.mycarsproyect.ui.login.LoginViewModel

class UserViewModelFactory(private val context: Context) : ViewModelProvider.Factory {

    @Suppress("UNCHECKED_CAST")
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(UserViewModel::class.java)) {
            return UserViewModel(
                userRepository = UserRepository(
                    dataSource = UserDataSource(context)
                )
            ) as T
        }
        throw IllegalArgumentException("Unknown ViewModel class")
    }
}