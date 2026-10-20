# SmartSpend AI — Intelligent Expense Tracker & ML Classifier

SmartSpend AI is a full-stack personal finance and expense management web application powered by **Machine Learning (Natural Language Processing)**. It automatically analyzes transaction descriptions and accurately predicts their expense categories in real-time.

---

## 🌟 Key Features

1. **AI Auto-Categorization (NLP Powered)**
   - Automatically predicts the category (Food, Transport, Shopping, Education, Health, Entertainment, Bills, Fitness) as you type.
   - Built on a **TF-IDF (unigram + bigram) Vectorizer** combined with a tuned **Multiclass Logistic Regression Classifier**.
   - Interactive **AI Classifier Lab** playground to test custom phrases and inspect confidence scores.

2. **Smart Monthly Budget Tracking**
   - Set monthly spending targets.
   - Visual progress bar with status triggers:
     - 🟢 **On Track** (< 80% used)
     - 🟡 **Near Limit** (80% - 99% used)
     - 🔴 **Exceeded** (>= 100% used)

3. **Complete Expense Management (CRUD)**
   - Add, edit, and delete transactions with amount, date, category, payment mode, and optional notes.
   - Search across transaction names and notes in real time.
   - Filter by Category and Payment Method (UPI, Cash, Credit Card, Debit Card, Net Banking).
   - Sort by Date, Amount, or Description (ascending / descending).

4. **Visual Analytics & Category Breakdown**
   - High-level metric cards: Total Spend, Transactions Count, Average Transaction, Top Category.
   - Category spending distribution with visual progress bars and percentage share.
   - Payment method breakdown.

5. **One-Click CSV Export**
   - Export all recorded expenses into a clean CSV file for accounting and record keeping.

6. **Persistent SQLite Database**
   - Zero-setup relational database (`data/expenses.db`) with auto-initialization and seed data.

---

## 🏗️ Technology Stack

| Component | Technology |
|---|---|
| **Frontend** | React 19, Vite, CSS3 (Modern Responsive Dark Theme) |
| **Backend API** | Python Flask, RESTful endpoints |
| **Machine Learning** | Scikit-Learn (TF-IDF Vectorizer + Logistic Regression), Joblib |
| **Database** | SQLite3 |
| **Dataset** | CSV-based dataset with 350+ categorized expense records |

---

## 📁 Project Directory Structure

```text
expense tracker/
├── backend/
│   ├── app.py                  # Flask REST API endpoints & CORS handler
│   ├── train_model.py          # ML training, evaluation & model export script
│   └── requirements.txt        # Python backend dependencies
├── data/
│   ├── expenses.csv            # Training dataset with 8 expense categories
│   └── expenses.db             # SQLite database storing expenses & budgets
├── frontend/
│   ├── src/
│   │   ├── App.jsx             # Main React application & dashboard components
│   │   ├── App.css             # Modern component styling & animations
│   │   ├── index.css           # Global theme variables & typography
│   │   └── main.jsx            # React root mount
│   ├── index.html              # HTML entry point
│   ├── vite.config.js          # Vite config with backend proxy setup
│   └── package.json            # Node.js dependencies & scripts
├── model/
│   └── expense_classifier.pkl  # Serialized scikit-learn trained model
├── requirements.txt            # Root python dependencies
├── start.sh                    # Dual-service one-click launch script
└── README.md                   # Project documentation
```

---

## 🚀 Getting Started & Execution Guide

### Prerequisites
- **Python 3.10+** (with virtual environment in `venv/`)
- **Node.js 18+** & **npm**

---

### Method 1: One-Click Startup (Recommended)

From the project root directory, run:
```bash
./start.sh
```
This automatically starts:
- Flask backend on `http://127.0.0.1:5000`
- Vite frontend on `http://localhost:5173`

---

### Method 2: Manual Step-by-Step Startup

#### Step 1: Start the Flask Backend
```bash
# Navigate to the project root
cd "/Users/sankavi/college works/expense tracker"

# Activate the virtual environment
source venv/bin/activate

# Start the Flask API
python backend/app.py
```
> The API will be available at: **`http://127.0.0.1:5000`**

#### Step 2: Start the React Frontend
In a new terminal window:
```bash
# Navigate to the frontend directory
cd "/Users/sankavi/college works/expense tracker/frontend"

# (Optional if not installed) Install dependencies:
# npm install

# Start Vite dev server
npm run dev
```
> Open your browser and visit: **`http://localhost:5173`**

---

## 🧠 Retraining the Machine Learning Model

To retrain the ML model after editing or expanding `data/expenses.csv`:
```bash
cd "/Users/sankavi/college works/expense tracker"
source venv/bin/activate
python backend/train_model.py
```
This will:
1. Load `data/expenses.csv`
2. Perform an 80/20 stratified validation split
3. Print accuracy and detailed classification report
4. Train the final production pipeline on all data
5. Save the updated pipeline to `model/expense_classifier.pkl`

---

## 📡 REST API Reference

| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/` | API status and health check |
| `POST` | `/api/predict` | Predicts category from JSON `{"description": "..."}` |
| `GET` | `/api/categories` | Returns supported categories with icons and colors |
| `GET` | `/api/expenses` | Fetches filtered & sorted list of expenses |
| `POST` | `/api/expenses` | Adds a new expense (auto-categorizes if omitted) |
| `PUT` | `/api/expenses/<id>` | Updates an existing expense |
| `DELETE` | `/api/expenses/<id>` | Deletes an expense |
| `GET` | `/api/summary` | Returns comprehensive spending & budget analytics |
| `GET` | `/api/budget` | Retrieves monthly budget and consumed amount |
| `POST` | `/api/budget` | Updates monthly budget amount |
| `GET` | `/api/export` | Downloads expenses as a CSV file |

---

## 👥 Authors & Academic Context
Developed as a Full-Stack Web Development & Applied Machine Learning college project.
