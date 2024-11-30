Feature: Get all airlines

  Scenario: Get all airlines
    Given url 'https://api.instantwebtools.net/v1/airlines'
    When method get
    Then status 200

