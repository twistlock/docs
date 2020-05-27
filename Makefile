test:
	export RESULT=$(docker run --rm -v "$(PWD):/workdir" tmaier/hunspell -u3 -d en_US -p our_dict -H admin_guide/access_control/*.adoc) 
	echo $(RESULT)
	ifeq ($(RESULT),)
		exit 1
	endif