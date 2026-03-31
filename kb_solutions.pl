%% --- Solution Knowledge Base ---

/**
 * recommend(Cause, ListOfSteps)
 * Maps a diagnosed Cause to a prioritized action list.
 */

recommend(clogged_p_trap, Steps) :-
    Steps = [
        'Place a bucket under the pipe.',
        'Use channel locks or wrench to remove the slip nuts on the P-trap.',
        'Clear the blockage by hand or with a wire.',
        'Reassemble the trap and test the drain.'
    ].

recommend(faulty_flapper, Steps) :-
    Steps = [
        'Turn off the water supply to the toilet.',
        'Flush the toilet to empty the tank.',
        'Replace the old flapper with a new one.',
        'Turn the water back on and test for running.'
    ].

recommend(flapper_chain_issue, Steps) :-
    Steps = [
        'Remove the tank lid and check the chain length.',
        'Adjust the chain so there is only 1-2 links of slack when the flapper is seated.',
        'Ensure the handle is not catching on the tank wall.',
        'Test the flush multiple times.'
    ].

recommend(bad_pressure_regulator, Steps) :-
    Steps = [
        'Locate the pressure regulator (usually near the main water shutoff).',
        'Use a water pressure gauge to confirm low pressure.',
        'NOTE: This is a complex repair; contact a professional plumber for replacement.'
    ].
