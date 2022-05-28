// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//


Cypress.Commands.add("verifyOutput", (expected) => {
    cy.get("#n_movies").should("contain", expected)
    cy.get("#plot1").should("be.visible").and("not.have.class", "animating")
})
