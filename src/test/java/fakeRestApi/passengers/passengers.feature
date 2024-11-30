Feature: Passenger API

  Background:
    * url 'https://api.instantwebtools.net/v1'

  Scenario: Get all passengers
    Given path 'passenger'
    And param page = 0
    And param size = 10
    When method get
    Then status 200
    And match response != null
    And assert responseTime < 900


  Scenario: Get a passenger by id
    Given path 'passenger', "667ab7617ad8fb2f294343a7"
    When method get
    Then status 200


  Scenario: Create a passenger with valid data
    * def passenger =
      """
      {
        "name": "John Doe",
        "trips": 250,
        "airline": "66038402-402d-4a3f-baef-7cb5f53697a8"
      }
      """

    Given path 'passenger'
    And request passenger
    When method post
    Then status 200

    * def id = response._id
    * print 'created id is: ', id

  Scenario: Update a passenger name
    * def name =
      """
      {
        "name": "Peter Parker"
      }
      """

    Given path 'passenger', id
    And request name
    When method patch
    Then status 200
    And match response.name == 'Peter Parker'

