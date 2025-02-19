#!/usr/bin/env bash

read -p "Enter your name: " myName

dir_name="submission_reminder_$myName"

# Create the directory structure if the do not exist (that is the purpose of the -p flag)
mkdir -p "$dir_name/app"
mkdir -p "$dir_name/modules"
mkdir -p "$dir_name/assets"
mkdir -p "$dir_name/config"

# Use a single script to create directory structure and files
cat <<EOF > "$dir_name/startup.sh"
#!/usr/bin/env bash

# Source environment variables and helper functions
source "./config/config.env"
source "./modules/functions.sh"

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "\$submissions_file"
EOF

cat <<EOF > "$dir_name/app/reminder.sh"
#!/usr/bin/env bash

# Source environment variables and helper functions
source "../config/config.env"
source "../modules/functions.sh"

# Path to the submissions file
submissions_file="../assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "\$submissions_file"
EOF

cat <<EOF > "$dir_name/modules/functions.sh"
#!/usr/bin/env bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file") # Skip the header
}
EOF

cat <<EOF > "$dir_name/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Nkem, Shell init, submitted
Amina, Shell Intro, submitted
Rowan, Shell Control Structures, not submitted
Yusuf, Shell FUnctions, not submitted
Yonas, Shell Variables, submitted
Matthew, Shell Outro, not submitted
EOF

cat <<EOF > "$dir_name/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Make scripts executable *AFTER* the files have been created
chmod u+x "$dir_name/startup.sh"
chmod u+x "$dir_name/app/reminder.sh"
chmod u+x "$dir_name/modules/functions.sh"

# Create the main directory last (but only if it does not exist)
mkdir -p "$dir_name"

# execute the startup script
cd "$dir_name" || exit 1
./startup.sh
