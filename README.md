# Futbol
![1140-world-cup-trophy-ball-trivia-esp imgcache rev web 900 518](https://user-images.githubusercontent.com/118634754/234059102-7b3ff570-d028-438a-accb-e8be4de5b0e3.jpg)

## About

This is a stat tracker that pulls from data and returns a number of different stats for the based on game, league and season data.

## Built With

- Ruby version 2.7.2
- RSpec version 3.1.2
- Rubocop version 1.50.2
- Simplecov version 0.22.0
- [Turing Spec_Harness](https://github.com/turingschool-examples/futbol_spec_harness)

## Getting Started

1. Fork this repository and clone onto your local machine using the following command from your terminal:

```zsh
$ git clone git@github.com:turing-2303-mod-1-group-project/futbol.git
```

2. In your `Gemfile`, ensure the following gems are added:
```
gem "simplecov", require: false, group: :test
gem "rspec"
```

3. Ensure all gems are installed by running the following from your main director in your terminal:

```zsh
$ bundle install
```

4. From the main directory run `ruby runner.rb` and you can check any of the stats with the methods in `stat_tracker.rb`

from /Users/garrettgregor/turing_work/1mod/projects/futbol_master/futbol:

```
$ ruby runner.rb
$ stat_tracker.lowest_scoring_home_team"
# => "Utah Royals FC"
```


## Testing

- First ensure that you have all neccessary gems installed
- All helper methods have been tested and test coverage is at 100% with `simplecov`:

<img width="1904" alt="Screenshot 2023-04-24 at 10 49 17 AM" src="https://user-images.githubusercontent.com/118634754/234063316-3dcc25df-c788-4b8b-b990-12e9b9ce1cd8.png">

- Tests can also be run from the [Turing Spec_Harness](https://github.com/turingschool-examples/futbol_spec_harness)
- Tests are organized in the same order they appear in our program:
  - Game Stats
  - League Stats
  - Season Stats
  - Helper Methods
- Additional tests have been run to ensure complete validity of all methods defined in the program

## Challenges & Wins

- Reflect on your process and what you have learned in the project.
  - The process we had from the beginning was a huge learning experience for all of us. We learned a lot about how each other worked and how to navigate a group project that is dependent on each other's work.
- What were the challenges you experienced?
  - Process wise, this project was one of the most challenging to navigate. Our group ran into issues while trying to work with multiple people working on different things simultaneously and ensuring that everyone was on the same page.
  - We were also challenged early on with managing our time amongst a group that lived in different time zones and balancing getting to know one another with actually making headway on the work.
- How did you overcome them?
  - Coming back together to re-DTR solved a lot of our time management issues and thankfully we did that early on in the project.
  - Additionally, we managed conflict by utilizing the resources in the DTR and resolving through live synchronous feedback with a mediator.
- How will this experience benefit you in future projects?
  - This experience will be incredibly valuable in working through issues that might come up on future projects or job. Being able to work asynchronously was definitely challenging at first, but has helped us all to become more familiar with the workflows that might be required of us on the job and in future project.
  - Another benefit has been in giving and receiving feedback. Being more assertive in the moment and referring back to our DTR will be a huge help going forward, as well as keeping the mindset that we are all learning and can't be perfect (even after we've learned 😅).

### Authors

- Myles Nottingham
  - [LinkedIn](https://www.linkedin.com/in/myles-nottingham/)
  - [Github](https://github.com/MylesNottingham)
- Matthew Lim
  - [LinkedIn](https://www.linkedin.com/in/matthew-lim-va/)
  - [Github](https://github.com/MatthewTLim)
- Javen Wilson
  - [LinkedIn](https://www.linkedin.com/in/javen-wilson-17bb35264/)
  - [Github](https://github.com/javenb022)
- Garrett Gregor
  - [LinkedIn](https://www.linkedin.com/in/garrett-gregor/)
  - [Github](https://github.com/garrettgregor)

## Deliverables

- Check-ins
  - We held a re-DTR about halfway through the project on Thursday, April 20 and held communication across various channels both synchornously through Slack huddles and asynchronous via Github projects and Slack direct group messages.
- Project Organization and Workflow
  - We chose to utilize Github projects instead of Trello.
  - [Project Board](https://github.com/orgs/turing-2303-mod-1-group-project/projects/6)
  - We assigned one main person to be our project manager who helped us to manage the workflow and assigning of tasks.
  - Looking back, we underestimated how much our main setup branch would disproportionately affect the number of commits and later on in the project realized a few of our group members were at a severe disadvantage.
- Different approaches
  - Some of our members preferred working live through problems, while others preferred working asynchronously after being assigned tasks.
  - At other points, members of our team operated differently in terms of how they worked through solutions: at times we struggled with how to balance the two.
  - We also kept each other organized in conceptualizing through the use of whiteboarding via Apple's Freeform (and initially via Google Jamboard):

    - Google Jamboard

<img width="1496" alt="Screenshot 2023-04-24 at 11 46 59 AM" src="https://user-images.githubusercontent.com/118634754/234076057-6267e43f-89b3-45c8-b794-deb69c19315c.png">

    - Apple Freeform

<img width="856" alt="Screenshot 2023-04-24 at 11 47 24 AM" src="https://user-images.githubusercontent.com/118634754/234076192-2f5b1178-0137-4978-811b-482b1170a089.png">


- Code Design
  - Our approach to code design was to first build out our setup.
  - After that, we brokeout into a whiteboard to try to visualize the way potential classes might interact with one another.
A 2-3 sentence summary describing your approach to the code design.

## After Retro

- Tools Utilized:
  - Apple Freeform and Slack Huddles:
<img width="1188" alt="Screenshot 2023-04-24 at 11 47 42 AM" src="https://user-images.githubusercontent.com/118634754/234076370-ee6009c3-1055-48cd-a6ec-1e4461aa4ef8.png">
- Top 3 things that went well during your project
  - Project Management, Tools/Utilities, Organization
<img width="846" alt="Screenshot 2023-04-24 at 11 53 15 AM" src="https://user-images.githubusercontent.com/118634754/234077039-c4dc5f0b-7495-4c33-be43-ac5c38556771.png">
- Top 3 things your team would do differently next time
  - Pull requests: setting time constraints for how long a pull request should sit
  - Github project board: utilizing more of the functionality built in to help automate our workflows
  - Communication: clarifying expectations for assignments and individuals
