# This installs (if required) and loads the mandatory libaries for this demo

# Required CRAN packages

package.list <- c("RCurl", "plyr", "RCurl", "scales")

for (i in 1:length(package.list)) {
  pkg <- package.list[i]
  if(!IsInstalled(pkg)) {  
    install.packages(pkg)
  }
  require(pkg, character.only = TRUE)
}



rm(i)
rm(package.list)
rm(pkg)