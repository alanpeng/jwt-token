.PHONY: clean default public-key

default:
	pyinstaller -c -F main.py
	cp dist/main /usr/bin/license && chmod a+x /usr/bin/license

clean:
	@rm -rf __pycache__ build dist

public-key:
	openssl rsa -in private.pem -outform PEM -pubout -out public.pem
