:- dynamic symptom/2, fixture/1, user_confirms/1.
:- consult('kb_rules.pl').
:- consult('kb_solutions.pl').

%% --- Main Predicate ---

/**
 * start_diagnosis/0
 * Initializes the system, prompts for symptoms, and prints the result.
 */
start_diagnosis :-
    retractall(symptom(_, _)),
    retractall(fixture(_)),
    retractall(user_confirms(_)),

    write('--- Welcome to Plum-Bot: Plumbing Diagnosis Expert System ---'), nl,

    % Step 1: Get Initial Symptoms (User Input)
    get_user_input,

    % Step 2: Diagnostic Inference Engine (DIE)
    (   diagnose(Cause)
    ->
        % Step 3: Solution Recommender (SR)
        write_output(Cause)
    ;
        % Step 4: Handle No Diagnosis
        write('---'), nl,
        write('Could not find a specific diagnosis. The problem may be outside'), nl,
        write('the current knowledge base, or more information is needed.'), nl
    ),

    write('--- Diagnosis Complete ---'), nl.

%% --- Input Handling (Simulation) ---

get_user_input :-
    write('What fixture is the problem in? (e.g., sink, toilet, tub): '), read(F), assertz(fixture(F)),
    write('What is the main problem? (e.g., slow_drain, running_water, no_hot_water): '), read(P), assertz(symptom(F, P)),
    % Additional interactive prompts for confirmations
    (   (F = toilet, P = running_water)
    ->  write('Is the toilet handle loose or sticking? (yes/no): '), read(Answer),
        (Answer = yes -> assertz(user_confirms(handle_sticking)) ; true)
    ;   true
    ),
    nl.

%% --- Output Formatting ---

write_output(Cause) :-
    nl, write('---'), nl,
    format('**DIAGNOSIS:** The most probable cause is: **~w**.~n', [Cause]),
    nl,
    write('**RECOMMENDED ACTION PLAN:**'), nl,
    recommend(Cause, Steps),
    Steps = [H|T], % Check if the list is not empty
    list_steps([H|T], 1),
    nl,
    write('---'), nl.

list_steps([], _).
list_steps([Step|Rest], Index) :-
    format('~w. ~w~n', [Index, Step]),
    NewIndex is Index + 1,
    list_steps(Rest, NewIndex).




