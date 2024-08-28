# Lab Journal
A [lab journal](https://jochemtolsma.github.io/labjournal/) template for students following the course Social Networks. Naturally this template can also be used for other courses using RStudio and Git. To use this template, follow the steps below.


## Preparation:

1. Make sure R and R-studio are installed;
2. Make sure the `rmarkdown`-package is installed in R-studio (with "install dependencies");  
3. If you do not have a GitHub account, create one;  
4. Make sure [GitHub Desktop](https://desktop.github.com) is installed and connected to your GitHub account.

## Forking the repository:

1. Fork the repository using the fork button in the top right hand corner of Github, to make a personal copy of this lab journal;
2. Under your repository name, navigate to 'Settings'; click on 'Pages' on the sidebar; select the main-branch as your publishing source, and serve from the 'docs'-folder.

You now have a personal copy of this repository on your account, which serves html files (aka Github pages) as a website. Put the link of your lab journal in your own readme file and if you go back to your repository, change the 'About' section and make sure to add the link to your website.  

## Inviting collaborators:
Navigate to 'Settings'; click on 'Collaborators', and invite the lectures of your course (e.g. JochemTolsma). After acceptance, the lecturers have access to you repository and can make contributions. This is not strictly necessary because the lectures can also clone your repository, file issues and make pull requests. But learning how to effectively collaborate via Git is somewhat beyond the scope of this course. 

## Clone the repository:
1. Using GitHub desktop, clone the forked lab journal repository to your local path;
2. Specify that you want to use the forked repository for your own purposes. 

The forked repository at your local path contains all of the files you need. All you need for it to work is (the latest version of) R and R-studio installed.

## Journal your work:
1. Right-click on the repository name and click 'Open in Rstudio'; alternately, you can navigate to the repository at your local path and open the 'labjournal.Rproj' file. This should automatically open R-studio, and your current working environment will be inside this project.
2. Inside R-studio you should see a files tab in the bottom right hand corner; 
3. Customize the 'index.Rmd' as you wish within R-studio, to make it your own;
4. Make sure to install the `remotes` and `klippy` packages. Commands are included in the index.Rmd.
5. Journal your work using .Rmd-files.

You can keep your personal notes and working scripts a separate folder. Make sure to include an underscore in the folder name (e.g., _test). Scripts contained in this folder will not be compiled.

## Hosting on Github:
1. Recompile the lab journal website using the Build function in the top right hand corner (if you do not see this 'Build' tap, you may need to restart RStudio);
2. Commit your changes and push them to GitHub using GitHub Desktop (alternatively, you may use the 'Git' tap in the top right corner, or you the Terminal).
3. Your personal lab journal website will be published at: https://{USERNAME}.github.io/bigssslabjournal/

## Useful resources: 
1. Working with [Git](https://happygitwithr.com/index.html) and [GitHub Desktop](https://docs.github.com/en/desktop)
2. Getting the hang of R Markdown: [The Definitive Guide](https://bookdown.org/yihui/rmarkdown/) and [Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/)
