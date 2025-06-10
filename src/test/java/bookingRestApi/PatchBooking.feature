Feature: Patch Booking

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * configure headers = { Accept: 'application/json' }

  Scenario: Patch (actualizar parcialmente) una reserva con éxito
    # Crear la reserva
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

    # Obtener el token
    Given path 'auth'
    And request
      """
      {
        "username": "admin",
        "password": "password123"
      }
      """
    When method POST
    Then status 200
    * def tokenAuth = response.token

    # Patch (actualizar solo el nombre y apellido)
    Given path 'booking', createdBookingId
    And header Cookie = 'token=' + tokenAuth
    And header Content-Type = 'application/json'
    And request
      """
      {
        "firstname": "NombrePatch",
        "lastname": "ApellidoPatch"
      }
      """
    When method PATCH
    Then status 200
    And match response.firstname == "NombrePatch"
    And match response.lastname == "ApellidoPatch"

