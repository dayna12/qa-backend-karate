@crear
Feature: Crear usuario

  Background:
    * url baseUrl
    * def gen = read('classpath:utils/data-generator.js')
    * def payload = gen.newUsuarioPayload()

  @positivo
  Scenario: Crear usuario válido
    Given path 'usuarios'
    And request payload
    When method post
    Then status 201
    And match response == read('classpath:schemas/user-new.schema.json')
    * def newId = response._id
    * print 'Nuevo usuario creado con _id:', newId


  @negativo
  Scenario: No permitir email duplicado
    # 1) Crear Usuario
    * def dup = gen.newUsuarioPayload()
    Given path 'usuarios'
    And request dup
    When method post
    Then status 201

    # 2) Crear otra vez con el MISMO payload
    Given path 'usuarios'
    And request dup
    When method post
    Then status 400
    And match response.message contains 'Este email já está sendo usado'