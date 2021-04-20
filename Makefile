
init:
	@docker-compose run tf init

format:
	@docker-compose run tf fmt

validate:
	@docker-compose run tf validate

apply:
	@docker-compose run tf apply -auto-approve

destroy:
	@docker-compose run tf destroy -auto-approve

plan:
	@docker-compose run tf plan

output:
	@docker-compose run tf output

state:
	@docker-compose run tf show

outputs:
	@docker-compose run tf output 

account_number:
	@docker-compose run tf output -json account_number  | jq -r

show_creds:
	#May need to run " aws-vault exec <profile>" to see output
	@echo "AWS_SECRET_ACCESS_KEY = ${AWS_SECRET_ACCESS_KEY}"
	@echo "AWS_SESSION_TOKEN = ${AWS_SESSION_TOKEN}"
	@echo "AWS_DEFAULT_REGION = ${AWS_DEFAULT_REGION}"
	@echo "AWS_ACCESS_KEY_ID = ${AWS_ACCESS_KEY_ID}"

