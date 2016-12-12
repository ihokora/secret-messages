# Self-destruct Messages
https://secret-message-00.herokuapp.com

Simple app build with [Hanami.rb](http://hanamirb.org/) that alow to create encrypred and self-destruct text messages .
App generate direct safe link to the message for easy and private sharing.
Users can choose how many hours or views need to self-destruction
### Installation
```sh
$ cd
$ git clone https://github.com/sikigo/secret-messages.git
$ bundle install
$ bundle exec hanami db prepare
```
### Todos

 - polish UI
 - heroku scheduler for clean up db regularly
 - add code comments
 - more tests
