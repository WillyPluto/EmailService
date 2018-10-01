clean:
	rm -rf dist

build: clean
	mkdir dist
	zip -r dist/code.zip emailer
	zip -uj dist/code.zip lambda/*
	mkdir dist/temp
	cp -r venv/lib/python3.6/site-packages/* dist/temp/
	cd dist/temp && \
		zip -u ../code.zip * && \
		cd ../..
	rm -rf dist/temp

deploy: build
	aws s3 rm s3://trv-test-code-bucket --recursive
	aws s3 cp dist s3://trv-test-code-bucket --recursive