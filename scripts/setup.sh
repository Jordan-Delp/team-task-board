#!/bin/bash

# =============================================================
# setup.sh — Team Task Board Project Setup Script
#
# PURPOSE: Automate initial project environment setup.
# USAGE:   chmod +x scripts/setup.sh && ./scripts/setup.sh
# =============================================================

# ----- CONFIGURATION -----------------------------------------
PROJECT_NAME="Team Task Board"  
REQUIRED_DIRS=("src" "tests" "docs" "scripts")

# ----- HELPER FUNCTIONS --------------------------------------

print_header() {
    echo "============================================"
    echo "  $1"
    echo "============================================"
}

print_success() {
    echo "  ✅  $1"
}

print_warning() {
    echo "  ⚠️   $1"
}

print_error() {
    echo "  ❌  $1"
}

# ----- MAIN SCRIPT -------------------------------------------

print_header "Welcome to $PROJECT_NAME"
echo ""

echo "Setup started at: $(date)"
echo ""

# --- Step 1: Check required directories ----------------------
print_header "Step 1: Checking project directories"

for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        print_success "$dir directory exists."
    else
        mkdir "$dir"
        print_warning "$dir directory was missing and has been created."
    fi
done

echo ""

# --- Step 2: Verify Git is initialized -----------------------
print_header "Step 2: Checking Git repository"

if [ -d ".git" ]; then
    print_success "Git repository found"
else
    git init
    print_warning "Git repository initialized."
fi

echo ""

# --- Step 3: Show current Git status -------------------------
print_header "Step 3: Git status"

git status

echo ""

# --- Step 4: Summary -----------------------------------------
print_header "Setup Complete!"
echo ""
echo "  Project  : $PROJECT_NAME"

echo "  Location : $(pwd)"
echo ""
echo "  Next steps:"
echo "    1. Fill in README.md with your project details"
echo "    2. Complete docs/sprint-backlog.md with your user stories"
echo "    3. Complete docs/definition-of-done.md with your team's criteria"
echo "    4. Make your first commit: git add . && git commit -m 'chore: initial setup'"
echo ""
