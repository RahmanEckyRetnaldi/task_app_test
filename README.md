# flutter_task

A new Flutter project.

## Getting Started

Please use these command in command line to get started:

1. `dart pub global activate fvm` -> to install fvm to your main flutter installation, make sure fvm command can be run from command line after doing this, if not, add Pub/Cache/bin (not sure where, depends on OS and installation) to PATH env
2. `fvm install` -> to install correct flutter version for this project
3. `fvm dart pub global activate melos` -> to install melos in system, make sure melos command can be run from command line after doing this, should be done if fvm (step 1 & 2) already setup properly
4. `melos bootstrap` -> to run flutter pub get for all available packages
5. `melos build_runner` and then select * or press enter -> to
   run `fvm flutter pub run build_runner` build for all available packages
6. copy `.env.example` in root project to `.env` in root project, edit according to development
   environment. inside .env add :
   `BASE_URL="https://reqres.in/api"`
7. `melos env` -> generate .env dart code based on .env files

### IDE Setup
For more complete guide or extra features, see this link: https://fvm.app/docs/getting_started/configuration/#ide 

#### VSCode
- open or create settings.json in .vscode directory
- make sure to add these to the json config:
```json
{
    "dart.flutterSdkPath": ".fvm/flutter_sdk",
    // Remove .fvm files from search
    "search.exclude": {
        "**/.fvm": true
    },
    // Remove from file watching
    "files.watcherExclude": {
        "**/.fvm": true
    }
}
```

#### Android Studio
- Every time you open the project, make sure you change “Flutter SDK” path to <RootProject>/.fvm/flutter_sdk
- see link above to exclude .fvm/flutter_sdk from being scanned by IDE

#### Credential Login
```
{
"email": "eve.holt@reqres.in",
"password": "cityslicka"
}
```

## Project Structure

```plaintext
root_project/
├── app/
│   └── task_app/                # Main application module (entry point)
├── core/                        # Core modules providing shared services and utilities
│   ├── common_dependency/       # Common utilities and dependencies
│   ├── components/              # Reusable UI components
│   ├── dependency_injection/    # Dependency injection configurations
│   ├── nav_list/                # Navigation lists or route definitions
│   ├── navigation/              # Core navigation logic
│   └── network/                 # Network communication logic
│   env/                         # Environment configurations
├── feature/                     # Feature-specific modules
│   ├── auth/                    # Authentication-related features
│   ├── splash/                  # Splash screen logic
│   └── task/                    # Task management features
└── melos.yaml                   # Melos configuration file
```
---

## Modules

### **1. App Module** (`app/task_app`)
- **Purpose**: Acts as the main application entry point.
- **Responsibilities**:
    - Combines all core and feature modules.
    - Provides the `main.dart` file to bootstrap the application.

---

### **2. Core Modules** (`core`)
Shared modules providing essential services, utilities, and logic used by feature modules.

#### Subfolders:
- **`common_dependency`**: Common utilities and shared logic (e.g., constants, helper methods).
- **`components`**: Reusable UI components (e.g., buttons, input fields).
- **`dependency_injection`**: Dependency injection configurations (e.g., `GetIt` or `Provider`).
- **`nav_list`**: Navigation route definitions.
- **`navigation`**: Core navigation logic.
- **`network`**: Network-related logic (e.g., API clients, interceptors).
- **`env`**: Environment-specific configurations.

---

### **3. Feature Modules** (`feature`)
Feature-specific modules that implement specific functionalities.

#### Subfolders:
- **`auth`**: Manages user authentication (e.g., login, registration).
- **`splash`**: Implements splash screen and initial app setup.
- **`task`**: Handles task management (e.g., task lists, details).

---

## Clean Architecture Overview
This project in feature module follows **Clean Architecture** principles by dividing responsibilities into three main layers:

### 1. **Data Layer** (`src/data`)
- Manages data sources (API, local database) and implements repository logic.
- **Key Subfolders:**
    - `datasources`: Handles raw data from APIs or databases.
    - `models`: Represents raw data structures.
    - `repositories`: Implements repository interfaces defined in the domain layer.
    - `mappers`: Converts raw data (models) to domain entities.

### 2. **Domain Layer** (`src/domain`)
- Contains the core business logic of the application.
- **Key Subfolders:**
    - `entitiy`: Abstract data models for business logic.
    - `usecases`: Application-specific business rules.
    - `repositories`: Abstractions for data access (implemented in the data layer).

### 3. **Presentation Layer** (`src/presentation`)
- Handles UI and state management.
- **Key Subfolders:**
    - `pages`: Screens and widgets for the application,State management (e.g., Bloc, Provider)..
---

## FAQ
- Q: can't run, why?\
  A:
    - check `melos bootstrap`, is it success? should have `- xx package bootstrapped` at the end of script execution, if there is none, check script execution output, there should be some errors, see other FAQ for the resolution
    - check `fvm flutter --version`, it should contains same version as flutterSdkVersion inside `.fvm/fvm_config.json`. if not same, retry `fvm install`, if still same, remove fvm cache, use `fvm list` to get its cache directory
    - Compile error, check below for available FAQ
- Q: Melos bootstrap error, `blablabla is not recognized as an internal or external command` , or `no such file or directory`, why?
  A: Melos doesn't support directory with space
