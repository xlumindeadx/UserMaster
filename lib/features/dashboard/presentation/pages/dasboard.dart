import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _indiceActual = 0;

  final List<Map<String, dynamic>> elementos = [
    {
      'titulo': 'Nueva notificación',
      'descripcion':
          'Tienes una nueva notificación pendiente.',
      'icono': Icons.notifications_outlined,
    },
    {
      'titulo': 'Tarea completada',
      'descripcion':
          'La tarea "Revisar proyecto" fue completada.',
      'icono': Icons.task_alt,
    },
    {
      'titulo': 'Nuevo mensaje',
      'descripcion':
          'Has recibido un nuevo mensaje.',
      'icono': Icons.message_outlined,
    },
    {
      'titulo': 'Actualización',
      'descripcion':
          'Hay una nueva actualización disponible.',
      'icono': Icons.system_update_outlined,
    },
    {
      'titulo': 'Recordatorio',
      'descripcion':
          'Tienes un recordatorio para hoy.',
      'icono': Icons.alarm_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      // APPBAR
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          _indiceActual == 0 ? 'Inicio' : 'Perfil',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (_indiceActual == 0)
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'No tienes nuevas notificaciones',
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.notifications_none,
              ),
            ),
        ],
      ),

      // CONTENIDO
      body: _indiceActual == 0
          ? _inicio()
          : _perfil(),

      // NAVEGACIÓN
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: (index) {
          setState(() {
            _indiceActual = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  // =========================================================
  // INICIO
  // =========================================================

  Widget _inicio() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [

        // TARJETA DE BIENVENIDA
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.blue,
                ),
              ),

              SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hola, Usuario 👋',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Bienvenido de nuevo',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        const Text(
          'Elementos recientes',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 12),

        // 5 TARJETAS
        ...elementos.map(
          (elemento) => _tarjeta(
            titulo: elemento['titulo'],
            descripcion: elemento['descripcion'],
            icono: elemento['icono'],
          ),
        ),
      ],
    );
  }

  // =========================================================
  // TARJETA
  // =========================================================

  Widget _tarjeta({
    required String titulo,
    required String descripcion,
    required IconData icono,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icono,
            color: Colors.blue,
          ),
        ),

        title: Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            descripcion,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),

        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),

        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(titulo),
            ),
          );
        },
      ),
    );
  }

  // =========================================================
  // PERFIL
  // =========================================================

  Widget _perfil() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [

        const SizedBox(height: 20),

        // FOTO / ICONO
        const CircleAvatar(
          radius: 55,
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.person,
            size: 65,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 15),

        const Text(
          'Usuario',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 5),

        const Text(
          'usuario@correo.com',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),

        const SizedBox(height: 30),

        // DATOS DEL PERFIL
        Card(
          color: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [

              ListTile(
                leading: const Icon(
                  Icons.person_outline,
                  color: Colors.blue,
                ),
                title: const Text(
                  'Nombre',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text('Usuario'),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
                onTap: () {},
              ),

              const Divider(height: 1),

              ListTile(
                leading: const Icon(
                  Icons.email_outlined,
                  color: Colors.blue,
                ),
                title: const Text(
                  'Correo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle:
                    const Text('usuario@correo.com'),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
                onTap: () {},
              ),

              const Divider(height: 1),

              ListTile(
                leading: const Icon(
                  Icons.settings_outlined,
                  color: Colors.blue,
                ),
                title: const Text(
                  'Configuración',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        // CERRAR SESIÓN
        SizedBox(
          height: 52,
          child: OutlinedButton.icon(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
            label: const Text(
              'Cerrar sesión',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              side: const BorderSide(
                color: Colors.blue,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}