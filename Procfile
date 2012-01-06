web:   bundle exec thin start -p $PORT
queue: bundle exec rake resque:work QUEUE='*'
test:  bundle exec guard
log:   tail -f log/development.log
