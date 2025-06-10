Feature: Get all bookings

  Scenario: Get all bookings
    Given url 'https://restful-booker.herokuapp.com/booking'
    When method get
    Then status 200