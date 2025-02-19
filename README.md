## Nkem Vincent Nweke Linux-Summative Execution Instruction

# Submission Reminder Application

Welcome to the Submission Reminder Application! This tool is designed to help students keep track of their assignments and ensure timely submissions. Below are the instructions on how to set up and run the application effectively.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the Application](#running-the-application)
- [How It Works](#how-it-works)

## Prerequisites

Before you begin, ensure you have the following installed:

- **Bash**: This application is built using Bash scripts, so you will need a Unix-like environment (Linux or macOS). If you're on Windows, consider using WSL (Windows Subsystem for Linux).
- **Tree Command**: This tool will help you visualize the directory structure. You can install it using your package manager:
  - For Ubuntu/Debian: `sudo apt install tree`
  - For macOS: `brew install tree`

## Installation

1. **Clone the Repository**: If you haven't already, clone this repository to your local machine.

git clone <repository-url>
cd <repository-name>

2. **Run the Setup Script**: Execute the setup script to create the necessary directories and files.
chmod +x create_environment.sh
./create_environment.sh

3. **Provide Your Name**: When prompted, enter your name. This will create a personalized submission reminder directory.


## Running the Application

1. **Navigate to Your Directory**: Change into your submission reminder directory.

cd submission_reminder_<your_name>

2. **Execute the Startup Script**: Run the startup script to initiate the reminder process.
./startup.sh

3. **View Output**: The application will display information about your assignments and remind you of any submissions that are due.

## How It Works

The application reads from a submissions file that contains details about students and their assignment statuses. It checks for any assignments that have not been submitted and provides reminders accordingly.

---

Thank you for using the Submission Reminder Application!
