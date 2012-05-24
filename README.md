# Siddick [![Build Status](https://secure.travis-ci.org/siddick/siddick.png)](http://travis-ci.org/siddick/siddick) / [![Dep Status](https://gemnasium.com/siddick/siddick.png)](http://gemnasium.com/siddick/siddick)


### Deploy on Heroku

```
git remote add heroku git@heroku.com:<your-project-repo>.git
git fetch heroku master:heroku
rake deploy_on_heroku
heroku run "rake db:migrate"
```

