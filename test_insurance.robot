*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
UAT-Lab11-001 Request Automobile Insurance Successfully
    [Documentation]    ทดสอบการขอใบเสนอราคาผลิตภัณฑ์สำหรับรถยนต์ได้สำเร็จตาม Test Scenario UAT-Lab11-001[cite: 1, 2]
    Open Browser    http://sampleapp.tricentis.com/    chrome
    Maximize Browser Window
    
    # ขั้นตอนที่ 1 & 2: เลือกเมนู Automobile และกรอกข้อมูลรถยนต์
    Click Link    id=nav_automobile
    Select From List By Value    id=make    BMW
    Input Text    id=engineperformance    110
    Input Text    id=dateofmanufacture    09/09/2020
    Select From List By Value    id=numberofseats    5
    Select From List By Value    id=fuel    Electric Power
    Input Text    id=listprice    30000
    Input Text    id=licenseplatenumber    CKK1234
    Input Text    id=annualmileage    10000
    Click Button    id=nextenterinsurantdata
    
    # ขั้นตอนที่ 3: กรอกข้อมูลผู้เอาประกัน (Insurant Data)
    Input Text    id=firstname    Wichai
    Input Text    id=lastname    Sandee
    Input Text    id=birthdate    01/31/1990
    Click Element    xpath=//label[text()='Male']/span
    Input Text    id=streetaddress    KKU
    Select From List By Value    id=country    Thailand
    Input Text    id=zipcode    40002
    Input Text    id=city    Khon Kaen
    Select From List By Value    id=occupation    Employee
    Click Element    xpath=//input[@id='other']/following-sibling::span
    Click Button    id=nextenterproductdata
    
    # ขั้นตอนที่ 4: กรอกข้อมูลผลิตภัณฑ์ประกัน (Product Data)
    Input Text    id=startdate    12/01/2026
    Select From List By Value    id=insurancesum    7000000
    Select From List By Value    id=meritrating    Bonus 1
    Select From List By Value    id=damageinsurance    No Coverage
    Click Element    xpath=//input[@id='EuroProtection']/following-sibling::span
    Select From List By Value    id=courtesycar    Yes
    Click Button    id=nextselectpriceoption
    
    # ขั้นตอนที่ 5: เลือกราคาประกัน (Select Price Option)
    Wait Until Element Is Visible    xpath=//input[@id='selectsilver']/following-sibling::span    timeout=10s
    Click Element    xpath=//input[@id='selectsilver']/following-sibling::span
    Sleep    1s
    Click Button    id=nextsendquote
    
    # ขั้นตอนที่ 6: กรอกข้อมูลส่งอีเมล (Send Quote)
    Input Text    id=email    wichai.sandee@gmail.com
    Input Text    id=phone    0049201123456
    Input Text    id=username    wichai.sandee
    Input Text    id=password    SecretPassword123!
    Input Text    id=confirmpassword    SecretPassword123!
    Input Text    id=Comments    Please contact via email only
    Click Button    id=sendemail
    
    # ตรวจสอบผลลัพธ์ความสำเร็จ
    Wait Until Page Contains    Sending e-mail success!    timeout=20s
    Close Browser

UAT-Lab11-002 Request Automobile Insurance Unsuccessfully
    [Documentation]    ทดสอบการขอใบเสนอราคาผลิตภัณฑ์สำหรับรถยนต์ไม่สำเร็จเมื่อไม่กรอกข้อมูล UAT-Lab11-002[cite: 1, 2]
    Open Browser    http://sampleapp.tricentis.com/    chrome
    Maximize Browser Window
    
    Click Link    id=nav_automobile
    
    # กดปุ่ม Next โดยเว้นว่างข้อมูลทั้งหมด เพื่อให้ระบบแจ้งเตือนข้อผิดพลาด
    Click Button    id=nextenterinsurantdata
    
    # ตรวจสอบว่าหน้าจอตอบสนองโดยแสดงข้อความเตือนช่องบังคับกรอก
    Page Should Contain Element    xpath=//a[@id='entervehicledata']//span[@class='counter']
    Close Browser