

import 'package:flutter/material.dart';

class MyAppDraw extends StatelessWidget {
  const MyAppDraw({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Professional Drawer UI',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        fontFamily: 'Roboto',
      ),
      home: HomeScreen(),
    );
  }
}




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      // ================= DRAWER =================
      drawer: Drawer(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF3949AB),
                    Color(0xFF5C6BC0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/300',
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Rodri Quelali',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Administrador',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),

            // MENU ITEMS
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  drawerItem(
                    icon: Icons.home_rounded,
                    title: 'Inicio',
                    onTap: () {},
                  ),
                  drawerItem(
                    icon: Icons.person_rounded,
                    title: 'Perfil',
                    onTap: () {},
                  ),
                  drawerItem(
                    icon: Icons.notifications_rounded,
                    title: 'Notificaciones',
                    onTap: () {},
                  ),
                  drawerItem(
                    icon: Icons.analytics_rounded,
                    title: 'Reportes',
                    onTap: () {},
                  ),
                  drawerItem(
                    icon: Icons.settings_rounded,
                    title: 'Configuración',
                    onTap: () {},
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(),
                  ),

                  drawerItem(
                    icon: Icons.logout_rounded,
                    title: 'Cerrar sesión',
                    color: Colors.red,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // FOOTER
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),

      // ================= BODY =================
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenido 👋',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Diseño profesional de Drawer en Flutter',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),

            // CARDS
            Row(
              children: [
                Expanded(
                  child: dashboardCard(
                    icon: Icons.people,
                    title: 'Usuarios',
                    value: '1,250',
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: dashboardCard(
                    icon: Icons.bar_chart,
                    title: 'Ventas',
                    value: 'Bs. 12K',
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ================= DRAWER ITEM =================
  Widget drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.black87,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
        hoverColor: Colors.indigo.withOpacity(0.1),
        onTap: onTap,
      ),
    );
  }

  // ================= DASHBOARD CARD =================
  Widget dashboardCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 20),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}