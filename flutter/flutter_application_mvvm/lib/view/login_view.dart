import 'package:flutter/material.dart';

// Clase de Colores para el diseño del Login
class LoginColors {
  // Colores primarios
  static const Color primary = Color(0xFFFF9500); // Naranja
  static const Color secondary = Color(0xFF65BB8D); // Verde azulado
  static const Color tertiary = Color(0xFF365555); // Gris azulado oscuro
  
  // Colores de fondo
  static const Color background = Color(0xFF0F1B1E); // Fondo oscuro principal
  static const Color surfaceLight = Color(0xFF1A2A2E); // Superficie más clara
  static const Color surfaceDark = Color(0xFF0F1A1D); // Superficie más oscura
  
  // Colores de texto
  static const Color textPrimary = Color(0xFFFFFFFF); // Blanco
  static const Color textSecondary = Color(0xFFB0B0B0); // Gris claro
  
  // Otros
  static const Color border = Color(0xFF2A3A3E);
  static const Color shadow = Color(0x1A000000);
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscurePassword = true;
  bool _rememberPassword = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoginColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
              color: LoginColors.background,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header con botón de retroceso
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: LoginColors.surfaceLight,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: LoginColors.textPrimary,
                            size: 20,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Nexus',
                            style: TextStyle(
                              color: LoginColors.primary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 40),
                    ],
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Título
                const Text(
                  'Bienvenido de nuevo',
                  style: TextStyle(
                    color: LoginColors.textPrimary,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // Subtítulo
                const Text(
                  'Inicia sesión para continuar',
                  style: TextStyle(

                    color: LoginColors.textSecondary,
                    fontSize: 16,
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Campo de Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(
                          color: LoginColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _emailController,
                        style: const TextStyle(
                          color: LoginColors.textPrimary,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: 'tu@email.com',
                          hintStyle: const TextStyle(
                            color: LoginColors.textSecondary,
                          ),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: LoginColors.primary,
                          ),
                          filled: true,
                          fillColor: LoginColors.surfaceLight,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: LoginColors.border,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: LoginColors.border,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: LoginColors.primary,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Campo de Contraseña
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contraseña',
                        style: TextStyle(
                          color: LoginColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: const TextStyle(
                          color: LoginColors.textPrimary,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: '••••••••',
                          hintStyle: const TextStyle(
                            color: LoginColors.textSecondary,
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outlined,
                            color: LoginColors.primary,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            child: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: LoginColors.textSecondary,
                            ),
                          ),
                          filled: true,
                          fillColor: LoginColors.surfaceLight,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: LoginColors.border,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: LoginColors.border,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: LoginColors.primary,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Opciones de recordar y olvidar contraseña
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _rememberPassword = !_rememberPassword;
                          });
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              value: _rememberPassword,
                              onChanged: (value) {
                                setState(() {
                                  _rememberPassword = value ?? false;
                                });
                              },
                              fillColor: MaterialStateProperty.resolveWith(
                                (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return LoginColors.primary;
                                  }
                                  return LoginColors.border;
                                },
                              ),
                            ),
                            const Text(
                              'Recordar contraseña',
                              style: TextStyle(
                                color: LoginColors.textSecondary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Implementar lógica de olvide contraseña
                        },
                        child: const Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(
                            color: LoginColors.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Botón Iniciar Sesión
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implementar lógica de login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LoginColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Divisor
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: LoginColors.border,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          '0',
                          style: TextStyle(
                            color: LoginColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: LoginColors.border,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Botón Google
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: () {
                        // Implementar lógica de login con Google
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: LoginColors.border,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/imagesgoole.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Registrarse con Google',
                            style: TextStyle(
                              color: LoginColors.textPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
