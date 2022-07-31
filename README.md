# About

This is the training repository for the AWS coding school.

# Tasks

You can find the task descriptions below. Feel free to ask me anytime if you have questions. 

### Task 1

We want to clone the repository locally on our machine.

1. Login to your github account.
2. Paste your github account name or github email address into the Zoom chat.
3. You should get an invitation to the repo (via email). Please accept it.
4. Create a personal access token and save this token.
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
2. Fetch differences. Try to understand the output.
3. Pull the differences.
4. Create a local branch with the name ```feature/<my_first_name>-info``` from your local main branch.
5. Switch to this new created local branch.
6. Add your personal information "Name, Fun fact about me, spirit animal" in the file ```team.md```
7. Save your changes.
8. Add the changes to the staging area.
9. Commit your changes with a short message.
10. Push your local branch to the remote repository.

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
3. Request anqhuang-deloitte as a reviewer.
4. Paste your pull request link into the Zoom chat.

### Task 6

We want to define a .gitignore file and push the applied changes to the remote branch.

1. Switch to main branch
2. Fetch differences.
3. Pull differences.
4. Create a local branch with the name ```feature/<my_first_name>-gitignore``` from your local main branch.
5. Switch to this new created local branch.
6. Create a .gitignore folder. The goal is to hide (1) buildspec.yaml file (2) every python file (3) whole test folder (4) every file starts with "backend" in its name and which are files with format .tvars (5) every outputs.tf file in terraform folder 
7. Find out how to apply .gitignore changes instantly, because we want to commit & push a clean repo where all the files/folders listed in .gitignore are hidden.
8. Save changes.
9. Stage changes.
10. Commit changes.
11. Push this local branch to the remote repository.
12. Start a pull request ```feature/<my_first_name>-gitignore``` into ```main``` . Check the differences.