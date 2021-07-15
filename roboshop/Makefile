help:		## Print this message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/://' -e 's/\\$$//' | sed -e 's/##//'
frontend:	## installing Frontend Component
	@bash frontend.sh
catalogue:	## installing Catalogue Component
	@bash catalogue.sh
cart:		## installing Cart Component
	@bash cart.sh
user:		## installing User Component
	@bash user.sh
shipping:	## installing Shipping Component
	@bash shipping.sh
payment:		## installing Payment Component
	@bash payment.sh
mongodb:		## installing MOngoDB Component
	@bash mongodb.sh
redis:		## installing Redis Component
	@bash redis.sh
mysql:		## installing MySQL Component
	@bash mysql.sh
rabbitmq:	## installing RabbitMQ Component
	@bash rabbitmq.sh
databases:	## installing All Databases Component
databases:	mongodb redis mysql rabbitmq

