Feature: Get a Booking By Id

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * configure headers = { Accept: 'application/json' }

  Scenario: Get booking by valid ID successfully
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
    * def createdBookingId = response.bookingid
    * def expectedBooking = response.booking

    # Now get the booking by ID
    Given path 'booking', createdBookingId
    When method GET
    Then status 200
    And match response.firstname == "Test"
    And match response.totalprice == 150
    And match response.additionalneeds != "abc"