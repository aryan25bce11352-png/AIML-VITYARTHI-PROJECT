# AIML-VITYARTHI-PROJECT-25-NOV
AIML VITYARTHI PROJECT 25 NOV
 🚽 Plum-Bot: Plumbing Diagnosis Expert System

Plum-Bot is a simple **Prolog-based expert system** designed to diagnose common residential plumbing problems and recommend a step-by-step action plan for fixing them.

The system uses a rule-based inference engine to determine the most probable cause of a plumbing issue based on user-provided symptoms and fixture type.

## 🛠️ System Components

The project consists of three main files:

1.  **`plum_bot.pl`**: The main execution file containing the control flow (`start_diagnosis`), input/output handling, and the solution knowledge base (`recommend/2`).
2.  **`kb_rules.pl`**: (Assumed/Missing) This file contains the diagnostic rules that link symptoms and fixture type to a specific cause (e.g., `diagnose(clogged_p_trap) :- symptom(sink, slow_drain).`).
3.  **`kb_solutions.pl`**: (Assumed/Missing) This file is referenced but its contents appear to be integrated into `plum_bot.pl` via the `recommend/2` predicates. For best practice, it might be used for future expansion of solution details.

## 🚀 How to Run the System

To run Plum-Bot, you need a **Prolog interpreter** such as **SWI-Prolog** installed on your system.

### 1. Prerequisite Setup

Ensure you have created the necessary knowledge base files, even if they are currently empty or just contain the required diagnostic logic.

* **`kb_rules.pl`** (Must exist and contain diagnostic rules for `diagnose/1`)
* **`kb_solutions.pl`** (Must exist, but can be empty if all `recommend/2` rules are in `plum_bot.pl`)

### 2. Loading the Program

Open your Prolog interpreter and use the `consult/1` command to load the main file:

```prolog
?- consult('plum_bot.pl').

?- start_diagnosis.

--- Welcome to Plum-Bot: Plumbing Diagnosis Expert System ---
What fixture is the problem in? (e.g., sink, toilet, tub): sink.
What is the main problem? (e.g., slow_drain, running_water, no_hot_water): slow_drain.

---
**DIAGNOSIS:** The most probable cause is: **clogged_p_trap**.

**RECOMMENDED ACTION PLAN:**
1. Place a bucket under the pipe.
2. Use channel locks or wrench to remove the slip nuts on the P-trap.
3. Clear the blockage by hand or with a wire.
4. Reassemble the trap and test the drain.

--- Diagnosis Complete ---
