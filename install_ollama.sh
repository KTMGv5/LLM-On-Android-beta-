#!/bin/bash

# --- 1. Install Ollama ---
echo "Installing Termux dependencies and the official Ollama package..."
pkg update
pkg install -y curl ollama

if [ $? -ne 0 ]; then
    echo "Ollama package installation failed. Check Termux repositories."
    exit 1
fi

echo "Ollama installed successfully using pkg install."

# --- 2. Start Ollama Server ---
echo "Starting Ollama server in the background for model download..."
ollama serve > /dev/null 2>&1 &
OLLAMA_PID=$!

sleep 5  # allow time for server to start

# --- 3. Install Efficient Model (Gemma 3:270m) ---
SMALL_MODEL="gemma3:270m"

echo "Downloading efficient model for mobile CPU: ${SMALL_MODEL}"
ollama pull "${SMALL_MODEL}"

if [ $? -ne 0 ]; then
    echo "Failed to download model ${SMALL_MODEL}."
    kill $OLLAMA_PID 2>/dev/null
    exit 1
fi

echo "Model ${SMALL_MODEL} downloaded successfully!"

# --- 4. Cleanup ---
kill $OLLAMA_PID 2>/dev/null
echo "Stopped background Ollama service."

echo "**Installation Complete!**"
echo "---"
echo "### How to Use Ollama in Termux:"
echo "1. Start the server:   ollama serve"
echo "2. Run the model:      ollama run ${SMALL_MODEL}"
echo "---"