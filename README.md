# Hello Noona

This is a fairly basic yet comprehensive test suite to test the Noona demo pages. The robot test checks for a valid response, if some of the elements exist on page, and then will start testing if an invalid email and password returns the expected error messages.

It will be for the Noona coding assignment.

Site: https://demo.patient.noonatest.com/patient/#/login

Stack: Robot Framework, python based libraries

## Libraries used:

- Library Selenium2Library
- Library Collections
- Library RequestsLibrary
- Library Screenshot
- Library OperatingSystem
- Library Builtin

## Installation and Usage

In order to use this library, first clone this branch.

You can install all required packages and software with pip

- pip install robotframework
- pip install robotframework-selenium2library
- pip install robotframework-requests

Run the test with:

python -m robot .\tests\TestSuite.robot

### Setup webdriver

You may need to setup a webdriver to run this test. This test uses chrome, so a chrome webdriver is needed. The webdriver is simply downloaded from [here](https://sites.google.com/chromium.org/driver/) and added to paths. If you need help with paths, here is a short video: https://www.youtube.com/watch?v=dz59GsdvUF8

### Errors

If you are burdened with errors from the webdriver on windows, you can install pywin32 to clear them from console.

- pip install pywin32
