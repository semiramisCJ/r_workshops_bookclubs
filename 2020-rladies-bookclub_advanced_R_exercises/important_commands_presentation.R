# To preview changes use the infinite moon reader
xaringan::inf_mr()

# To export slides to pdf and html
install.packages(c("pagedown", "xaringan"))
# make sure you have pagedown >= 0.2 and xaringan >= 0.9; if not, run
# remotes::install_github(c('rstudio/pagedown', 'yihui/xaringan'))

pagedown::chrome_print("~/advanced-R/SemiramisPresentation.Rmd")

# or just pass the HTML output file path to chrome_print()
pagedown::chrome_print("~/advanced-R/SemiramisPresentation.html")
