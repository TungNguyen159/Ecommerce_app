# shop_app

A new Flutter project following Clean Architecture.

## Table of Contents

- [Project Structure](#project-structure)
- [Features](#features)
- [Getting Started](#getting-started)
- [How to Run](#how-to-run)
- [Dependencies](#dependencies)
- [Contact](#contact)


## Clean Architecture Overview


- **Presentation Layer**  
  Contains UI code, widgets, pages, and state management (Bloc/Cubit/Provider). This layer interacts with the domain layer to display data and handle user input.

- **Domain Layer**  
  The core business logic of the app. It includes entities, repositories (abstract definitions), and use cases. This layer is independent of any external frameworks or libraries.

- **Data Layer**  
  Responsible for data sources (API, local database, etc.), data models, and repository implementations. This layer communicates with external services and converts data into domain entities.

- **Core Layer**  
  Contains shared utilities, error handling, network helpers, and other common code used across features.

- **Features**  
  Each feature (e.g., product, auth, cart) has its own folder, following the same structure: data, domain, and presentation.

## Project Structure

```
lib/
├── core/                        # Core utilities, error handling, network, etc.
├── features/                    # Each feature has its own folder
│   └── product/
│       ├── data/                # Data layer: datasources, models, repositories
│       ├── domain/              # Domain layer: entities, repositories, usecases
│       └── presentation/        # Presentation layer: pages, widgets, bloc/cubit
├── routes/                      # App routing
└── main.dart                    # App entry point
```

## Features

- Product listing and detail pages
- Category selection
- Search functionality
- Responsive UI for mobile
- Clean Architecture structure

## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to Run

1. Clone the repository:
    ```sh
    git clone <repo-url>
    cd shop_app
    ```
2. Install dependencies:
    ```sh
    flutter pub get
    ```
3. Run the app:
    ```sh
    flutter run
    ```

## Dependencies

- [flutter](https://pub.dev/packages/flutter)
- [go_router](https://pub.dev/packages/go_router)
- [carousel_slider](https://pub.dev/packages/carousel_slider)
- (See `pubspec.yaml` for full list)

## Contact

For any questions, please contact [your-email@example.com](mailto:your-email@example.com).