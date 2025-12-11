#!/bin/bash
# --- 1. Install Ollama from Termux Repository ---
echo "Installing Termux dependencies and the offi>
pkg update
pkg install -y curl ollama

if [ $? -ne 0 ]; then
    echo "Ollama package installation failed. Che>
    exit 1
fi
echo "Ollama installed successfully using pkg ins>

# --- 2. Start Ollama Server (Temporary Background) >
echo "Starting Ollama server in the background for>

# Run the server in the background
ollama serve & > /dev/null 2>&1
OLLAMA_PID=$!
sleep 5 # Give time for the server to spin up

# --- 3. Install Efficient Model (Gemma 3:270m) ---
SMALL_MODEL="gemma3:270m"
echo "Downloading efficient model for mobile CPU:>

ollama pull ${SMALL_MODEL}

if [ $? -ne 0 ]; then
    echo "Failed to download model ${SMALL_MODEL}>
    kill $OLLAMA_PID 2>/dev/null
    exit 1
fi

echo "Model ${SMALL_MODEL} downloaded successfull>

# --- 4. Cleanup and Next Steps ---
kill $OLLAMA_PID 2>/dev/null
echo "Stopped background Ollama service."

echo "**Installation Complete and Fixed!**"
echo "---"
echo "### How to Use Ollama in Termux:"
echo "1. **Start the Server:** Open a new Termux ses>
echo "   *(Leave this session open!)*"
echo "2. **Run the Model:** Open a second Termux ses>
echo "---"
