Feature: Get an airline

  Background:
    * url 'https://api.instantwebtools.net/v1'

  Scenario: Get an airline by id
    Given path 'airlines', "73dd5420-3bf9-48f3-a0b6-17cf7aa61b19"
    When method get
    Then status 200
    And match response._id == "73dd5420-3bf9-48f3-a0b6-17cf7aa61b19"
    And match response.name == "American Airlines"
    And match response.established != "1950"
