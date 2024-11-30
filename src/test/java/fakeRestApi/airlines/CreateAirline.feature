Feature: Create an airline

  Scenario: Create an airline with valid data
    Given url 'https://api.instantwebtools.net/v1/airlines'
    And request {"_id":"252d3bca-d9bb-476c-9a97-562d685e235c","name":"Sri Lankan Airways","country":"Sri Lanka","logo":"https:\/\/upload.wikimedia.org\/wikipedia\/en\/thumb\/9\/9b\/Qatar_Airways_Logo.svg\/sri_lanka.png","slogan":"From Sri Lanka","head_quaters":"Katunayake, Sri Lanka","website":"www.srilankaaairways.com","established":"1990"}
    When method post
    Then status 200
