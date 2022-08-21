*** Settings ***
Documentation     This is a resource file, that can contain variables and keywords.
...               Keywords defined here can be used where this Keywords.resource in loaded.
Library           SeleniumLibrary


*** Variables ***
${URL}        http://localhost:8080/
${BROWSER}    Firefox
${username}   id:username
${password}   id:password
${firstname}  id:firstname
${lastname}   id:lastname
${phone}      id:phone
${register}   name:phone