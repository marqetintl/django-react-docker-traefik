
dockerprodbuild:
	docker-compose -f docker-compose.prod.yml build

dockerprodup:
	docker-compose -f docker-compose.prod.yml up --build

dockerup:
	docker-compose up --build

dockermigrate:
	docker-compose -f docker-compose.prod.yml exec web python manage.py migrate --noinput