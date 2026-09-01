@obtener
Feature: Obtener usuario por ID

  Background:
    * url baseUrl
    * def gen = read('classpath:utils/data-generator.js')
    * def novo = gen.newUsuarioPayload()
    Given path 'usuarios'
    And request novo
    When method post
    Then status 201
    * def userId = response._id

  @positivo
  Scenario: Buscar usuario existente por ID
    Given path 'usuarios', userId
    When method get
    Then status 200
    And match response == read('classpath:schemas/user-detail.schema.json')

  @negativo
  Scenario: Buscar usuario con ID inexistente
    Given path 'usuarios', '000000000000000000000000'
    When method get
    Then status 400 || status 404
