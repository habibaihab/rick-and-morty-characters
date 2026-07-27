# Rick and Morty Characters App

## Overview

Rick and Morty Characters App is a Flutter application built using the Rick and Morty API. The application allows users to browse characters, search and filter them, view detailed character information, and export the displayed data to an Excel (.xlsx) file.

The project follows Clean Architecture principles and uses BLoC (Cubit) for state management, resulting in a scalable, maintainable, and well-organized codebase. The application is fully responsive and provides a smooth user experience across different screen sizes.

---

## Features

- Splash Screen.
- Fetch all characters from the Rick and Morty API.
- Search characters by name.
- Filter characters by status.
- View detailed information for each character.
- Export displayed characters to an Excel (.xlsx) file.
- Responsive UI for different screen sizes.
- Loading, empty, and error state handling.
- Reusable widgets and clean code structure.
- Clean Architecture.
- BLoC (Cubit) State Management.

---

## Screenshots


## Demo Video


---

## Architecture

The project follows **Clean Architecture** and uses **BLoC (Cubit)** for state management to ensure a clear separation of concerns, maintainable code, and predictable state management.

---

## API

This application uses the Rick and Morty REST API.

**Base URL**

```text
https://rickandmortyapi.com/api
```

**Endpoint Used**

```text
GET /character/?name=rick&status=alive
```

---

## Main Packages

- flutter_bloc
- dio
- equatable
- cached_network_image
- excel
- path_provider
- open_filex
- flutter_screenutil
- go_router
- google_fonts

---

## Getting Started

Clone the repository:

```bash
git clone https://github.com/your-username/your-repository.git
```

Navigate to the project directory:

```bash
cd your-repository
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

## Excel Export

The application allows users to export the currently displayed characters to an Excel (.xlsx) file.

The exported file includes:

- Character Name
- Status
- Species
- Gender
- Origin
- Location

