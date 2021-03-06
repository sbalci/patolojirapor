library(tidyverse)
library(here)
library(shiny)
library(RefManageR)




ui <- fluidPage(
  textInput("PMID", ""),
  tags$br(),
  checkboxInput("checkbox", label = "Pancreas", value = FALSE),
  checkboxInput("checkbox", label = "Ampulla", value = FALSE),
  checkboxInput("checkbox", label = "BileDuct", value = FALSE),
  checkboxInput("checkbox", label = "Gallbladder", value = FALSE),
  checkboxInput("checkbox", label = "Neuroendocrine", value = FALSE),
  checkboxInput("checkbox", label = "Morphology", value = FALSE),
  checkboxInput("checkbox", label = "IHC", value = FALSE),
  checkboxInput("checkbox", label = "Molecular", value = FALSE),
  checkboxInput("checkbox", label = "Cytology", value = FALSE),
  checkboxInput("checkbox", label = "Staging", value = FALSE),
  checkboxInput("checkbox", label = "Preneoplastic", value = FALSE),
  checkboxInput("checkbox", label = "Microenvironment", value = FALSE),
  checkboxInput("checkbox", label = "SPN", value = FALSE),
  checkboxInput("checkbox", label = "AnalogueTumors", value = FALSE),
  checkboxInput("checkbox", label = "Pancreattis", value = FALSE),
  checkboxInput("checkbox", label = "Benign", value = FALSE),
  checkboxInput("checkbox", label = "ExperimentalAnimal", value = FALSE),
  checkboxInput("checkbox", label = "TechniquesMethods", value = FALSE),
  checkboxInput("checkbox", label = "Epidemiology", value = FALSE),
  checkboxInput("checkbox", label = "Screening", value = FALSE),
  checkboxInput("checkbox", label = "RiskFactors", value = FALSE),
  checkboxInput("checkbox", label = "SEER", value = FALSE),
  checkboxInput("checkbox", label = "Oncomine", value = FALSE),
  checkboxInput("checkbox", label = "TCGA", value = FALSE),
  checkboxInput("checkbox", label = "CaseReport", value = FALSE),
  checkboxInput("checkbox", label = "CaseSeries", value = FALSE),
  
  # action to take when submit button is pressed

  # articleProperties <- readRDS("articlePropertiesToCombibe.rds"),
  
  # saveMyData()
  
  
  
  																									
  # textOutput("ArticleCitation"),
  # tags$br(),
  p("---"),
  textOutput("CodeStart"),
  tags$br(),
  textOutput("PubMedSearch"),
  tags$br(),
  textOutput("citation"),
  tags$br(),
  textOutput("PUBMED"),
  tags$br(),
  textOutput("doi"),
  tags$br(),
  textOutput("dimensions"),
  tags$br(),
  textOutput("altmetric"),
  tags$br(),
  textOutput("addthis1"),
  tags$br(),
  p("Sys.sleep(1)"),
  tags$br(),
  p("articles <- articles %>%"),
  p("add_row("),
  textOutput("addrow1"),
  textOutput("addrow2"),
  textOutput("addrow3"),
  textOutput("addrow4"),
  textOutput("addrow5"),
  textOutput("addrow6"),
  textOutput("addrow7"),
  textOutput("addrow8"),
  textOutput("addrow9"),
  textOutput("addrow10"),
  textOutput("addrow11"),
  textOutput("addrow12"),
  textOutput("addrow13"),
  textOutput("addrow14"),
  textOutput("addrow15"),
  textOutput("addrow16"),
  p(") %>%"),
  p("unique()"),
  tags$br(),
  p("Sys.sleep(1)"),
  textOutput("saverds"),
  tags$br(),
  textOutput("CodeEnd"),
  tags$br(),
  ("<details open>"),
  ("<summary>"),
  textOutput("title"),
  ("</summary>"),
  tags$br(),
  tags$br(),
  textOutput("cit"),
  tags$br(),
  textOutput("PubMedLink"),
  tags$br(),
  textOutput("addthis2"),
  tags$br(),
  textOutput("abstract"),
  tags$br(),
  textOutput("doiLink"),
  tags$br(),
  textOutput("dim"),
  tags$br(),
  textOutput("alt"),
  tags$br(),
  p("</details>"),
  p("---")
)

server <-
  function(input, output) {
    
      
      
    # generate code  
      
      
    # output$ArticleCitation <- renderText({
    #   Article <-
    #     RefManageR::ReadPubMed(trimws(input$PMID), database = "PubMed")
    #   paste(Article$title, Article$abstract, sep = "\n")
    # })


    # output$ArticleAbstract <- renderText(
    #     {
    #         Article$abstract
    #     }
    # )
    #

    output$CodeStart <-
      renderText({
        paste0(
          "```{r ",
          trimws(input$PMID),
          ", include=FALSE}"
        )
      })

    output$PubMedSearch <- renderText({
      paste0(
        "PMID_",
        trimws(input$PMID),
        " <- RefManageR::ReadPubMed('",
        trimws(input$PMID),
        "', database = 'PubMed')"
      )
    })

    output$citation <- renderText({
      paste0(
        "citation_",
        trimws(input$PMID),
        " <- paste0(PMID_",
        trimws(input$PMID),
        "$journal,' ', PMID_",
        trimws(input$PMID),
        "$year, ' ', PMID_",
        trimws(input$PMID),
        "$month,';', PMID_",
        trimws(input$PMID),
        "$volume,'(', PMID_",
        trimws(input$PMID),
        "$number,'):', PMID_",
        trimws(input$PMID),
        "$pages)"
      )
    })

    output$PUBMED <- renderText({
      paste0(
        "PubMed_",
        trimws(input$PMID),
        " <- paste0(PubMedString, PMID_",
        trimws(input$PMID),
        "$eprint)"
      )
    })

    output$doi <- renderText({
      paste0(
        "doi_",
        trimws(input$PMID),
        " <- paste0(doiString, PMID_",
        trimws(input$PMID),
        "$doi)"
      )
    })


    output$dimensions <- renderText({
      paste0(
        "dimensionBadge_",
        trimws(input$PMID),
        " <- paste0(dimensionString1, PMID_",
        trimws(input$PMID),
        "$doi,dimensionString2)"
      )
    })


    output$altmetric <- renderText({
      paste0(
        "altmetricBadge_",
        trimws(input$PMID),
        " <- paste0(altmetricString1, PMID_",
        trimws(input$PMID),
        "$doi, altmetricString2 )"
      )
    })


    output$addthis1 <- renderText({
      paste0(
        "addthis_inline_",
        trimws(input$PMID),
        " <- paste0(addthis_String1, PMID_",
        trimws(input$PMID),
        "$title",
        " , \" PMID: ",
        trimws(input$PMID),
        " \" , addthis_String2)"
      )
    })

    output$CodeEnd <- renderText({
      paste0("```")
    })


    output$title <- renderText({
      paste0(
        "- **`r PMID_",
        trimws(input$PMID),
        "$title`**"
      )
    })


    output$cit <- renderText({
      paste0(
        "*`r citation_",
        trimws(input$PMID),
        "`*"
      )
    })

    output$addthis2 <- renderText({
      paste0(
        "`r addthis_inline_",
        trimws(input$PMID),
        "`"
      )
    })

    output$abstract <- renderText({
      paste0(
        "`r PMID_",
        trimws(input$PMID),
        "$abstract`"
      )
    })


    output$PubMedLink <- renderText({
      paste0(
        "`r PubMed_",
        trimws(input$PMID),
        "`"
      )
    })


    output$doiLink <- renderText({
      paste0(
        "<!-- `r doi_",
        trimws(input$PMID),
        "` -->"
      )
    })


    output$dim <- renderText({
      paste0(
        "`r dimensionBadge_",
        trimws(input$PMID),
        "`"
      )
    })


    output$alt <- renderText({
      paste0(
        "`r altmetricBadge_",
        trimws(input$PMID),
        "`"
      )
    })


    output$addrow1 <- renderText({
      paste0("ArticleCitation = PMID_", trimws(input$PMID), ",")
    })

    output$addrow2 <- renderText({
      paste0("PMID = PMID_", trimws(input$PMID), "$eprint,")
    })

    output$addrow3 <- renderText({
      paste0("Title = PMID_", trimws(input$PMID), "$title,")
    })

    output$addrow4 <- renderText({
      paste0("# Author = PMID_", trimws(input$PMID), "$author,")
    })
    output$addrow5 <- renderText({
      paste0("Abstract = PMID_", trimws(input$PMID), "$abstract,")
    })
    output$addrow6 <- renderText({
      paste0("Journal = PMID_", trimws(input$PMID), "$journal,")
    })

    output$addrow7 <- renderText({
      paste0("Year = PMID_", trimws(input$PMID), "$year,")
    })



    output$addrow8 <- renderText({
      paste0("Month = PMID_", trimws(input$PMID), "$month,")
    })


    output$addrow9 <- renderText({
      paste0("Volume = PMID_", trimws(input$PMID), "$volume,")
    })

    output$addrow10 <- renderText({
      paste0("Number = PMID_", trimws(input$PMID), "$number,")
    })


    output$addrow11 <- renderText({
      paste0("Pages = PMID_", trimws(input$PMID), "$pages,")
    })

    output$addrow12 <- renderText({
      paste0(
        "PubMedLink = paste0('https://www.ncbi.nlm.nih.gov/pubmed/?term=', PMID_",
        trimws(input$PMID),
        "$eprint),"
      )
    })

    output$addrow13 <- renderText({
      paste0("DoiNumber = PMID_", trimws(input$PMID), "$doi,")
    })

    output$addrow14 <- renderText({
      paste0(
        "DoiLink = paste0('https://doi.org/', PMID_",
        trimws(input$PMID),
        "$doi),"
      )
    })

    output$addrow15 <- renderText({
      paste0("Language = PMID_", trimws(input$PMID), "$language,")
    })


    output$addrow16 <- renderText({
      paste0("ISSN = PMID_", trimws(input$PMID), "$issn")
    })



    output$saverds <- renderText({
      paste0("saveRDS(articles, 'articles.rds')")
    })
    
    
    
    
    
    # save data to article properties

    saveMyData <- reactive({
      articleProperties <- 
        articleProperties %>%
      add_row(
      PMID = trimws(input$PMID),
      Pancreas = input$Pancreas,
      Ampulla = input$Ampulla,
      BileDuct = input$BileDuct,
      Gallbladder = input$Gallbladder,
      Neuroendocrine = input$Neuroendocrine,
      Morphology = input$Morphology,
      IHC = input$IHC,
      Molecular = input$Molecular,
      Cytology = input$Cytology,
      Staging = input$Staging,
      Preneoplastic = input$Preneoplastic,
      Microenvironment = input$Microenvironment,
      SPN = input$SPN,
      AnalogueTumors = input$AnalogueTumors,
      Pancreattis = input$Pancreattis,
      Benign = input$Benign,
      ExperimentalAnimal = input$ExperimentalAnimal,
      TechniquesMethods = input$TechniquesMethods,
      Epidemiology = input$Epidemiology,
      Screening = input$Screening,
      RiskFactors = input$RiskFactors,
      SEER = input$SEER,
      Oncomine = input$Oncomine,
      TCGA = input$TCGA,
      CaseReport = input$CaseReport,
      CaseSeries = input$CaseSeries
      
      )
      
      
      
      
    })
    
    
    
    # 
    # })
        
        
        
    # saveRDS(
    #     reactive(
    #     articleProperties), 
    #     here::here("articlePropertiesToCombibe.rds")
    # )

    # articleProperties <-  readxl::read_xlsx("articleProperties.xlsx")
    
    # saveRDS(articleProperties, "articlePropertiesToCombibe.rds")
    
  }

shinyApp(ui = ui, server = server)