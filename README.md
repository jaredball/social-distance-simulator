# Social Distance Simulator

This ASP code simulates a social distancing scenario in a grid, ensuring individuals move while maintaining a specified minimum distance. The program generates paths for individuals while respecting social distancing rules and grid constraints.

## Usage

1. Run the ASP solver with the one of the input files (See the next section for help).
2. Ensure the grid dimensions, starting positions, and social distance parameters are set correctly.
3. The solver will compute the valid paths while ensuring that all paths maintain the required social distance.

## Instance Files

The `instances` directory includes several example files:

- `ex01.lp`
- `ex02.lp`
- `ex03.lp`
- `ex04.lp`

These files contain different grid configurations and people coordinates that I used for testing throughout the creation process. Feel free to use them or even create your own!

To run the simulation with a specific instance file, simply replace the commented line on line 1 of the `socialDistance.lp` file.

## Implementation Details

- **Movement:** Defines movement rules for individuals to travel north, east, or west within the grid.
- **Path Connectivity:** Ensures all paths are connected, starting from the specified position and ending at the last row.
- **Safe Distance:** Applies the Pythagorean theorem to maintain the required minimum distance between individuals on all paths.
- **Outgoing/Incoming Path Constraints:** Prevents paths from doubling back and ensures each cell adheres to valid outgoing and incoming path rules.
- **Grid Boundaries:** Ensures no paths are created outside the grid or in the last row.

## Quick Tip

You can use clingo online for a nice quick demo of the code.
**Go Here:** https://potassco.org/clingo/run/
