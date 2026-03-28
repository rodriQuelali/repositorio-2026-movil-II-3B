package com.example.mycarsproyect.ui.user

import android.content.Intent
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import com.example.mycarsproyect.R
import com.example.mycarsproyect.data.user.model.User
import com.example.mycarsproyect.databinding.ActivityUserMainBinding
import com.example.mycarsproyect.ui.login.LoginActivity

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

                // El botón se habilita solo si el ViewModel confirma que los datos son válidos
                registroButton.isEnabled = userFormState.isDataValid

                // Muestra mensajes de error en los campos específicos si existen
                if (userFormState.firstNameError != null) {
                    firstName.error = getString(userFormState.firstNameError)
                }
                if (userFormState.lastNameError != null) {
                    lastName.error = getString(userFormState.lastNameError)
                }
                if (userFormState.emailError != null) {
                    email.error = getString(userFormState.emailError)
                }
                if (userFormState.passwordError != null) {
                    password.error = getString(userFormState.passwordError)
                }

            })

            //oberver registro
        // 4. Observador del resultado de la operación (UserResult)
        // Reacciona al éxito o fallo tras la petición al servidor
        userViewModel.userResult.observe(this, Observer { result ->
            val userResult = result ?: return@Observer

            if (userResult.error != null) {
                // Si hubo un error (ej. conexión o datos inválidos), mostramos el Toast de fallo
                showRegistrationFailed(userResult.error)
            }
            if (userResult.success != null) {
                // Si el registro fue exitoso (Status 201), mostramos bienvenida y cerramos
                updateUiWithUser(userResult.success.first_name)
                setResult(RESULT_OK)
                finish() // Cierra la actividad para volver a la pantalla anterior

                val intent = Intent(this, LoginActivity::class.java) // Cambia 'LoginActivity' por el nombre real de tu clase
                startActivity(intent)
                finish()
            }
        })


            val afterTextChangedListener = object : TextWatcher {
                override fun beforeTextChanged(s: CharSequence, start: Int, count: Int, after: Int) {}
                override fun onTextChanged(s: CharSequence, start: Int, before: Int, count: Int) {}

                override fun afterTextChanged(s: Editable) {
                    userViewModel.userDataChanged(
                        firstName.text.toString(),
                        lastName.text.toString(),
                        email.text.toString(),
                        password.text.toString()
                    )
                }
            }

            firstName.addTextChangedListener(afterTextChangedListener)
            lastName.addTextChangedListener(afterTextChangedListener)
            email.addTextChangedListener(afterTextChangedListener)
            password.addTextChangedListener(afterTextChangedListener)

        // 6. Acción del botón de registro
        registroButton.setOnClickListener {
            val userRequest = User(
                first_name = firstName.text.toString(),
                last_name = lastName.text.toString(),
                email = email.text.toString(),
                password = password.text.toString()
            )
            // Llama a la función de registro en el ViewModel (inicia la corrutina)
            userViewModel.registerUser(userRequest)
        }

            //TODO fin onCreate


    }
    //funciones o metodos
    /**
     * Muestra un mensaje de éxito al usuario cuando el registro se completa correctamente.
     * @param userName Nombre del usuario registrado para personalizar el saludo.
     */
    private fun updateUiWithUser(userName: String) {
        val welcome = "${getString(R.string.welcome)} $userName"
        Toast.makeText(applicationContext, welcome, Toast.LENGTH_LONG).show()
    }

    /**
     * Muestra un mensaje de error si el proceso de registro falla.
     * @param errorString Identificador del recurso de string con el mensaje de error.
     */
    private fun showRegistrationFailed(errorString: Int) {
        Toast.makeText(applicationContext, errorString, Toast.LENGTH_SHORT).show()
    }
}