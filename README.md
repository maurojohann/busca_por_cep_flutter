
# POST CODE SEARCH

## The Project:

This application does the search by zip code, and returns a table with the address data

## Objective:
Put into practice knowledge about local storage with Hive, using BloC state management, in a CleanArch layered architecture, persist and restore a BloC state with hydrated_bloc package.
Taking the opportunity to use two packages flutter_native_splash and flutter_icons, as extra knowledge.

## Result:

* Dark Mode

![dark_mode](https://user-images.githubusercontent.com/15696360/202547181-ff3d95af-115e-4f71-a835-f123da3b7798.png)

* Light Mode

![ligth_mode](https://user-images.githubusercontent.com/15696360/202547312-f64dc6f2-f65d-4a9d-b2cf-15327321f57a.png)


## Features:

* Clean architecture;
* Bloc state managed
* Hive local storage

## Arch:

    root
    └─ lib
    ....├─ core
    ........├─ app
    ........├─ di
    ............└─ global_dependencies.dart
    ....├─ features
    ........├─ home
    ............├─ data
    ................├─ datasourses
    ................├─ entities
    ................├─ models
    ................├─ repositories
    ............├─ presenter
    ................├─ bloc
    ................├─ components
    ............└─ home_page.dart
    ............└─ home.dart
    ........├─ result
    ............├─ presenter
    ................└─ result_page.dart
    ....├─ shared
    ........├─ components
    ........├─ router
    ........├─ theme
    ........├─ utils
    ....└─ main.dart

## Dependencies:

Flutter version: 3.3.3

Packages:
  * flutter_bloc: ^8.1.1  
  * flutter_native_splash: ^2.2.8  
  * flutter_icons:  
  * hydrated_bloc: ^8.1.0  
  * path_provider: 
  * google_fonts: ^3.0.1  
  * hive: ^2.2.3  
  * hive_flutter: ^1.1.0  
  * get_it: ^7.2.0  
  * dio: ^4.0.6  
  * mask_text_input_formatter: ^2.4.0  
  * freezed: ^2.1.0+1
  
## Framework and Tools:

* flutter & dart;
* android emulator;

## Licença:

    MIT License

    Copyright (c) 2022 Matheus Ferreira

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
