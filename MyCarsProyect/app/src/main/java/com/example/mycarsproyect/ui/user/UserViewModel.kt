package com.example.mycarsproyect.ui.user

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.mycarsproyect.data.user.model.User

import com.example.mycarsproyect.data.user.repository.UserRepository
import androidx.lifecycle.viewModelScope
import com.example.mycarsproyect.R
import com.example.mycarsproyect.data.login.model.Result
import kotlinx.coroutines.launch

class UserViewModel (private val userRepository: UserRepository): ViewModel(){

    // para mi validacion
    private val _userForm = MutableLiveData<UserFormState>()
    val userFromState: LiveData<UserFormState> = _userForm

    //para mi peticion API
    private val _userResult = MutableLiveData<UserResult>()
    val userResult: LiveData<UserResult> = _userResult

    fun registerUser(user: User){
        viewModelScope.launch{
            val result = userRepository.register(user)
            if(result is Result.Success){
                _userResult.value = UserResult(success = result.data)
            }else{
                _userResult.value = UserResult(error = R.string.error_registro)
            }
        }

    }
}