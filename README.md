#lab3-jxiao2023
### ***COP4655 Lab 2*** - Joseph Xiao Z#23707133

#### App Description - 
&emsp; This app clones some of the main functionalities of Instagram and applies some aspects of the BeReal app to help prep for the unit project. 
Users will be able to sign up and login to Instaparse where they can select photos from their photo album to post to their feed. 
All user authentication and data for your app will be saved and accessed via a remote custom Parse backend server. The User has the ability to take photos 
with the camera and add more complex filtering logic to the posts returned in your query.

#### Features List - 
- [x] Users can sign up to create a new account.
- [x] Users can log in after creating an account.
- [x] Users are able to log out
- [x] Users are able to persist their login credentials on multiple app launches
- [x] Users can create a Post by choosing an existing photo from their photos library and uploading it with a caption to the server.
- [x] Users can view posts they've created in their feed.
- [x] Users are able to use the camera to take a photo and upload it to the server (your Parse server)
- [x] Users are not able to see other users’ photos until they upload their own.
    - Fetch the 10 most recent photos within the last 24 hours from the server.
      - Of those returned in the response, only show the post if the createdAt property is within 24 hours of the logged in user’s last post. Else, just hide it.
    - Students have an option to implement a blur view in the project.
    - For storing when the user last made a post, create a lastPostedDate property in the User object that gets updated whenever the user uploads a photo
     
#### Video App Demos - 

![instaparse_walkthrough_1_xtra_small](https://user-images.githubusercontent.com/11927517/199710313-700aef85-ba89-427c-aa07-f89f0fdfdbbe.gif)
