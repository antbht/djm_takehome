# Welcome to my Dejamobile Takehome Project

This main repository should be the main entrypoint to discover the project. It defines the 3 other developed component as git submodules.

It also embed a testing script which provide you a single entrypoint to run the complete demo of the project.

## Project description

To illustrate my programming skills, I developped three basic components of the described architecture. 

The first component is the backend API (djm-back). It has been developped in Python by using Falcon. It offers three API endpoint to get a list of a user's digitalized cards, to add a card to a user cards list and to delete a card. The complete description concerning the backend is available in the coresponding project repository. 

The second component is the Backend API SDK. It has also been developped in Python. The aim of this component is to abstract the usage of the backend API and facilitate it. To reach the goals, the SDK is a Python package, which can be packaged independantly and used into a client. It offers the way to reach the three PAI endpoint and provides an abstraction of the API Model.

Finally, the third component, is a client using the Backend API SDK. It has also been developped in Python and take the form as a command line interface. It is configured to manipulate the cards of the user represented by the ID=0302.

Each project embed is own README and script to facilitate its review.

Let's see in next section how to run the complete demo of the integrated three components.

## Prerequisites

The project is made by using Python 3.8. Please ensure you have python 3.8 installed on your workstation. You will also need the virtualenv Python package to ensure independancy of your Python projects. 

All the provided scripts as been developped to be run on Unix workstation. 

## Get the project

Please clone this git repository and init submodules.

```lang=sh
cd /path/to/your/workspace
mkdir antbht_takehome
cd antbht_takehome
git clone .
git submodule update --init
```

## Run the complete demo

The complete demo is configured to start the project backend API on 127.0.0.1:8000 and run the client into the current terminal.

To do that, it inits a Python virtualenv, installs the djm-back and the djm-client projects in the env. At the end, it starts in background the djm-back app, then the djm-client app.

With the client you will be able to list your digitalized cards, add a card by giving its pan and finally delete a card by giving its uuid.
A command help describes you the possibility of the app.

## Scenario trace example

```
cd /path/to/your/workspace/antbht_takehome

chmod u+x run-demo.sh

bash run-demo.sh

# ...

[2020-10-01 18:56:50 +0200] [21327] [INFO] Starting gunicorn 20.0.4
[2020-10-01 18:56:50 +0200] [21327] [INFO] Listening at: http://127.0.0.1:8000 (21327)
[2020-10-01 18:56:50 +0200] [21327] [INFO] Using worker: sync
[2020-10-01 18:56:50 +0200] [21330] [INFO] Booting worker with pid: 21330

Welcome to your digitalized wallet !

==================

Your USER_ID is 0302.

==================

Type help or ? to have more information about your possibilities

wallet > help

Documented commands (type help <topic>):
========================================
about  help  q  quit

Undocumented commands:
======================
add_card  delete_card  my_cards

wallet > my_cards
Your cards:

1 - a23f0a3a-03f8-11eb-9ac0-3c15c2c07228 : XXXXXXXXXXXX1234
wallet > add_card 1234567891234567
Card added.

Your cards:

1 - a23f0a3a-03f8-11eb-9ac0-3c15c2c07228 : XXXXXXXXXXXX1234
2 - 229364ca-0407-11eb-975f-3c15c2c07228 : XXXXXXXXXXXX4567
wallet > delete_card a23f0a3a-03f8-11eb-9ac0-3c15c2c07228
Card deleted.

Your cards:

1 - 229364ca-0407-11eb-975f-3c15c2c07228 : XXXXXXXXXXXX4567
wallet > delete_card 229364ca-0407-11eb-975f-3c15c2c07228
Card deleted.

Your cards:

wallet > q
Goodbye !

```
