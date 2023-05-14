# Job Board

This is a Rails project that allows users to post, manage and apply for jobs.

# Features

* Admin users can post jobs with a title, description, location, company, job type, requirements and expires at.
* Job Seekers can apply for jobs by submitting their email, phone, resume and cover letter.
* Admin users can manage jobs and applications
* Once Admin marks the application as read, the email will be sent to job seekers to notify them about the application status.

# Requirements

* Ruby 3.2.2 or higher
* Rails 7.0.4.3 or higher

## Installation

1. Clone the repository
2. cd into the directory
3. Run `bundle install`
4. Run `rails server

## Usage

* Visit `localhost:3000` in your web browser.
* To post a job, click on the "New Job" button if you admin.
* To apply for a job, click on the "Apply" button.
* To manage jobs and applications, log in as an admin user.
* To mark the job application as read, click"View" for any Job Post, on the show page, if you admin you will find all applications for this job, then click on "Mark as Seen", once the status is updated, the email will be sent for the job application user.
* If you want to show all your job applications, you can click "My Application" at the top of the page

## Documentation

* See the [Rails documentation](https://guides.rubyonrails.org/) for more information.

## Contributing

* Please feel free to contribute to this project!
* Just fork the repository and make your changes.
* Then, submit a pull request.

## Thanks!

Thanks for using my project (Job Board)