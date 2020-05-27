services:
	- docker

test:
	echo "hello world"
	docker run --rm -v $(pwd):/workdir tmaier/hunspell -u3 -d en_US -p our_dict -H admin_guide/access_control/*.adoc
