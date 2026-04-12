import '../models/snippet.dart';

List<Snippet> getGitSnippets() {
  return [
    Snippet()..snippetId='git_001'..topicId='git'..title='Git Init & First Commit'..description='Initialize a new repo, stage files, and create the first commit.'..code='''# Initialize new repository
git init

# Configure user
git config user.name "Your Name"
git config user.email "you@example.com"

# Stage and commit
git add .
git commit -m "Initial commit"'''..language='bash'..difficulty='very_easy'..section='Introduction to Git'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_002'..topicId='git'..title='Basic Workflow'..description='The daily Git workflow: check status, stage changes, commit, and push.'..code='''# Check status
git status

# Stage specific files
git add file1.txt file2.txt

# Stage all changes
git add -A

# Commit with message
git commit -m "feat: add user authentication"

# Push to remote
git push origin main'''..language='bash'..difficulty='very_easy'..section='Basic Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_003'..topicId='git'..title='Branching Basics'..description='Create, switch, list, and delete branches for parallel development.'..code='''# Create and switch to new branch
git checkout -b feature/login

# Or with newer syntax
git switch -c feature/login

# List branches
git branch        # local
git branch -r     # remote
git branch -a     # all

# Switch branch
git switch main

# Delete branch
git branch -d feature/login        # safe delete
git branch -D feature/login        # force delete
git push origin --delete feature/login  # delete remote'''..language='bash'..difficulty='very_easy'..section='Basic Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_004'..topicId='git'..title='Git Log & History'..description='View commit history with various formatting options.'..code='''# Basic log
git log

# Compact one-line format
git log --oneline

# Graph view
git log --oneline --graph --all

# Show last N commits
git log -5

# Filter by author
git log --author="Alice"

# Filter by date
git log --since="2024-01-01" --until="2024-12-31"

# Search commit messages
git log --grep="fix"

# Show file changes
git log --stat'''..language='bash'..difficulty='very_easy'..section='Basic Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_005'..topicId='git'..title='Git Diff'..description='Compare changes between working directory, staging, and commits.'..code='''# Unstaged changes
git diff

# Staged changes
git diff --staged

# Between branches
git diff main..feature/login

# Between commits
git diff abc123..def456

# Specific file
git diff -- path/to/file.txt

# Summary only
git diff --stat

# Word-level diff
git diff --word-diff'''..language='bash'..difficulty='very_easy'..section='Basic Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_006'..topicId='git'..title='Undoing Changes'..description='Restore files, unstage changes, and undo commits safely.'..code='''# Discard working directory changes
git restore file.txt

# Unstage a file
git restore --staged file.txt

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1

# Create a new commit that undoes a previous one
git revert abc123

# Amend last commit message
git commit --amend -m "new message"

# Amend last commit with more files
git add forgotten_file.txt
git commit --amend --no-edit'''..language='bash'..difficulty='very_easy'..section='Branching'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_007'..topicId='git'..title='Remote Repositories'..description='Add, manage, and sync with remote repositories.'..code='''# Add remote
git remote add origin https://github.com/user/repo.git

# List remotes
git remote -v

# Fetch updates (no merge)
git fetch origin

# Pull (fetch + merge)
git pull origin main

# Push
git push origin main

# Push new branch
git push -u origin feature/login

# Change remote URL
git remote set-url origin https://new-url.git

# Remove remote
git remote remove origin'''..language='bash'..difficulty='very_easy'..section='Branching'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_008'..topicId='git'..title='Git Stash'..description='Temporarily save uncommitted changes to switch contexts.'..code='''# Stash changes
git stash

# Stash with message
git stash push -m "WIP: login feature"

# Include untracked files
git stash -u

# List stashes
git stash list

# Apply latest stash (keep in stash)
git stash apply

# Apply and remove from stash
git stash pop

# Apply specific stash
git stash apply stash@{2}

# Drop a stash
git stash drop stash@{0}

# Clear all stashes
git stash clear'''..language='bash'..difficulty='very_easy'..section='Branching'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_009'..topicId='git'..title='.gitignore Patterns'..description='Configure which files Git should ignore using glob patterns.'..code='''# .gitignore file

# Compiled files
*.class
*.o
*.pyc
__pycache__/

# Dependencies
node_modules/
vendor/
.venv/

# Build output
build/
dist/
*.apk
*.ipa

# IDE files
.idea/
.vscode/
*.swp

# Environment
.env
.env.local

# OS files
.DS_Store
Thumbs.db

# Logs
*.log
logs/'''..language='bash'..difficulty='very_easy'..section='Branching'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_010'..topicId='git'..title='Cloning & Forking'..description='Copy repositories locally with clone. Fork on GitHub for contributing.'..code='''# Clone repository
git clone https://github.com/user/repo.git

# Clone to specific directory
git clone https://github.com/user/repo.git my-project

# Clone specific branch
git clone -b develop https://github.com/user/repo.git

# Shallow clone (last N commits only)
git clone --depth 1 https://github.com/user/repo.git

# After forking on GitHub, add upstream
git remote add upstream https://github.com/original/repo.git
git fetch upstream
git merge upstream/main'''..language='bash'..difficulty='very_easy'..section='Remote Repositories'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_011'..topicId='git'..title='Merge Strategies'..description='Combine branches with merge. Handle fast-forward, no-ff, and squash merges.'..code='''# Fast-forward merge (linear history)
git checkout main
git merge feature/login

# No fast-forward (always create merge commit)
git merge --no-ff feature/login

# Squash merge (combine all commits into one)
git merge --squash feature/login
git commit -m "feat: add login feature"

# Abort a merge in progress
git merge --abort

# Check if branches are merged
git branch --merged
git branch --no-merged'''..language='bash'..difficulty='medium'..section='Remote Repositories'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_012'..topicId='git'..title='Resolving Merge Conflicts'..description='Handle conflicting changes when merging or rebasing branches.'..code='''# When conflict occurs after merge:
# 1. See conflicted files
git status

# 2. Open file - conflict markers look like:
# <<<<<<< HEAD
# your changes
# =======
# their changes
# >>>>>>> feature-branch

# 3. Edit file to resolve, then:
git add resolved_file.txt
git commit -m "fix: resolve merge conflict"

# Use mergetool
git mergetool

# Accept theirs or ours for all conflicts
git checkout --theirs .
git checkout --ours .

# During rebase conflict
git rebase --continue   # after resolving
git rebase --abort       # cancel rebase'''..language='bash'..difficulty='medium'..section='Undoing Changes'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_013'..topicId='git'..title='Git Rebase'..description='Reapply commits on top of another base. Creates linear history.'..code='''# Rebase current branch onto main
git rebase main

# Interactive rebase - edit last N commits
git rebase -i HEAD~3

# In interactive editor:
# pick abc123 First commit
# squash def456 Second commit  (combine with previous)
# reword ghi789 Third commit   (edit message)
# drop jkl012 Bad commit       (remove)

# Rebase onto specific branch
git rebase --onto main feature-base feature-branch

# Pull with rebase instead of merge
git pull --rebase origin main

# Configure default pull to rebase
git config --global pull.rebase true'''..language='bash'..difficulty='medium'..section='Undoing Changes'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_014'..topicId='git'..title='Cherry-Pick'..description='Apply specific commits from one branch to another without merging.'..code='''# Apply a single commit
git cherry-pick abc123

# Apply multiple commits
git cherry-pick abc123 def456 ghi789

# Apply range of commits
git cherry-pick abc123..ghi789

# Cherry-pick without committing
git cherry-pick --no-commit abc123

# Resolve conflicts during cherry-pick
git cherry-pick --continue   # after resolving
git cherry-pick --abort       # cancel

# Cherry-pick from another remote
git fetch upstream
git cherry-pick upstream/main~3'''..language='bash'..difficulty='medium'..section='Undoing Changes'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_015'..topicId='git'..title='Tags'..description='Mark specific commits as releases or milestones with lightweight and annotated tags.'..code='''# Create lightweight tag
git tag v1.0.0

# Create annotated tag (recommended)
git tag -a v1.0.0 -m "Release version 1.0.0"

# Tag a specific commit
git tag -a v0.9.0 abc123 -m "Beta release"

# List tags
git tag
git tag -l "v1.*"

# Show tag details
git show v1.0.0

# Push tags to remote
git push origin v1.0.0
git push origin --tags

# Delete tag
git tag -d v1.0.0
git push origin --delete v1.0.0

# Checkout tag
git checkout v1.0.0'''..language='bash'..difficulty='medium'..section='Stashing'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_016'..topicId='git'..title='Git Blame & Bisect'..description='Find who changed what line and binary search for bugs.'..code='''# Blame - show who changed each line
git blame file.txt
git blame -L 10,20 file.txt   # specific lines
git blame -w file.txt          # ignore whitespace

# Bisect - binary search for bugs
git bisect start
git bisect bad                 # current commit is bad
git bisect good v1.0.0         # known good commit

# Git tests each commit, you mark:
git bisect good    # this commit is OK
git bisect bad     # this commit has the bug

# When found:
git bisect reset   # go back to original HEAD

# Automated bisect with test script
git bisect start HEAD v1.0.0
git bisect run ./test.sh'''..language='bash'..difficulty='medium'..section='Stashing'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_017'..topicId='git'..title='Git Submodules'..description='Include other Git repositories as subdirectories of your project.'..code='''# Add submodule
git submodule add https://github.com/lib/util.git libs/util

# Clone project with submodules
git clone --recurse-submodules https://github.com/user/project.git

# Initialize submodules after clone
git submodule init
git submodule update

# Update all submodules
git submodule update --remote

# Remove submodule
git submodule deinit libs/util
git rm libs/util
rm -rf .git/modules/libs/util

# Status of submodules
git submodule status'''..language='bash'..difficulty='medium'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_018'..topicId='git'..title='Git Aliases'..description='Create shortcuts for frequently used Git commands.'..code='''# Set up aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# Complex aliases
git config --global alias.lg "log --oneline --graph --all --decorate"
git config --global alias.last "log -1 HEAD"
git config --global alias.unstage "restore --staged"
git config --global alias.undo "reset --soft HEAD~1"

# Show diff summary
git config --global alias.changes "diff --stat"

# Usage
git co main
git lg
git st
git undo'''..language='bash'..difficulty='medium'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_019'..topicId='git'..title='Conventional Commits'..description='Standardized commit message format for automated changelogs and semantic versioning.'..code='''# Format: <type>(scope): <description>

# Features
git commit -m "feat(auth): add OAuth2 login support"
git commit -m "feat(api): implement user search endpoint"

# Bug fixes
git commit -m "fix(ui): resolve button overflow on mobile"
git commit -m "fix(db): handle null values in migration"

# Other types
git commit -m "docs: update API documentation"
git commit -m "style: format code with prettier"
git commit -m "refactor(core): extract validation logic"
git commit -m "test: add unit tests for UserService"
git commit -m "chore: update dependencies"
git commit -m "perf(query): optimize database joins"

# Breaking change
git commit -m "feat(api)!: change response format"'''..language='bash'..difficulty='medium'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_020'..topicId='git'..title='Git Clean & Maintenance'..description='Clean untracked files and optimize repository performance.'..code='''# Preview what would be removed
git clean -n

# Remove untracked files
git clean -f

# Remove untracked files and directories
git clean -fd

# Remove ignored files too
git clean -fdx

# Garbage collection
git gc

# Aggressive cleanup
git gc --aggressive --prune=now

# Verify repository integrity
git fsck

# Prune unreachable objects
git prune

# Check repository size
git count-objects -vH'''..language='bash'..difficulty='medium'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_021'..topicId='git'..title='Git Worktrees'..description='Work on multiple branches simultaneously without stashing or switching.'..code='''# Create a worktree for another branch
git worktree add ../project-hotfix hotfix/urgent

# Create worktree with new branch
git worktree add -b feature/new ../project-feature main

# List worktrees
git worktree list

# Remove worktree
git worktree remove ../project-hotfix

# Prune stale worktree info
git worktree prune

# Use case: review PR while working
git worktree add ../review pr-branch
cd ../review
# ... review code ...
cd ../main-project
git worktree remove ../review'''..language='bash'..difficulty='hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_022'..topicId='git'..title='Git Reflog'..description='Recovery tool showing all HEAD movements. Recover deleted branches and lost commits.'..code='''# Show reflog
git reflog

# Show reflog for specific branch
git reflog show feature/login

# Recover deleted branch
git reflog
# Find the commit hash before deletion
git checkout -b feature/login abc123

# Recover after hard reset
git reflog
git reset --hard HEAD@{2}

# Recover lost commits
git reflog
git cherry-pick abc123

# Expire old reflog entries
git reflog expire --expire=90.days.ago --all'''..language='bash'..difficulty='hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_023'..topicId='git'..title='Git Hooks'..description='Automated scripts that run at specific Git events for enforcement and automation.'..code='''#!/bin/bash
# .git/hooks/pre-commit

# Lint check
echo "Running linter..."
npm run lint
if [ \$? -ne 0 ]; then
  echo "Lint failed. Fix errors before committing."
  exit 1
fi

# Prevent committing to main
branch=\$(git rev-parse --abbrev-ref HEAD)
if [ "\$branch" = "main" ]; then
  echo "Direct commits to main not allowed!"
  exit 1
fi

# Check for debug statements
if grep -rn "console.log\\|debugger\\|TODO" --include="*.ts" .; then
  echo "Warning: Debug statements found!"
  exit 1
fi

echo "Pre-commit checks passed!"'''..language='bash'..difficulty='hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_024'..topicId='git'..title='Interactive Staging'..description='Stage specific parts of files (hunks) for precise commits.'..code='''# Interactive staging
git add -p

# Options for each hunk:
# y - stage this hunk
# n - skip this hunk
# s - split into smaller hunks
# e - manually edit the hunk
# q - quit

# Interactive staging with add
git add -i

# Stage specific lines
git add -p file.txt

# Unstage interactively
git reset -p

# Checkout specific parts
git checkout -p

# Stash specific parts
git stash push -p -m "partial stash"'''..language='bash'..difficulty='hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_025'..topicId='git'..title='Git Rebase Interactive'..description='Rewrite commit history: reorder, squash, edit, split, and drop commits.'..code='''# Interactive rebase last 5 commits
git rebase -i HEAD~5

# Commands in editor:
# pick   - keep commit as is
# reword - keep commit, edit message
# edit   - pause to amend commit
# squash - meld into previous commit
# fixup  - like squash but discard message
# drop   - remove commit

# Squash all feature commits into one
git rebase -i main
# Mark all but first as "squash"

# Edit a commit in the middle
git rebase -i HEAD~3
# Mark target commit as "edit"
# Make changes, then:
git add .
git commit --amend
git rebase --continue

# Autosquash fixup commits
git commit --fixup abc123
git rebase -i --autosquash main'''..language='bash'..difficulty='hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_026'..topicId='git'..title='Git Filter-Branch & BFG'..description='Rewrite entire repository history to remove sensitive data or large files.'..code='''# Remove file from all history (modern way)
git filter-repo --path secrets.txt --invert-paths

# BFG Repo-Cleaner (faster alternative)
# Remove large files
bfg --strip-blobs-bigger-than 10M

# Remove passwords from history
bfg --replace-text passwords.txt

# Remove specific file
bfg --delete-files *.mp4

# After cleanup:
git reflog expire --expire=now --all
git gc --prune=now --aggressive

# Force push rewritten history
git push --force --all
git push --force --tags

# Warning: This rewrites ALL commit hashes!'''..language='bash'..difficulty='hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_027'..topicId='git'..title='Git Flow Workflow'..description='Branching model with main, develop, feature, release, and hotfix branches.'..code='''# Initialize git flow
git flow init

# Feature branches
git flow feature start login
# ... work on feature ...
git flow feature finish login

# Release branches
git flow release start 1.0.0
# ... final testing, version bump ...
git flow release finish 1.0.0

# Hotfix branches
git flow hotfix start fix-crash
# ... fix the bug ...
git flow hotfix finish fix-crash

# Manual equivalent:
git checkout -b feature/login develop
# ... work ...
git checkout develop
git merge --no-ff feature/login
git branch -d feature/login'''..language='bash'..difficulty='hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_028'..topicId='git'..title='GitHub Pull Request Flow'..description='Fork-and-PR workflow for open source contributions.'..code='''# 1. Fork on GitHub, then clone your fork
git clone https://github.com/yourusername/project.git
cd project

# 2. Add upstream remote
git remote add upstream https://github.com/original/project.git

# 3. Create feature branch
git checkout -b fix/typo-readme

# 4. Make changes and commit
git add .
git commit -m "fix: correct typo in README"

# 5. Push to your fork
git push origin fix/typo-readme

# 6. Create PR on GitHub

# 7. Keep your fork updated
git fetch upstream
git checkout main
git merge upstream/main
git push origin main

# 8. Update PR branch if needed
git checkout fix/typo-readme
git rebase main
git push --force-with-lease origin fix/typo-readme'''..language='bash'..difficulty='hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_029'..topicId='git'..title='Git Sparse Checkout'..description='Check out only specific directories from a large monorepo.'..code='''# Initialize sparse checkout
git clone --no-checkout https://github.com/big/monorepo.git
cd monorepo
git sparse-checkout init --cone

# Specify directories to include
git sparse-checkout set packages/frontend docs

# Add more directories
git sparse-checkout add packages/shared

# List sparse checkout patterns
git sparse-checkout list

# Disable sparse checkout (get everything)
git sparse-checkout disable

# Combine with shallow clone for speed
git clone --depth 1 --no-checkout https://github.com/big/repo.git
cd repo
git sparse-checkout set src/module-a'''..language='bash'..difficulty='hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_030'..topicId='git'..title='Git Bundle'..description='Package repository for offline transfer when no network access is available.'..code='''# Create a bundle of entire repo
git bundle create repo.bundle --all

# Create bundle of specific range
git bundle create update.bundle main~10..main

# Clone from bundle
git clone repo.bundle my-project

# Fetch from bundle
git fetch update.bundle main:refs/remotes/origin/main

# Verify bundle
git bundle verify repo.bundle

# List references in bundle
git bundle list-heads repo.bundle

# Incremental bundles for updates
git bundle create update-1.bundle --since=2024-01-01
git bundle create update-2.bundle v1.0..v2.0'''..language='bash'..difficulty='hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_031'..topicId='git'..title='Git Patch Workflow'..description='Create and apply patches for sharing changes via email or files.'..code='''# Create patch from last commit
git format-patch -1

# Create patches from branch diff
git format-patch main..feature/login

# Create single combined patch
git diff main..feature > combined.patch

# Apply patch
git apply combined.patch

# Apply format-patch (preserves commits)
git am 0001-feature.patch

# Apply series of patches
git am *.patch

# Check if patch applies cleanly
git apply --check combined.patch

# Apply with 3-way merge
git am -3 0001-feature.patch

# Reverse a patch
git apply -R combined.patch'''..language='bash'..difficulty='very_hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_032'..topicId='git'..title='Git Subtree'..description='Alternative to submodules. Merge external repos into subdirectories while keeping history.'..code='''git subtree add --prefix=libs/util \
  https://github.com/lib/util.git main --squash'''..language='bash'..difficulty='very_hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_033'..topicId='git'..title='Advanced Git Config'..description='Optimize Git with conditional includes, custom merge drivers, and performance settings.'..code='''[includeIf "gitdir:~/work/"]
    path = ~/.gitconfig-work'''..language='bash'..difficulty='very_hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_034'..topicId='git'..title='Git Rerere'..description='Reuse Recorded Resolution. Git remembers how you resolved conflicts and auto-resolves next time.'..code='''git config --global rerere.enabled true'''..language='bash'..difficulty='very_hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_035'..topicId='git'..title='Git Notes'..description='Attach metadata to commits without changing commit hash. For reviews, CI results, etc.'..code='''git notes add -m "Reviewed by Alice"'''..language='bash'..difficulty='very_hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_036'..topicId='git'..title='Git Attributes'..description='Per-path settings for diff, merge, export, and line endings.'..code='''*.txt text eol=lf
*.png binary'''..language='bash'..difficulty='very_hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_037'..topicId='git'..title='Git LFS'..description='Large File Storage tracks binary files outside the main repo for better performance.'..code='''git lfs track "*.psd"'''..language='bash'..difficulty='very_hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_038'..topicId='git'..title='GitHub Actions CI/CD'..description='Automated workflows triggered by Git events for testing, building, and deploying.'..code='''on:
  push:
    branches: [main]'''..language='bash'..difficulty='very_hard'..section='Remote Repositories'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_039'..topicId='git'..title='Git Signing Commits'..description='Cryptographically sign commits with GPG or SSH keys for verification.'..code='''git config --global commit.gpgsign true'''..language='bash'..difficulty='very_hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='git_040'..topicId='git'..title='Advanced Git Debugging'..description='Debug Git issues with trace logging, internal tools, and repository inspection.'..code='''GIT_TRACE=1 git status'''..language='bash'..difficulty='very_hard'..section='Advanced Commands'..isSaved=false..lastViewedAt=null,
  ];
}

