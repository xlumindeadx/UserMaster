# UserMaster

Aplicación desarrollada con **Flutter** como proyecto de interfaz para la gestión y autenticación de usuarios.

El proyecto implementa diferentes pantallas, navegación entre vistas, validaciones de formularios, componentes reutilizables y una estructura organizada siguiendo principios de **Clean Architecture**.

## 📱 Descripción

El proyecto fue construido con una estructura modular para facilitar el mantenimiento y crecimiento de la aplicación.

Entre los principales flujos implementados se encuentran:

* Splash Screen.
* Inicio de sesión.
* Registro de usuario.
* Recuperación de contraseña.
* Dashboard.
* Perfil de usuario.
* Cierre de sesión.
* Navegación mediante `BottomNavigationBar`.
* Validación de formularios.

## 🖥️ Pantallas

El proyecto cuenta con las siguientes pantallas principales:

### Splash

Pantalla inicial que se muestra al iniciar la aplicación y permite controlar el flujo inicial de navegación.

### Login

Permite al usuario ingresar sus credenciales.

Incluye:

* Campo de correo.
* Campo de contraseña.
* Validación de información.
* Acceso al registro.
* Acceso a recuperación de contraseña.

### Registro

Permite crear un nuevo usuario.

Incluye:

* Nombre.
* Correo electrónico.
* Contraseña.
* Confirmación de contraseña.
* Validaciones.

### Recuperar contraseña

Permite simular el proceso de recuperación de contraseña mediante el correo electrónico.

### Dashboard

Es la pantalla principal después del inicio de sesión.

Desde esta sección se puede acceder a las funcionalidades principales de la aplicación.

### Perfil

Permite visualizar la información correspondiente al usuario actualmente autenticado.

---

## 🛠️ Tecnologías

El proyecto utiliza principalmente:

* **Flutter**
* **Dart**
* **Material Design**
* **Git**
* **GitHub**
* **GitHub Actions**
* **GitHub Pages**

---

## 📂 Estructura del proyecto

La aplicación está organizada siguiendo una estructura basada en **Clean Architecture**, separando funcionalidades y responsabilidades.

```text
UserMaster/
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── assets/
│   └── images/
│
├── lib/
│   ├── core/
│   │   ├── routes/
│   │   ├── services/
│   │   ├── theme/
│   │   ├── utils/
│   │   └── widgets/
│   │
│   ├── features/
│   │   ├── auth/
│   │   │   └── presentation/
│   │   │
│   │   ├── dashboard/
│   │   │   └── presentation/
│   │   │
│   │   ├── profile/
│   │   │   └── presentation/
│   │   │
│   │   └── splash/
│   │       └── presentation/
│   │
│   └── main.dart
│
├── .gitignore
├── pubspec.yaml
└── README.md
```

### `core`

Contiene elementos compartidos por diferentes funcionalidades de la aplicación.

```text
core/
├── routes/
├── services/
├── theme/
├── utils/
└── widgets/
```

### `features`

Contiene las funcionalidades principales de la aplicación.

```text
features/
├── auth/
├── dashboard/
├── profile/
└── splash/
```

Cada funcionalidad mantiene sus componentes organizados de manera independiente.

---

## 📦 Requisitos

Para ejecutar el proyecto es necesario tener instalado:

* Flutter SDK.
* Dart SDK incluido con Flutter.
* Git.
* Visual Studio Code o Android Studio.
* Google Chrome para ejecutar la versión Web.

Para verificar la instalación de Flutter:

```bash
flutter doctor
```

---

## 🚀 Instalación

Clonar el repositorio:

```bash
git clone https://github.com/xluminedax/UserMaster.git
```

Ingresar a la carpeta:

```bash
cd UserMaster
```

Instalar las dependencias:

```bash
flutter pub get
```

Si el proyecto necesita habilitar la plataforma Web:

```bash
flutter create --platforms=web .
```

---

## ▶️ Ejecución

Para ejecutar la aplicación en Chrome:

```bash
flutter run -d chrome
```

Para detener la aplicación:

```text
Ctrl + C
```

También es posible ejecutar el proyecto desde Android Studio o Visual Studio Code seleccionando el dispositivo correspondiente.

---


## 🔄 Flujo de la aplicación

El flujo principal de la aplicación es:

```text
                 ┌─────────────┐
                 │    Splash   │
                 └──────┬──────┘
                        │
                        ▼
                 ┌─────────────┐
                 │    Login    │
                 └──────┬──────┘
                        │
             ┌──────────┴──────────┐
             │                     │
             ▼                     ▼
        ┌──────────┐        ┌──────────────┐
        │ Registro │        │ Recuperar    │
        │          │        │ contraseña   │
        └────┬─────┘        └──────────────┘
             │
             ▼
       ┌─────────────┐
       │  Dashboard  │
       └──────┬──────┘
              │
              ▼
        ┌───────────┐
        │  Perfil   │
        └───────────┘
```


## ✅ Validaciones

Los formularios cuentan con validaciones para evitar el ingreso de información incorrecta.

Entre las validaciones consideradas se encuentran:

* Campos obligatorios.
* Formato de correo electrónico.
* Contraseña.
* Confirmación de contraseña.
* Validación de datos antes de continuar.

Estas validaciones permiten mejorar la experiencia del usuario y evitar datos incompletos.

---


## 🎨 Tema y diseño

El tema general de la aplicación se encuentra centralizado en:

```text
lib/core/theme/
```

Esto permite mantener de forma organizada:

* Colores.
* Tipografías.
* Estilos.
* Componentes visuales.
* Configuración general de Material Design.

La centralización del tema facilita realizar cambios visuales sin tener que modificar cada pantalla individualmente.

---

## 🔄 CI/CD

El proyecto incluye configuración para automatizar el proceso de publicación mediante **GitHub Actions**.

El workflow se encuentra en:

```text
.github/workflows/deploy.yml
```

El flujo de despliegue contempla:

```text
Push
  │
  ▼
GitHub Actions
  │
  ├── Flutter setup
  │
  ├── flutter pub get
  │
  ├── flutter build web
  │
  ▼
GitHub Pages
```

De esta manera, el proyecto puede ser compilado y publicado automáticamente en GitHub Pages.

---


## 👩‍💻 Autora

**Mariana Cardona Mazo**

Proyecto individual desarrollado como parte del proceso de aprendizaje y práctica de desarrollo de aplicaciones con Flutter, organización de proyectos, Git y despliegue Web.

---

## 📄 Licencia

Este proyecto fue desarrollado con fines académicos y educativos.
