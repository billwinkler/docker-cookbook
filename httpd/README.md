### How to
Create a symbolic link called 'html' which maps to a given html project on the host.  For example, if ~/projects/reports/v1 contains the html, js, and css resources for version 1 of a set of reports, then create a symbolic link to this project directory...


	$ ln -s ~/projects/reports/v1 html
	

Create a container named "reports"...

	$ docker run -d -p 8080:80 --name reports -v "$(pwd)/html":/usr/local/apache2/htdocs/ billwinkler/httpd:v1

On iOS, determine the local ip address of the boot2docker virtual machine...

	$ boot2docker ip


Open the reports from the browser, for example...

	$ /Applications/Firefox.app/Contents/MacOS/firefox http://192.168.59.103:8080/


Stop the docker container...

	$ docker stop reports


Destroy the images

	$ docker rm reports
