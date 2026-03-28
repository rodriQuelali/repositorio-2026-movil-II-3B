package com.example.mycarsproyect.ui.user

data class UserFormState(
    val firstNameError: Int? = null,
    val lastNameError: Int? = null,
    val passwordError: Int? = null,
    val emailError: Int ? = null,
    val isDataValid: Boolean = false
)
