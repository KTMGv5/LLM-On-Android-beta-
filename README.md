Install Ollama in Termux (with Auto-Update Support)

  

This repository provides a script to install the patched Termux version of Ollama, download an efficient model for mobile CPUs, and ensure the script can self-update.


---

Features

Installs Ollama from the official Termux repository

Downloads the Gemma 3:270m model (~292MB)

Starts the Ollama server temporarily during installation

Includes an automatic update checker

Provides clear usage instructions



---

Installation

Download and run the installer script:

curl -fsSL https://raw.githubusercontent.com/KTMGv5/LLM-On-Android-beta-/refs/heads/main/install_ollama.sh -o install_ollama.sh
chmod +x install_ollama.sh
bash install_ollama.sh

Replace USERNAME/REPO with your actual GitHub username and repository.


---

Auto-Update System

The script includes an update check. Each time it runs, it compares its internal version with the GitHub version:

If a new version is found, it automatically downloads the update

Replaces the current file

Restarts itself


To enable this, make sure the script in your repository contains:

UPDATE_URL="https://raw.githubusercontent.com/USERNAME/REPO/main/install_ollama.sh"


---

Usage Instructions

Starting the Ollama Server

Open a Termux session and run:

ollama serve

Keep this session running.

Running a Model

In a second Termux session, run:

ollama run gemma3:270m


---

Support

For help or questions, contact:

atophat on Discord


---

License

This project is licensed under the MIT License.
