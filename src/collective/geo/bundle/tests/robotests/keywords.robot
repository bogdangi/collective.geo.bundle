*** Settings ***
Resource          plone/app/robotframework/keywords.robot
Library           Remote    ${PLONE_URL}/RobotRemote

*** Keywords ***
I'm logged in as a '${ROLE}'
    Enable autologin as    ${ROLE}
    Go to    ${PLONE_URL}

I go to c.geo controlpanel
    Go to homepage
    Click link    Manager
    Click link    Site Setup
    Click link    ${PLONE_URL}/@@collectivegeo-controlpanel
    Element should become visible    css=#formfield-form-widgets-geo_content_types

set document georeferenceable
    [Arguments]    ${name}    ${element}
    Go to    ${PLONE_URL}/@@collectivegeo-controlpanel
    Wait until location is    ${PLONE_URL}/@@collectivegeo-controlpanel
    Select From List    xpath=//select[@name="${name}.from"]    ${element}
    Click Button    xpath=/html/body/div[3]/div[2]/div/div[2]/div/div/div/form/fieldset/div/div/div[3]/table/tbody/tr/td[2]/button
    List Selection Should Be    xpath=//select[@name="${name}.to"]    ${element}
    Click Button    Apply
    Check Status Message    Changes Saved
