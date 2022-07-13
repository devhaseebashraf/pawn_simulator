# PAWN Simulator - Test Task

8 * 8 GRID TABLE, PAWN SIMULATOR.

## Description

The application that can read in commands of the following form

    PLACE 2,2,NORTH,WHITE
    MOVE 
    LEFT
    RIGHT
    REPORT

## Example:

a)

	PLACE 2,2,SOUTH,WHITE
    MOVE
    REPORT


	Output: 2,1,SOUTH,BLACK


## Requirements

- Ruby 2.7.1

- Libraries: Bundler, rspec


## Dependencies, Test and Run

- Dependencies: `bundle install`

- Test: `rspec spec/`

- Run: `ruby start.rb`