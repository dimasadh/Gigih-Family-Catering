# Gigih Family Catering

This is a simple web based on Ruby on Rails Framework. This web is about a Family Catering Business that provides online order for their customer.

**Assumption** on this project :
1. Every account is an admin
2. Every use case only works inside the website, no JSON provided

## Installation

Ruby Version : 3.0.3

Rails Version : 7.0.1

1. Clone this repository
```
git clone https://github.com/dimasadh/Gigih-Family-Catering.git
```
2. Install all of the required gems
```
bundle install
```
3. Run database migration
```
rails db:migrate
```
4. Run database seeder as initial data (optional)
```
rails db:seed
```
5. Run the server
```
rails server
```

## Run from Replit

Only run on Test Environment. Check **issue**.

1. Run database migration
```
rails db:migrate RAILS_ENV=test
```

2. Run database seeder as initial data (optional)
```
rails db:seed RAILS_ENV=test
```

3. Run the server only from console
```
rails server -e test
```

## Entitiy Relationship Diagram

This entity is provided to explain how the database is designed in this project.

![alt text](https://ik.imagekit.io/dimasadh/Diagram_Entitas_FP_Gigih_yQcT-w4HT.png?ik-sdk-version=javascript-1.4.3&updatedAt=1650671944562)


## Issue

#### Replit's Database disk image for Development is malformed

![alt text](https://ik.imagekit.io/dimasadh/Screenshot_2022-04-23_064124_2QX_NN_Vv.png?ik-sdk-version=javascript-1.4.3&updatedAt=1650670906309)

This issue comes when i was doing CRUD in rails console on Replit. I could not find a way to fix this problem except to create a new Replit project. Then i realized that the malformed disk image is only on **Development Environment** database, so that we still can use the Database on the **Test Environment**.


