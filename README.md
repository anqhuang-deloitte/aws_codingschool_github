# About

This is the training repository for the AWS coding school.

# Tasks

You can find the task descriptions below. Feel free to ask me anytime if you have questions. 

### Task 1

We want to clone the repository locally on our machine.

1. Login to your github account.
2. Paste your github account name or github email address into the Zoom chat.
3. You should get an invitation to the repo (via email). Please accept it.
4. Create a personal access token and save this token (e.g. in a .txt file).
5. Open Cloud 9 Lab in Course 116-[PF]-Lab - Create a git repository.
6. Create a folder "github_repos".
7. Clone your repository inside of this new created folder.
8. Fetch the differences.
9. Pull the differences.
10. Enable "View hidden files".
11. Check Repository tab.

### Task 2

Create a new remote branch with the name: ```feature/<my_first_name>-main```  from main branch via Github GUI.

Hint: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-and-deleting-branches-within-your-repository

Replace ```<my_first_name>``` with your first name. For instance: ```feature/anqi-main```

### Task 3

We want to commit & push a new local branch to the remote repository from command line with changes.

1. Go to your Cloud9 Lab.
2. Fetch differences with ```git fetch```. Try to understand the output.
3. Pull the differences with ```git pull```. 
4. Create a local branch with the name ```feature/<my_first_name>-info``` from your local main branch. Use this command: ```git checkout -b feature/<my_first_name>-info``` to create a new local branch and switch to it.
5. Add your personal information "Name, Fun fact about me, spirit animal" in the file ```team.md```
6. Save your changes using CTRL+S.
7. Add the changes to the staging area using ```git add .```
8. Check the staged files in the repository tab of Cloud9.
9. Set your username with ```git config --global user.name "FIRST_NAME LAST_NAME"```
10. Set your email address with ```git config --global user.email "MY_NAME@example.com"```
11. If you are satisfied with your changes, commit them with a short message. Use this command: ```git commit -m "insert your commit message here"```
12. If you are asked for your authentication, enter your **github username** and as **password** enter your saved **personal access token**.
13. Push your local branch to the remote repository with git push.

### Task 4

We want to merge our remote feature branch into the main branch.

1. Go to the remote Github repository.
2. Create a pull request (PR) ```feature/<my_first_name>-info``` into your created remote branch from task 2 ```feature/<my_first_name-main>``` . :warning: **Take care that you don't open a PR with branches of another one. Double check it.** :warning:
3. Check the differences.
4. Merge the Pull Request.
5. Delete the merged branch ```feature/<my_first_name>-info```.

### Task 5

We want to merge our remote branch  ```feature/<my_first_name-main>``` into remote ```main``` branch.

1. Create a pull request ```feature/<my_first_name>-main``` into ```main``` 
2. Resolve the merge conflict. Hint: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/addressing-merge-conflicts/resolving-a-merge-conflict-on-github
3. Merge your pull request.

### Task 6

We want to define a .gitignore file and push the applied changes to the remote branch.

1.Switch to local main branch. 
<details>
  <summary>Show command</summary>

  ```
  git checkout main
  ```

</details>
2. Fetch differences.
<details>
  <summary>Show command</summary>
  
  ```
  git fetch
  ```

</details>
3. Pull differences.
<details>
  <summary>Show command</summary>
  
  ```
  git pull
  ```

</details>
4. Create a local branch with the name ```feature/<my_first_name>-gitignore``` from your local main branch.
<details>
  <summary>Show command</summary>
  
  ```
  git checkout -b feature/<my_first_name>-gitignore
  ```

</details>
5. Create a .gitignore folder. The goal is to hide (1) buildspec.yaml file (2) every python file (3) whole test folder (4) every file starts with "backend" in its name and which are files with format .tvars
6. Find out how to apply .gitignore changes instantly, because we want to commit & push a clean repo where all the files/folders listed in .gitignore are hidden. Hint: https://ralphjsmit.com/apply-gitignore-to-exisiting-repository
<details>
  <summary>Show command</summary>
  
  ```
  git rm -r --cached .
  ```

</details>
7. Save changes.
8. Stage changes.
<details>
  <summary>Show command</summary>
  
  ```
  git checkout -b feature/<my_first_name>-gitignore
  ```

</details>
9.  Commit changes.
<details>
  <summary>Show command</summary>
  
  ```
  git commit -m "my nice informative commit message"
  ```

</details>
10. Push this local branch to the remote repository.
<details>
  <summary>Show command</summary>
  
  ```
  git push
  ```

</details>
11. Start a pull request ```feature/<my_first_name>-gitignore``` into ```main``` . Check the differences.