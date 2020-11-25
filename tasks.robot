*** Settings ***
Library  Collections
Library  OperatingSystem
Library  String
Library  RPA.HTTP
Library  RPA.Robocloud.Items


*** Keywords ***
Ping Server
    [Arguments]  ${url}  ${report}
    ${response}=  HTTP Get  ${url}
    Append To List  ${report}  ${url} ${response.status_code}

*** Tasks ***
Monitor sites
    ${report}=  Create List
    Set Work Item Variable  site_report  ${report}

    ${envs}=  Get Environment Variables
    FOR  ${key}  ${value}  IN ZIP  ${envs.keys()}  ${envs.values()}
        ${MON}  Split String  ${key}  _  1
        Run Keyword If  '${MON}[0]'=='MON'  Ping Server  ${value}  ${report}
    END

    Save Work Item



