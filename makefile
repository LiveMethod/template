# Generate static files
build:
	# make the dist dir if it doesn't exist
	mkdir -p colorpicker
	
	# Convert pug to html
	pug ./src --out ./colorpicker

	# Convert less to css
	lessc ./src/styles/main.less ./colorpicker/styles/main.css

	# move static assets
	cp -r ./src/fonts ./colorpicker
	cp -r ./src/img ./colorpicker
	cp -r ./src/js ./colorpicker
	cp -r ./src/styles ./colorpicker

# Delete static files
clean:
	rm -rf ./colorpicker

# Build everything and serve it locally
dev: build
	cd ./colorpicker; \
		python -m SimpleHTTPServer 8055

# Build everything and rsync it to brand.remitly.internal
deploy: build
	rsync -a colorpicker ubuntu@brand.remitly.internal:/var/www/brand/