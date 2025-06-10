Feature: Create Booking

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * configure headers = { Accept: 'application/json' }

  Scenario: Create booking successfully
    # First create a booking to ensure we have a valid ID
    Given path 'booking'
    And request
      """
      {
        "firstname": "Test",
        "lastname": "User",
        "totalprice": 150,
        "depositpaid": true,
        "bookingdates": {
          "checkin": "2025-06-01",
          "checkout": "2025-06-10"
        },
        "additionalneeds": "Breakfast"
      }
      """
    When method POST
    Then status 200