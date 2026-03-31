%% --- Rule-Based Knowledge Base ---

% Basic Fixture/System Facts (Factual Knowledge)
system_type(drain, 'P-trap blockage').
system_type(water_supply, 'Pressure regulator').
system_type(toilet, 'Flapper valve').

% --- Core Diagnostic Rules (The Logic) ---

/**
 * diagnose(Cause)
 * The main inference predicate. Succeeds if a Cause can be found that
 * matches the symptoms and is not ruled out by a higher-priority check.
 */
diagnose(clogged_p_trap) :-
    symptom(Fixture, slow_drain),
    Fixture \= toilet, % Exclude toilets for simplicity, toilets block differently
    \+ higher_priority_drain_cause(clogged_p_trap). % NAF used here

diagnose(faulty_flapper) :-
    symptom(toilet, running_water),
    \+ diagnose_flapper_chain_issue. % NAF: Only diagnose flapper if chain isn't the problem

diagnose(flapper_chain_issue) :-
    diagnose_flapper_chain_issue. % Separate rule for specific chain issue

diagnose(bad_pressure_regulator) :-
    symptom(_, no_hot_water),
    symptom(_, low_pressure),
    \+ low_priority_cause(bad_pressure_regulator).

%% --- Helper Rules for NAF ---

/**
 * higher_priority_drain_cause(Cause)
 * Use NAF to ensure we don't jump to 'clogged_p_trap' if a simpler fix exists.
 */
higher_priority_drain_cause(clogged_p_trap) :-
    symptom(Fixture, slow_drain),
    % If the drain only clogs when the faucet is running, it points higher up
    user_confirms(drain_stops_when_faucet_off).

/**
 * diagnose_flapper_chain_issue/0
 * Checks if the chain is the root cause for running toilet.
 */
diagnose_flapper_chain_issue :-
    symptom(toilet, running_water),
    user_confirms(handle_sticking). % User confirmed sticking handle
