# wait-thats-shiny
Sample Shiny application code from "Wait, that's Shiny?", a presentation at posit::conf(2024). 

In this repo, I share code for a simple Shiny app with some of the tips and tricks discussed during my posit::conf(2024) presentation, including: 

-  Adding context through Home, About, and Methodology pages, including linking to different tabs of the app on the Home page.
-  Creating sub-URLs for each tab that log in the browser history to make your app "feel" more like a website for users.
-  Adding in reactive titles to improve user interpretation of the app's functionality
-  Bookmarking to allow users to create and share a link to a specific state of the application


## Want to add more context to your site? 

Check out how the user interface is defined in `ui.R`. Also take a peek at the "Observe Links" section of `server.R` to see how to link from an actionButton to a specific page within your app. 

## Want to use Bookmarking to let app users share a certain state? 

Check out the "Bookmarking" sections in `global.R` and `server.R`

## Want to add sub-URLs for each tab that log in the browser?

Check out how each `tabPanel` is defined in `ui.R` and then the "Navigation and Sub-URLs" section of `server.R`.

## Want to add dynamic titles?

Check out the "Title" subsection in `server.R` to see how this is defined. 


## Want to level up your app's style? 

Learn CSS! It's pretty easy to define classes in a CSS file and utilize those classes within your app. Check out the "homepage-cards" class in `www/styles-demo.css`, the link tag that reads in the CSS file in `ui.R`, and the use of the class argument in the `div` function in `ui.R`. 


## Want to see examples of Data Explorers that inspired this talk? 


NORC's [Live Crime Tracker](https://livecrimetracker.norc.org){target="_blank"}: This site is a good example of a really fleshed-out user experience, with dynamic titles, hover-over labels, reactive notes and context, and lots of cross-linking between pages. 

MCBS [Chartbook](https://chartbook.mcbs.org){target="_blank"}: This site has great examples for sharing and downloading specific charts. It also has really detailed reactive source, notes, measure construction, and definitions for each selected chart that update based on the user's selection. It also has some fun custom user interface elements, including a styled carousel (thanks to Ian Lyttle for the [`bsplus` package](https://ijlyttle.github.io/bsplus/){target="_blank"})!

## What else can I do with Shiny? 

-  Add site metatags (these show up when you share a link to social media) using the [`metathis` package](https://github.com/gadenbuie/metathis){target="_blank"}.  
-  Add site-wide footers or details like links to a privacy policy or terms and conditions.
-  Do just about anything you can do in full-on HTML and CSS! 


