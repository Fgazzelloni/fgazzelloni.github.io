sitemap <- file.path("_site", "sitemap.xml")

if (file.exists(sitemap)) {
  lines <- readLines(sitemap, warn = FALSE)
  lines <- gsub("/index[.]html</loc>", "/</loc>", lines)
  writeLines(lines, sitemap, useBytes = TRUE)
}

homepage <- file.path("_site", "index.html")

if (file.exists(homepage)) {
  lines <- readLines(homepage, warn = FALSE)

  if (!any(grepl("class=\"pagination\"", lines, fixed = TRUE))) {
    lines <- lines[!grepl("pagination: { item:", lines, fixed = TRUE)]
    writeLines(lines, homepage, useBytes = TRUE)
  }
}
