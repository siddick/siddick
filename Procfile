web:      bundle exec thin start -p $PORT
queue: 	  bundle exec rake resque:work QUEUE=*
tsearch:  bundle exec rake sunspot:solr:run RAILS_ENV=test
test:  	  bundle exec guard
log:   	  tail -f log/development.log
search:   bundle exec rake sunspot:solr:run
