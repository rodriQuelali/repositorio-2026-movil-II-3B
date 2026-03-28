package com.example.mycarsproyect.ui.user

import android.util.Patterns
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

    // para mi validacion del formulario
    private val _userForm = MutableLiveData<UserFormState>()
    val userFromState: LiveData<UserFormState> = _userForm

    //para mi peticion API
    private val _userResult = MutableLiveData<UserResult>()
    val userResult: LiveData<UserResult> = _userResult

    //funcion de registro de user - viewModel
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

    //llamado de validacion del formulario.
    fun userDataChanged(firstname:String, lastName:String, email:String, password:String){
        if(!isFirstNameValid(firstname)){
            _userForm.value = UserFormState(firstNameError = R.string.erro_firstName)
        }else if(!isLastNameValid(lastName)){
            _userForm.value = UserFormState(lastNameError = R.string.erro_lastName)
        }else if(!isEmailValid(email)){
            _userForm.value = UserFormState(emailError = R.string.erro_email)
        }else if(!isPasswordValid(password)){
            _userForm.value = UserFormState(passwordError = R.string.erro_password)
        }else{
            //button
            _userForm.value = UserFormState(isDataValid = true)
        }
    }

    private fun isFirstNameValid(name:String): Boolean = name.isNotBlank()
    private fun isLastNameValid(name:String): Boolean = name.isNotBlank()
    private fun isEmailValid(email:String): Boolean = Patterns.EMAIL_ADDRESS.matcher(email).matches()
    private fun isPasswordValid(password:String): Boolean = password.length > 5

}