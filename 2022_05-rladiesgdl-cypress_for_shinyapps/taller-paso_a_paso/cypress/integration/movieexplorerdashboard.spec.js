/// <reference types="cypress" />
let mode = process.env.MODE

let url = ""
if (mode === "compose") {
  url = "http://movieexplorer:8080/"
} else {
  url = "http://localhost:8080/"
}

describe("some checks to movie-explorer app", () => {
  beforeEach(() => {
    cy.visit(url, { timeout: 30000 })
  })

  it("we can filter by director", () => {
    cy.get("#director").type("Hayao")
    cy.get("#n_movies").should("contain", 4)
    cy.get("#plot1").should("be.visible").and("not.have.class", "animating")
  })

  // Info sobre como checar los sliderInput
  // https://docs.cypress.io/api/commands/trigger#Change-Event




})