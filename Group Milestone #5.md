Original App Design Project - README Template
===

# FitBuddy

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

Fitbuddy is meant to function as a fitness tracker, where users are able to log their daily
workouts/meals, and also share their progress with their friends!

### App Evaluation

Category: Social
Mobile: The app also allows users to use their cameras, and gives real-time updates on their progress!
Story: This app gives users a journaling alternative for their fitness goals!
Market: The fitness industry is one of the largest their is, so a well formatted "Buddy" would go a long way.
Habit: The app is designed for daily use, since it primarily focuses on the day-to-day aspect of working out.
Scope: With the social/tracking elements combined, I say the app is rather dynamic.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [X] User can Sign in/Create an Account.
- [X] User can see three tabs (Workout, Food Intake, Social).
- [X] Users can log their workouts/caloric consumption.

**Optional Nice-to-have Stories**

* Users can use their cameras to add a picture of their food.
* User data is stored persistently, and they can view back on their progress.
* Users can "Save a Workout" for easier logging on repetitive sets.

### 2. Screen Archetypes

* Log in/Sign up Screen
    * Users can create an account/Sign in to it
* Workout Screen
    * Users can log a workout/view their progress on the day.
* Food Intake Screen
    * Users can log a meal/view their progress on the day.
* Social Screen
    * Users can upload their progress and view that of other users.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* First Tab, Workout Tab
* Second Tab, Food Intake Tab
* Third Tab, Social Tab

**Flow Navigation** (Screen to Screen)

* Workout Screen may lead to Workout Log Form.
* Food Intake Screen may lead to Meal Log Form.
* Social Screen may lead to Add Post Form
* Log in Screen will lead to Workout Screen


## Wireframes

![Fitbuddy Overview](https://hackmd.io/_uploads/HyEHXeekee.jpg)


## Schema 


### Models

| Property | Type | Description |
| -------- | -------- | -------- |
| username   | String     | unique id for the user post (default field)     |
| password   | String     | user's password for login authentication     |
| workout   | workout     | unique object which holds a users logged workouts.     |
| meal   | meal     | unique object which holds a users logged meals.     |
| post   |post     | unique object which holds a users posts.     |


### Networking

* [POST] /login - Authenticate user by username/password
* [POST] /users - Create a new user
* [POST] /classes/ParseSocialPost	Upload a new food or workout post
* [POST] /classes/Workout	Save user-specific workout
* [POST] /classes/FoodEntry	Save user’s meal data
