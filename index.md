---
title: "Claim Cost Reserving"
subtitle: "How much money to set aside for insurance claims?"
author: "Kelvin Chan"
date: "October, 2016"
output: ioslides_presentation
css: styles.css
runtime: shiny
---



## Introduction

Adequate reserving for potential claims is a critical function for insurance companies.
In order to determine the reserve or capital requirement for claims, the following key inputs need to be ascertained:

1. The frequency of claims (how often do they occur in a year?)
2. The mean severity of claims (on average if a claim occurs what is the dollar impact?)
3. The variability of claim severity (if a claim occurs, how variable is the claim size?)
4. A capital adequacy level (level of capital needed to withstand X% of scenarios in a year)

## Scenario Simulator

A simplified application has been constructed to allow users to understand the impact of how changing portfolio risk (frequency and severity of claims) affects the capital requirement. The application is located at this [website](https://khychan.shinyapps.io/ReservingApp/). 

In practice, industry data would be used to fit the claim count and claim cost distributions. This application assumes the following:

- A Poisson distribution is used to model claim counts
- A Lognormal distribution is used to model the cost when claims occur

## Frequency of Claims

More frequent claims result in a higher claim count average and variability.

<!--html_preserve--><div class="row">
<div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label class="control-label" for="claims.per.annum">Claims each year:</label>
<input class="js-range-slider" id="claims.per.annum" data-min="500" data-max="2000" data-from="1000" data-step="250" data-grid="true" data-grid-num="6" data-grid-snap="false" data-keyboard="true" data-keyboard-step="16.6666666666667" data-drag-interval="true" data-data-type="number" data-prettify-separator=","/>
</div>
</form>
</div>
<div class="col-sm-8">
<div id="graph1" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
</div>
</div><!--/html_preserve-->

```
## Error in output$graph1 <- renderPlot({: object 'output' not found
```

## Capital Adequacy

Capital needed rises with claim cost and adequacy level.

<!--html_preserve--><div class="row">
<div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label class="control-label" for="claims.per.annum2">Claims each year:</label>
<input class="js-range-slider" id="claims.per.annum2" data-min="500" data-max="2000" data-from="1000" data-step="250" data-grid="true" data-grid-num="6" data-grid-snap="false" data-keyboard="true" data-keyboard-step="16.6666666666667" data-drag-interval="true" data-data-type="number" data-prettify-separator=","/>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="mean.input">Mean ($):</label>
<input class="js-range-slider" id="mean.input" data-min="500" data-max="10000" data-from="5000" data-step="500" data-grid="true" data-grid-num="9.5" data-grid-snap="false" data-keyboard="true" data-keyboard-step="5.26315789473684" data-drag-interval="true" data-data-type="number" data-prettify-separator=","/>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="stdev.input">Standard deviation ($):</label>
<input class="js-range-slider" id="stdev.input" data-min="500" data-max="10000" data-from="5000" data-step="500" data-grid="true" data-grid-num="9.5" data-grid-snap="false" data-keyboard="true" data-keyboard-step="5.26315789473684" data-drag-interval="true" data-data-type="number" data-prettify-separator=","/>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="threshold">Adequacy Level:</label>
<div>
<select id="threshold"><option value="95.0%" selected>95.0%</option>
<option value="99.0%">99.0%</option>
<option value="99.5%">99.5%</option></select>
<script type="application/json" data-for="threshold" data-nonempty="">{}</script>
</div>
</div>
</form>
</div>
<div class="col-sm-8">
<div id="graph2" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
<pre id="capitalRequirement" class="shiny-text-output"></pre>
</div>
</div><!--/html_preserve-->

```
## Error in output$graph2 <- renderPlot({: object 'output' not found
```

```
## Error in output$capitalRequirement <- renderText({: object 'output' not found
```



