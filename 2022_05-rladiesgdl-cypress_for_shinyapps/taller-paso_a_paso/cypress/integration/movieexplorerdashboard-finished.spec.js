/// <reference types="cypress" />
let mode = process.env.MODE

let url = ""
if (mode === "compose") {
  url = "http://movieexplorer:8080/"
} else {
  url = "http://localhost:8080/"
}

describe("Tests para la app movie-explorer", () => {
  beforeEach(() => {
    cy.visit(url, { timeout: 30000 })
  })

  it("Podemos filtrar por quien dirigio la pelicula", () => {
    cy.get("#director").type("Hayao")
    cy.get("#n_movies").should("contain", 4)
    cy.get("#plot1").should("be.visible").and("not.have.class", "animating")
  })

  it("Verificar que la etiqueta del selector sea correcta", () => {
    cy.get("[for=director]").contains("Director name contains (e.g., Miyazaki)")
  })

  it("Funciona el filtro de genero", () => {
    // Nota: Recordemos que usamos promesas! Si queremos "guardar"
    // valores, usamos then
    cy.get("#genre-selectized")
      .type("{backspace}Animation{enter}")

    // Para reutilizar codigo, podemos usar comandos a la medida
    cy.verifyOutput(143)
  })
  // Info sobre como checar los sliderInput
  // https://docs.cypress.io/api/commands/trigger#Change-Event

  // Opiniones sobre page-objects
  // https://www.cypress.io/blog/2019/01/03/stop-using-page-objects-and-start-using-app-actions/

})