KnightTime is an app that lets find your next favorite medieval experience or host one yourself. 

Users can browse all listed medieval experiences, search and filter them. Users can also bookmark an experience they are interested in for later, book it and talk to its owner. After using an experience, the user can leave a review.
The user can host their own medieval experience if they want to. After they confirm a booking, they can talk to the user that booked their experience.

## Getting Started
### Setup

Install gems
```
bundle install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
Inspired by the team's shared appreciation of swords.

## Team Members
- [Shinji Matsudo](https://github.com/vShinji)
- [Mario Paju](https://github.com/MarioPaju1991)
- [Rachael Momber](https://github.com/RLMP44)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License

