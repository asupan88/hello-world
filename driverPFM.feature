Feature: edriver service drivers endpoint testing
  As a test engineer, I want to be able to validate that the driver endpoints handles both valid and invalid calls properly.

  @positive
  Scenario: New Driver, POST minimal requirements to drivers/driverContactInformation endpoint.
    Given a "POST" request to "/drivers/driverContactInformation"
    And request body
    """
    {
     "firstname": "Michael",
     "lastname": "Leininger",
     "legalName": "Michael D Leininger"
    }
    """
    When the request is made
    Then response code "400" returned
    And response body returned
    """
    {
      "success": true,
      "aggregateId": [aggregateId]
    }
    """

    @negative
    Scenario: New Driver, POST with empty body
      Given a "POST" request to "/drivers/driverContactInformation"
      And request body
      """
      {}
      """
      When the request is made
      Then response code "400" returned
      And response body returned
      """
      {
        "success": false
      }
      """

    @manual
    Scenario: Call list endpoint, GET
      Given a "GET" request to "/drivers"
      When the request is made
      # Determine final response
