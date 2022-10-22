


install:
	docker-compose build
	docker-compose run nvim sh -c "git clone --depth=1 https://github.com/savq/paq-nvim.git /home/app/.local/share/nvim/site/pack/paqs/start/paq-nvim"
