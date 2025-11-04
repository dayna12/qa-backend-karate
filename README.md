# 🧪 Reto de Automatización QA Backend – ServeRest API

Este proyecto implementa una **suite de pruebas automatizadas** para la API pública de **[ServeRest](https://serverest.dev/)**, enfocada en la gestión de usuarios.
El objetivo es validar las operaciones CRUD del endpoint `/usuarios` utilizando **Karate DSL**, cubriendo casos positivos, negativos y validaciones de esquemas JSON.

---

## 📋 Objetivo

Automatizar las pruebas funcionales de la API de usuarios de ServeRest, garantizando la correcta creación, consulta, actualización y eliminación de usuarios mediante una suite confiable y reutilizable.

---

## 🧪 Tecnologías Utilizadas

* **Lenguaje:** Java 21+
* **Framework:** [Karate DSL 1.4.1](https://github.com/karatelabs/karate)
* **Gestor de dependencias:** Maven
* **Ejecución:** JUnit 5
* **IDE recomendado:** IntelliJ IDEA 

---

## 🗂️ Estructura del Proyecto

```
qa-backend-automation/
│
├── pom.xml                         # Dependencias y configuración de Karate
├── src/
│   └── test/
│       ├── java/
│       │   ├── runners/
│       │   │    └── UsuariosRunner.java     # Clase para ejecutar los feature files
│       │   ├── karate-config.js
│       │   └── logback-test.xml
│       └── resources/
│           ├── features/users
│           │   ├── delete-user.feature
│           │   ├── get-list-users.feature
│           │   ├── get-user-by-id.feature
│           │   ├── post-new-user.feature
│           │   └── put-update-user.feature
│           ├── schemas/
│           │   ├── user-detail.schema.json
│           │   ├── user-list.schema.json
│           │   └── user-new.schema.json
│           └── utils/
│           │   └── data-generator.js        # Generador de datos dinámicos
└── README.md
```

---

## 🚀 Configuración del Entorno

1. **Clonar el repositorio**

   ```bash
   git clone https://github.com/dayna12/qa-backend-karate.git
   cd qa-backend-karate
   ```

2. **Verificar que Maven y Java estén configurados**

   ```bash
   mvn -v
   java -version
   ```

3. **Instalar dependencias**

   ```bash
   mvn clean install
   ```

---

## ▶️ Ejecución de las Pruebas

Ejecutar todas las pruebas desde la raíz del proyecto:

```bash
mvn test -Dtest=runners.users.UsersRunner
```
EJECUTAR PRUEBAS POR TAGS
Listar
```bash
mvn test -Dkarate.options="--tags @listar"
```
Eliminar
```bash
mvn test -Dkarate.options="--tags @eliminar"
```
Crear
```bash
mvn test -Dkarate.options="--tags @crear"
```
Actualizar
```bash
mvn test -Dkarate.options="--tags @actualizar"
```
Buscar por id
```bash
mvn test -Dkarate.options="--tags @obtener"
```


También puedes ejecutar desde IntelliJ:

* Abrir `UsersRunner.java`
* Clic derecho → **Run 'UsersRunner'**

---

## ✅ Casos Cubiertos

| Operación  | Endpoint          | Descripción               | Casos incluidos                           |
| ---------- | ----------------- | ------------------------- |-------------------------------------------|
| **GET**    | `/usuarios`       | Listar todos los usuarios | Validar estructura y cantidad             |
| **POST**   | `/usuarios`       | Crear nuevo usuario       | Crear con datos válidos e inválidos       |
| **GET**    | `/usuarios/{_id}` | Buscar usuario por ID     | Validar usuario existente y no existente  |
| **PUT**    | `/usuarios/{_id}` | Actualizar usuario        | Actualización válida e inválida           |
| **DELETE** | `/usuarios/{_id}` | Eliminar usuario          | Eliminación correcta y con ID inexistente |

---

## 🧩 Estrategia de Automatización

1. **Arquitectura Modular:**
   Cada operación CRUD tiene su propio feature file, facilitando mantenimiento y escalabilidad.

2. **Reutilización de Código:**
   Se emplean *Backgrounds* y *variables globales* para centralizar la configuración.

3. **Datos Dinámicos:**
   Se generan usuarios aleatorios mediante scripts en `helpers/DataGenerator.js`.

4. **Validación de Esquemas JSON:**
   Se utilizan archivos en `/schemas` para validar respuestas de la API.

5. **Casos Negativos:**
   Incluyen validaciones de errores por datos inválidos, duplicados y recursos inexistentes.

---

## 📊 Reportes

Tras la ejecución, los reportes se generan automáticamente en:

```
target/karate-reports/karate-summary.html
```

Abrir el archivo en el navegador para revisar los resultados detallados.

---

## 🧠 Patrones y Buenas Prácticas

* **Given-When-Then:** estructura clara y legible de escenarios.
* **Uso de Tags:** `@smoke`, `@negative`, `@positive` para segmentar ejecuciones.
* **Validaciones consistentes:** uso de `match` y `assert` para verificar campos clave.
* **Datos desacoplados:** no se hardcodean valores, se generan dinámicamente.

---

## 👤 Autor

**Dayna Ruth Huarcaya Allauca**
Quality Assurance | Backend Automation

---

## 💎 Referencias

* [ServeRest API Docs](https://serverest.dev/)
* [Karate Labs Documentation](https://github.com/karatelabs/karate)