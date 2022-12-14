# **Simple Store App**

You can see a video [Here](https://drive.google.com/file/d/1fAViiwKNT0ooUSb7JH3hwaehuXTCys9Y/view?usp=drivesdk)

## Screenshots

  Splash screen                 |   Login screen        |  Verify screen with notification | Verify screen 
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![photo_2022-11-11_17-55-10](https://user-images.githubusercontent.com/55716560/201379416-9a3911cc-af04-4289-acbf-e1cda55e5c7a.jpg)|![photo_2022-11-11_17-55-40](https://user-images.githubusercontent.com/55716560/201379738-9e68ce74-372d-4938-9dc8-71ab6566f458.jpg)|![photo_2022-11-11_17-56-46](https://user-images.githubusercontent.com/55716560/201380104-22dc71a4-2c7f-4ad2-ac22-42b59642b056.jpg)|![photo_2022-11-11_17-57-22](https://user-images.githubusercontent.com/55716560/201380202-c85d41b1-3a18-4486-9606-f91582bf7e09.jpg)


  Home screen                 |   Product Details screen        |  Help Screen 
:-------------------------:|:-------------------------:|:-------------------------:
![photo_2022-11-11_17-58-13](https://user-images.githubusercontent.com/55716560/201380362-8503f9a5-39b0-4f9a-813c-a09f8bc59d0e.jpg)|![photo_2022-11-11_17-59-13](https://user-images.githubusercontent.com/55716560/201380548-4cc02242-f2d9-423e-98f0-cc6143597e7b.jpg)|![photo_2022-11-11_17-59-30](https://user-images.githubusercontent.com/55716560/201380595-e062028f-9ff1-47f9-9edf-e8d5e2ee3a5b.jpg)

 ## Project Structure
```
lib
├── business_logic
├── data
├── presentation
├── helper
├── Utilities
└── main.dart
```

### business_logic
This folder containes the business logic of the application specificly state management using BloC Cubit.

```
business_logic
├── Auth_cubit
├── OTPAuth_cubit
├── Productl_cubit
└── help_cubit
```

### data
This folder contains all data and operations done to that data
```
data
├── Data Source(API)
├── models
└── repository
```

### presentation
This folder containes everything related to the Ui f the application.
```
presentation
├── screens
└── widget
```

### Helper
This folder containes Network helper , shared Prefereace and Local notifiation.
```
helper
├── local
├── remote
└── notification
```

### Utilities
This folder containes routing and constants
```
Utilities 
├── constants.dart
├── routes.dart
└── router.dart
```
