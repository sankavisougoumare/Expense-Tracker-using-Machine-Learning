#!/bin/bash
# SmartSpend AI - Dual Launch Script (Backend + Frontend)

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "=========================================================="
echo "   🚀 Starting SmartSpend AI Expense Tracker..."
echo "=========================================================="
echo "Project Directory: $PROJECT_ROOT"

# Check virtual environment
if [ -f "$PROJECT_ROOT/venv/bin/python" ]; then
    PYTHON_CMD="$PROJECT_ROOT/venv/bin/python"
else
    PYTHON_CMD="python3"
fi

# 1. Start Flask Backend in background
echo ""
echo "▶ Starting Backend API (Flask on http://127.0.0.1:5000)..."
cd "$PROJECT_ROOT/backend"
$PYTHON_CMD app.py &
BACKEND_PID=$!
echo "Backend running with PID: $BACKEND_PID"

# Trap SIGINT to kill backend when user presses Ctrl+C
trap "echo ''; echo 'Shutting down services...'; kill $BACKEND_PID 2>/dev/null; exit" SIGINT SIGTERM

# Sleep 1.5 seconds to let backend initialize
sleep 1.5

# 2. Start Frontend Dev Server
echo ""
echo "▶ Starting Frontend (Vite on http://localhost:5173)..."
cd "$PROJECT_ROOT/frontend"
npm run dev

# Cleanup when frontend terminates
kill $BACKEND_PID 2>/dev/null
