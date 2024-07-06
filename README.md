# Flutter-Mobile-Recipe-Recommendation-Application
Mobile Recipe Suggestion Application, Flutter-based, available on IOS and Android platforms compatible, allowing users to choose the food ingredients they have or the food they prefer.It is a mobile application that allows finding and accessing recipes by category.
The code written for each page of the application is located in the "Pages" folder inside the "lib" directory. Below are the screenshots of each page sequentially.

                                     -->introdiction_screen page
                                     ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/5cbc6a00-052e-493d-9277-20adcf6a49b2)

                                     --> introdiction_screen page
                                    ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/28356576-ebeb-4254-8508-2478b77f604a)

                                    ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/4538e152-9238-446f-9e78-1077000d22b3)
                                    introdiction_screen to transition between pages .The code is written on the page.


                                     --> login_page  Page
                                    ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/098295d0-229f-4767-9e75-cb0b13b728c5)

                                    ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/6f9b31e8-76c8-4902-8cd5-e1648c2286f1)
                                    “Username or password is incorrect” Warning

                                    --> “Username or password is incorrect” Warning
                                    ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/ba322fbd-0ea7-4594-a7bd-77ff310256be)

                                    --> register_screen” Page
                                    ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/20afe4af-6923-403c-a320-806d9d12f9ff)

                                    The user is asked for name, e-mail and password information. This information is the requested information. 
                                    codes given below to verify has been written .

                                       ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/c638f9e7-d75d-40b1-a79b-ff68b17f409b)
                                                                         This code was written to check names.    

                                       ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/633342e0-4815-435d-bb27-9f829fa0503a)
                                         The user's entered email was checked with controlMail to verify  if it is in the correct email format.
                                               Validator is the code written on the login_page. This code defines the characters of the email. 
                                                              In this way, it was checked whether it is in the email format

                                        ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/e4aeddbe-3b79-442c-9b5a-8824c94f9628)
                                               It is required that the password created by the user must be at least 6 characters long, 
                                                                     which is enforced with this code 


                                         ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/7afcc1f7-01b8-481d-bbaf-7c4ccdc2663d)
                                                        This code was written to check if the user entered the wrong password 
                                                                     during verification and to provide a warning


                                          ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/1d7c5579-95fa-4371-93c8-f374d535c9e7)
                                                        The screen displaying the warnings when the requested information is not met.


                                           ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/bf8599cc-f675-4cd1-b36b-fbe75e715372)
                                                                   The screen displaying the Registration Successful message.


                                                                                 Authentication Process
                                           ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/507343dc-3d43-42e8-9a5a-6b0e2d700063)
  An asynchronous function has been used. The function takes email, password, and user parameters to create a new user. Within the function, a try-catch block is used to register the user through FirebaseAuth.instance. The expression 'FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)' is used to register the user in Firebase Authentication with the specified email and password. If an error occurs during the registration process, the error is caught and returns false. If the 
                             error code is 'email-already-in-use', the message 'Please enter a different email' is printed to the console.


                                   --> forget_password Page
                                   ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/2fb51a5f-9e49-4116-a669-ea346336dd29)
                 The user is directed to the Forgot Password page using the Forgot Password button on the login screen, as shown in the screenshot.
                         On this page, the user enters the email they used in the application, and a password reset link is sent to their email.


                                  --> welcome_page Page
                                   ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/79683956-5631-4d31-a521-3dd53eccc6e3)
                   After logging into the application, the user is presented with options to choose how they want to use the application, as seen in the screenshot. 
                   They can select either "Find by Ingredient" or "Find by Category". They are directed to this page after the login screen, ensuring that the
                                                                   message "Login Successful" is displayed.


                                  --> reciepe_choose_page Page
                                 ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/93cb2bd0-246c-42e4-857d-684b328aea52)
               After selecting the "Find by Ingredient" option, the user is presented with checkboxes of food ingredients, as seen in the screenshot.
          The user selects the ingredients they have on hand. The images shown on the screen are located in the assets folder under the ingredients file.


                                  --> reciepe_result_page  Page
                                      ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/5d29460d-23c9-49ec-be51-f6cb2fe4f1af)
                    On the "recipe_choose" page, the user displays images and names of recipes from the database that contain the selected food ingredients. 
                        As seen in the screenshot, the chosen food ingredients are designed to be displayed over the image of the recipe they belong to.


                                  --> category_page Page
                                        ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/90cb8c66-c58c-4e3d-9656-c137a75dd83b)
         After selecting the "Find by Category" option on the "welcome_page" screen, the user is redirected to the "category_page" as shown in the screenshot. 
                                               On the "category_page", there are various food categories displayed.

                                       The images of the categories are taken from the "categories" file inside the "assets" folder.
                                  ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/0d4c7b0c-d9e8-4747-a2a0-11d81cf9ad18)
                                                           A code that displays the images from the categories file


                                --> category_result_page Page
                                ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/63ebb3d3-b2ae-4e42-ab85-e2c4006809e0)
                            The user is enabled to view recipe listings from the selected food category from the "category_page" on the screen,
                                                             displaying recipes stored in the database.
                                

                                --> reciepe_detail_page Page
                                ![image](https://github.com/yagmur-kolanc/Flutter/assets/65070514/0ac5b129-19e1-4a79-a8c1-3700788adb4f)
                           This page is created for users who choose both the "Find by Ingredient" and "Find by Category" options in the application. For both choices, 
                                  it enables displaying on the screen the image, ingredients, and recipe instructions of the selected dish from the listed recipes.

                                
