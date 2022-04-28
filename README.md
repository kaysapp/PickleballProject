# PickleballProject
## COMP6000 Semester Project

### Proposal Review

This proposal is to provide a Web page to a neighborhood association that is interested in offering pickleball on its courts.  The offering of pickleball includes lessons and the opportunity to join a team.  The website will contain a landing page for the neighborhood league and a place for administrators to maintain/update the site.

### Page Design and functionality:

This project uses HTML as well as JSP and XML that has been learned during the course in development.  CSS will also be used in refining the look of the site.  The database is MySQL.


### MVC Components

#### Models
- **User** - person who wants to take a pickleball lesson or join a team
- **Instructor** - Lesson instructors
- **Class** - Pickleball lessons (dates, times, instructors)
- **Match** - Pickleball match schedule

#### Views
The views created are centered around interest areas for site visitors
- Welcome Page
- About the group
- Learn to play
- Sign up (into group)
- Join a team
- Upcoming Matches
- Admin

#### Controllers
The controllers manage the appearance and retrieval of site info
- **Login** - called when someone plans to sign up for a class.  Most page users do not need to sign in
- **Signup for group** - If a person is new, they need to create a username and password
- **Show classes** - Fetches upcoming classes from database.
- **Signup for specific class** - Adds session user to list of students in a specific class



