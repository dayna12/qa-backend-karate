@eliminar
Feature: Eliminar usuario

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
  Scenario: Eliminar usuario existente
    Given path 'usuarios', userId
    When method delete
    Then status 200
    And match response.message contains 'Registro excluído com sucesso'

  @negativo
  Scenario: Eliminar usuario inexistente
    Given path 'usuarios', '000000000000000000000000'
    When method delete
    Then status 200 || status 404
