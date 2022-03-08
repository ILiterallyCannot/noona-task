*** Settings ***
Library     Browser
Resource    keywords.resource
Resource    variables.resource

*** Test Cases ***

Teach A New Thing
    New Page    http://espoonkopsu.fi:8022/teach
    Get Title   ==  Things
    Set Input Element
    Answer Questions
    Submit Answer
    Check Answer
