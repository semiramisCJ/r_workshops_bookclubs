/// <reference types="cypress" />
let mode = process.env.MODE

let url = ""
if (mode === "other") {
  url = "http://localhost:8080/"
} else {
  url = "http://movieexplorer:8080/"  
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

  // Info sobre como checar los sliderInput
  // https://docs.cypress.io/api/commands/trigger#Change-Event

  // Opiniones sobre page-objects
  // https://www.cypress.io/blog/2019/01/03/stop-using-page-objects-and-start-using-app-actions/

})