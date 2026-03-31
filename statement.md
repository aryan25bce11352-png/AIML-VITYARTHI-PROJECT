# 🔧 Plum-Bot: Prolog Plumbing Diagnosis Expert System

This is a comprehensive overview of the Plum-Bot Expert System, an application designed in Prolog to diagnose common household plumbing issues based on user-provided symptoms and guide them through a prioritized action plan.

## 1. System Structure and Execution Flow

The system uses dynamic facts and rule-based inference, orchestrated by the main predicate `start_diagnosis/0`.

| Section | Role in System | Key Predicate | Source File |
| :--- | :--- | :--- | :--- |
| **Control** | Initializes, manages input/output flow. | `start_diagnosis/0` | Main File |
| **Input** | Gathers symptoms and user confirmations. | `get_user_input/0` | Main File |
| **Inference (DIE)** | Determines the probable cause using logic. | `diagnose/1` | `kb_rules.pl` |
| **Solutions (SR)** | Maps cause to a step-by-step resolution plan. | `recommend/2` | `kb_solutions.pl` |

---

## 2. Dynamic Facts (User Input)

User input is asserted dynamically into the knowledge base to be used by the diagnostic rules.

* `fixture(F)`: The location of the problem (e.g., `sink`, `toilet`).
* `symptom(F, P)`: The observed problem (e.g., `slow_drain`, `running_water`).
* `user_confirms(C)`: Conditional confirmations (e.g., `handle_sticking`).

---

## 3. Diagnostic Rules and Prioritization (`kb_rules.pl`)

The system uses **Negation as Failure (NAF)** (`\+`) to prioritize diagnoses, recommending the simpler or more localized fix before suggesting complex or system-wide repairs.

### A. Toilet Diagnosis Priority

Toilet running-water issues are strictly prioritized:

1.  **`flapper_chain_issue` (Higher Priority):** Diagnosed if `symptom(toilet, running_water)` AND `user_confirms(handle_sticking)` is true.
2.  **`faulty_flapper` (Lower Priority):** Diagnosed only if `symptom(toilet, running_water)` is true AND the `flapper_chain_issue` fails (NAF).

### B. Drain Diagnosis Priority

Drain clogs are prioritized based on location:

* **`clogged_p_trap` (Local Fix):** Diagnosed for a `slow_drain` (excluding toilets) only if the `higher_priority_drain_cause` is ruled out.
* **`higher_priority_drain_cause` (Main Line):** Triggers failure of `clogged_p_trap` if the user confirms the drain slows only when water is actively running, suggesting a deeper main line blockage.

---

## 4. Solution Action Plans (`kb_solutions.pl`)

Each diagnosed cause is linked to a practical, prioritized list of steps to resolve the issue.

| Diagnosis | Action Plan Focus | Complexity Note |
| :--- | :--- | :--- |
| `clogged_p_trap` | Manual removal and cleaning of the pipe. | DIY |
| `faulty_flapper` | Replacement of the flapper mechanism. | DIY |
| `flapper_chain_issue` | Adjustment of chain slack. | Easy DIY |
| `bad_pressure_regulator` | Confirmation and contact with a professional. | Requires Professional Help |