@listar
Feature: Listar usuarios

  Background:
    * url baseUrl

  @smoke
  Scenario: Obtener lista de usuarios y validar contrato y tiempo
    Given path 'usuarios'
    When method get
    Then status 200
    And match response == read('classpath:schemas/user-list.schema.json')
    And assert responseTime < 2000
