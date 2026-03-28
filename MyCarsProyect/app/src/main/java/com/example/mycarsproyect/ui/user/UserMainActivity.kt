package com.example.mycarsproyect.ui.user

import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import com.example.mycarsproyect.R
import com.example.mycarsproyect.databinding.ActivityUserMainBinding

class UserMainActivity : AppCompatActivity() {
    //primero inicalizamos la variable global de binding y VienModel de user
    private  lateinit var userViewModel: UserViewModel
    private lateinit var binding: ActivityUserMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_user_main)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
        //TODO oncreate
        binding = ActivityUserMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        userViewModel = ViewModelProvider(this, UserViewModelFactory(this))
            .get(UserViewModel::class.java)

        //llamado amis variable de UI
        val firstName = binding.firstName
        val lastName = binding.lastName
        val email = binding.email
        val password = binding.password
        val registroButton = binding.saveUser

        //observer stateForm
        userViewModel.userFromState.observe(this, Observer{ state ->
            val userFormState = state ?: return@Observer

        })

        //oberver registro




        //TODO fin onCreate


    }
    //funciones o metodos

}