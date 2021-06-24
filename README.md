# Health & Beyond College Project
This app gets along with [Health & Beyond](https://healthandbeyond.xyz/). It allows **`doctor`** and **`patient`** to easily accesss all features of [Health & Beyond](https://healthandbeyond.xyz/) using this app.

I made this **`Flutter`** app in short notice of a week.
That's why, some stuff is very clean and some is a little messy.
Also, I didn't have any time to add state management.
This is all done in one go.

You may use my code but it must be **free**, **publicly available** and **open source**.

### Check out the [video presentation](https://www.youtube.com/watch?v=tvBAQAZmhoM)
#### Timestamps :

- **Introduction to Mobile Application at `15:27`**
    - **Project Structure at `15:55`**
    - **Mobile Application at `18:19`**

# Featues

1. **`authentication`** : Authentication (Login) for `doctor` and `patient`
2. **`dashboard`** : Dashboard which shows **`statistics`** and **`diseases`** in city & state using a pie chart
3. **`history`** :  Shows patient records by scanning their **`qr code`** or **`patient id`**
4. **`profile`** :  Shows patient and doctor their respective profiles
5. **`notifications`** : Shows notifications for **`appointments`** and **`health events`**
6. **`add record`** : Allows **Dotcor** to add a new **`patient record`**

# Project Structure

I chose to implement sort of clean architecture in my project structure.
Project contains two main folders, **`core`** and **`features`**

- **`core`** contains all core data such as string resources, color and theme data, app prefrerences.
- **`features`** conatains all **`modules`** such as authentication, home, profile, notifications, etc.

This way, I can keep track of all features and easily manage it.

# Feature Structure

Each and every feature has **3 folders**,

1. **`domain`** : Contains all **abstact** classes for **`models`** and **`repositories`**
2. **`data`** : Contains all **implementation** for **`data sources`**, **`models`** and **`repositories`**
3. **`presentation`** : Contains all views in **`screens`** and **`widgets`**

# Purpose of each folder

1. ### **`domain`** subcontents

    1. **`models`** : Contains abstract classes for **`data models`**
    2. **`repositories`** : Contains abstract classes for **`repositories`**
    3. **`usecases`** : Conatins abstraction for **`usecase`**

2. ### **`data`** subcontents

    1. **`models`** : Contains implementation for **`data models`**
    2. **`repositories`** : Contains implementation for **`repositories`**
    3. **`data sources`** : Conatins abstraction and implementation for **`local and remote data sources`**

3. ### **`presentation`** subcontents

    1. **`screens`** : Contains **`views`** or main **`layout`**
    2. **`widgets`** : Contains complementing **`widgets`** that can be used inside **`main widget`**

4. ### **`core`** subcontents

    1. **`resources`** : Contains **`colors`**, **`dimensions`**, **`strings`**, **`styles`**, **`theme data`** and **`app routes`**
    2. **`preferences`** : Contains functions for **`shared preferences`** to sore data locally
    3. **`network`** : Contains **`data checker`** to check whether device is connected to internet or not
    4. **`usecases`** : Contains abstact classes for **`usecase`**
    5. **`errors`** : Contains abstarct classes for **`exceptions`** and **`failures`**
    6. **`requests`** : Contains app requests that fetch the data from **`api`**
    7. **`utils`** : Contains **`utilities`** such as **`random color generator`** for pie chart
