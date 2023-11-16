Custom FreeRADIUS server
========================

Dockerfile and Makefile to build a custom FreeRADIUS server based on Alpine docker container.

Please see https://freeradius.org and https://wiki.freeradius.org for
more information.

Getting Started
---------------
1- Install Docker (or Docker Desktop) and make sure the docker daemon is running
   https://www.docker.com/products/docker-desktop/

2- Customise the configuration under "/raddb"
   See ``raddb/README.rst`` for information on what to do to update your
   configuration.
   The complete documentation can be found here:
   ``https://networkradius.com/doc/current/index.html``

3- Build a docker image
   ``make build``

4- Run the radius server
   ``make run``

5- Stop the server when complete
   ``make stop``


run "make help" to see the above options!
