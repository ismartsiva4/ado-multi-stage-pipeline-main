## Workflow
**Developer Laptop:** Windows
**Git should be installed**

**Configure git to use 'main' as default branch name:**
    `git config --global init.defaultBranch main`

**Git global configurations should be added:**
       `git config --global user.name "your name"`
    
    `git config --global user.email youremail@gmail.com`

**Download this website and extract contents:** https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip

**Create a git repository in your laptop:**

    mkdir corp-webapp
    cd corp-webapp
    git init

**Add azure-pipelines.yml file, git add and git commit:**

    notepad azure-pipelines.yml
    git add .
    git commit -m "Pipeline file created in main branch"

**Create dev, qa branches:**

    git branch dev
    git branch qa

**Switch to qa branch and add the code:**
Copy the files we extracted in the earlier step, git add, git commit

    git checkout dev
    copy C:\Users\ragha\Downloads\corp-website\* .
    git add .
    git commit -m "full code committed to dev"

   **Install Azure DevOps extension**

    az extension add --name azure-devops
**Login to Azure**

    az login
**Create Azure DevOps Project**

    az devops project create `
    --name corp-webapp `
    --org https://dev.azure.com/cloudtitans `
    --process basic `
    --source-control git `
    --visibility private
**Set the organization and project as defaults in configuration.**

    az devops configure --defaults organization=https://dev.azure.com/cloudtitans project=corp-webapp
**Bydefault Azure Project creates a repo with the same name**
**Sync Local repo with that**
**Verify if corp-webapp Azure repo exist:**

    az repos list
**Now Sync Local repo with Azure repo**

    git remote add origin https://cloudtitans@dev.azure.com/cloudtitans/corp-webapp/_git/corp-webapp
      
    git push -u origin --all
**Create a Resource group**

    az group create --location northeurope --name webapps-rg
**Create App Service Plans**

  

    az appservice plan create `
    --name plan-dev `
    --resource-group webapps-rg `
    --sku B1 `
    --is-linux
    
    az appservice plan create `
    --name plan-qa `
    --resource-group webapps-rg `
    --sku B1 `
    --is-linux
    
    az appservice plan create `
    --name plan-prod `
    --resource-group webapps-rg `
    --sku S1 `
    --is-linux

**Create App Service Instances**

    az webapp create `
    --name webapp-1-dev `
    --resource-group webapps-rg `
    --plan plan-dev `
    --runtime "PHP|8.1"
    
    az webapp create `
    --name webapp-2-qa `
    --resource-group webapps-rg `
    --plan plan-qa `
    --runtime "PHP|8.1"
    
    az webapp create `
    --name webapp-3-prod `
    --resource-group webapps-rg `
    --plan plan-prod `
    --runtime "PHP|8.1"
**Create a DevOps Pipeline in Portal and just save don't run**
**Create Service connection named "azure-connection"**
**In local git repo make a commit to dev branch and see if the pipeline runs Dev Stage:**

    git checkout dev
    notepad trigger.txt
    git add .
    git commit -m "triggering dev stage"
    git push -u origin --all
    
**Verify if DEV Stage is triggered**
**Assuming DEV is successful, merge DEV Branch code to QA**

    git checkout qa
    git merge dev
    git push -u origin --all

**Verify if QA Stage is triggered**
**Assuming QA is successful, merge DEV Branch code to main**

    git checkout main
    git merge dev
    git push -u origin --all
**Verify if QA Stage is triggered**
Congratulations! All the Stages are successfull.
