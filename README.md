# GoGreen

GoGreen is an iOS application designed for plant enthusiasts, providing a comprehensive platform to learn about, care for, and find plants and flowers.

## Description

GoGreen isn't just an app—it's an immersive journey into the world of plants, designed for learning, exploration, and fun. Created with a passion for nature and a desire to push the boundaries of iOS development, GoGreen is an endeavor aimed at integrating various iOS development concepts into one innovative project.

With GoGreen, users embark on an educational adventure, discovering new plant species, trying out cutting-edge Apple frameworks, and honing their skills in a captivating environment. From the thrill of identifying unknown plants with CoreML to the satisfaction of nurturing your virtual garden with Core Data, every feature of GoGreen is crafted to inspire curiosity and spark creativity.

But GoGreen isn't just about learning—it's about having fun. Dive into a world of plant care videos from YouTube API, explore nearby plant shops with MapKit, and immerse yourself in a vibrant community of like-minded enthusiasts. Whether you're a seasoned developer looking to expand your skill set or a nature lover eager to deepen your understanding of plants, GoGreen offers something for everyone.

Join the adventure today and let GoGreen be your guide as you explore, learn, and grow in the captivating world of plants and flowers

## Getting Started

Due to the inclusion of a large file (FlowerClassifier CoreML file) that exceeds GitHub's size limitations, it cannot be uploaded directly to the repository. Therefore, in order to install the project, you will need to obtain this file from Git LFS (Large File Storage).

Follow these steps to install the project:

### 1. Clone Repository
- git clone https://github.com/Andria35/GoGreen.git

### 2. Install Git LFS extension using Homebrew (if you haven't already)
- brew install git-lfs

### 3. Navigate to cloned Repositoy
- cd GoGreen

### 4. Pull the FlowerClassifier CoreML file using Git LFS
- git lfs pull

In order you have problem with pulling file from git lfs, or you simply dont want to install git lfs extension on your machine (abandon steps 2-4), you can download FlowerClassifier file from given google drive
link, and manually replace FlowerClassifier file in GoGreen folder, with downloaded file: https://drive.google.com/drive/folders/1SiuGoVLoeECHhjMlVx_aRQbLVvNnrgnX?usp=drive_link


## Features

### 1. Search Plants
- Browse and search for desired plants.
- View detailed information about each plant.
- Utilizes VisionKit for text recognition from images.
<img width="816" alt="Screenshot 2024-02-12 at 17 47 37" src="https://github.com/Andria35/GoGreen/assets/96011442/d4e15944-d2d6-493e-b4c6-a33c4d0e171e">
<img width="808" alt="Screenshot 2024-02-12 at 17 56 02" src="https://github.com/Andria35/GoGreen/assets/96011442/15fe1749-68c1-4f91-9782-29176531b1c9">

### 2. Identify Plants
- Take a photo of a plant to identify its species.
- Uses Core ML for plant recognition.
<img width="833" alt="Screenshot 2024-02-12 at 17 56 41" src="https://github.com/Andria35/GoGreen/assets/96011442/6355b947-03c0-4f44-8137-4278ac639efc">

### 3. My Garden
- Keep track of your plants and set watering reminders.
- Uses Core Data for local data storage.
- Saves plant images using FileManager.
<img width="835" alt="Screenshot 2024-02-12 at 17 58 28" src="https://github.com/Andria35/GoGreen/assets/96011442/3a621415-1188-49af-9e29-14c6b9ad4ddf">

### 4. Plant Care
- Explore plant care videos from YouTube API.
- Utilizes WebView for playing YouTube videos.
<img width="804" alt="Screenshot 2024-02-12 at 17 59 27" src="https://github.com/Andria35/GoGreen/assets/96011442/db957b2e-dae2-4c6c-bd84-698f5c46e276">
<img width="816" alt="Screenshot 2024-02-12 at 17 59 45" src="https://github.com/Andria35/GoGreen/assets/96011442/a4b78504-5091-4eae-8c59-7f5d2856cfdc">

### 5. Near Me
- Discover plant shops near your location.
- Uses MapKit to display map information.
<img width="823" alt="Screenshot 2024-02-12 at 18 00 25" src="https://github.com/Andria35/GoGreen/assets/96011442/a7e98f18-7dd1-402f-bfca-ccca12f351c6">

## Usage

### Flower Recognition
The flower recognition model is trained to identify a finite number of flower species. In some cases, it may produce incorrect identifications. Here are a few photos that have been verified to be identified correctly:

- Sunflower:
  
![sunflower-1627193_1920](https://github.com/Andria35/GoGreen/assets/96011442/20be8af3-7ecd-44db-90ce-05ee785f79f3)

- Rose:
  
![rose-flower](https://github.com/Andria35/GoGreen/assets/96011442/59a3a04d-d377-4271-bbef-780d5c72e9b9)

- Passion Flower:

![1452975139987](https://github.com/Andria35/GoGreen/assets/96011442/745abc39-4f11-4b64-ae58-4f9eda5e1ad0)

### Watering Reminder
To test the watering reminder feature, the app provides a testing case of 0 days. If the user chooses to be reminded to water in 0 days, a notification will be sent after 5-10 seconds.

<img width="437" alt="Screenshot 2024-02-12 at 22 16 38" src="https://github.com/Andria35/GoGreen/assets/96011442/755b3be5-ff73-4f96-bc96-dbdf7eccfd19">

<img width="398" alt="Screenshot 2024-02-12 at 22 16 58" src="https://github.com/Andria35/GoGreen/assets/96011442/cfc872ca-81e1-4804-ab42-2ca48edc8443">

## Architecture
In GoGreen, we have adopted the MVVM (Model-View-ViewModel) architecture pattern. MVVM was chosen due to its ability to separate concerns effectively and provide a clear separation of responsibilities between different layers of the application.

### The motivation behind choosing MVVM for GoGreen includes:
- Separation of Concerns
- Testability
- Flexibility and Scalability

By adopting the MVVM architecture pattern, GoGreen aims to ensure a robust, maintainable, and scalable codebase, making it easier for developers to understand, extend, and maintain the application over time.

## Structure
In Xcode, the folder structure of GoGreen follows a logical organization to ensure clarity and maintainability. Here's an overview of the main folders:

### Aplication:
- Contains essential files related to the application setup and configuration, such as the AppDelegate and SceneDelegate files.
### Scenes
- Contains folders for each scene in the application. Each scene folder typically includes a Views folder, which contains the view controller and view model files specific to that scene.
### Components:
- Contains custom UI components or reusable UI elements used across different scenes of the application.
### Models:
- The model classes representing the data structures used within the application. These classes typically encapsulate the data and business logic related to specific entities in the application.
### Exstensions:
- Extensions for various Swift standard library types, UIKit components, or third-party libraries, providing additional functionalities or utilities.
### Managers:
- Contains manager classes responsible for handling specific tasks or functionalities, such as Alerting, File Managing, or Notification Managing.
### Helpers:
- Contains utility/helper functions or classes that provide common functionalities or assist in performing specific tasks across the application.
### Resources:
- Stores assets, including images, icons, and launch screen files, used within the application.

## Dependency
In GoGreen, we utilize Swift Package Manager (SPM) for managing dependencies.

### Libraries Used:
- Network Manager: https://github.com/Andria35/NetworkManager

## References

### Plant API:
- https://trefle.io/
### Youtube API:
- https://developers.google.com/youtube/v3
### FlowerClassifier Model:
- https://github.com/jimgoo/caffe-oxford102







