*** Settings ***
Library     Collections
Library     OperatingSystem
Library     String
Library     RPA.HTTP
Library     RPA.Robocorp.WorkItems


*** Tasks ***
Monitor sites
    ${report}=    Create List
    Set Work Item Variable    site_report    ${report}
    ${envs}=    Get Environment Variables
    FOR    ${key}    ${value}    IN ZIP    ${envs.keys()}    ${envs.values()}
        ${MON}=    Split String    ${key}    _    1
        IF    '${MON}[0]'=='MON'    Ping server    ${value}    ${report}
    END
    Save Work Item


*** Keywords ***
Ping server
    [Arguments]    ${url}    ${report}
    ${response}=    GET    ${url}
    Append To List    ${report}    ${url} ${response.status_code}
