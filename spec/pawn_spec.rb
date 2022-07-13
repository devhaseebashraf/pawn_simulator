require 'spec_helper'

describe Pawn do
  let(:grid) { GridTable.new }
  let(:pawn) { Pawn.new(grid) }

  context 'interprets correct command' do
    before do
      pawn.perform("PLACE 0,0,NORTH,WHITE")
      pawn.perform("MOVE")
      pawn.perform("RIGHT")
      pawn.perform("MOVE")
    end

    it 'should be in correct position' do
      expect(pawn.report).to eq("1,1,EAST,WHITE")
    end

    it 'should ignore invalid commands' do
      expect { pawn.perform("PLACE12NORTH") }.to raise_error(ArgumentError)
      expect { pawn.perform("LEFFT") }.to raise_error(ArgumentError)
      expect { pawn.perform("RIGHTT") }.to raise_error(ArgumentError)
    end
  end

  context 'place output and exceptions' do
    it 'returns correct exceptions' do
      expect { pawn.place(nil, nil, :east, :white) }.to raise_error(TypeError)
      expect { pawn.place(1, 'abc', nil, :white) }.to raise_error(TypeError)
      expect { pawn.place(1, 0, :northeast, :white) }.to raise_error(TypeError)
      expect { pawn.place(1, 0, :north, :blue) }.to raise_error(TypeError)
    end

    it 'place with correct params' do
      expect(pawn.place(0, 1, :north, :white)).to eq(true)
      expect(pawn.place(2, 2, :south, :white)).to eq(true)
    end

    it 'not placed because of wrong params' do
      expect(pawn.place(6, 9, :west, :white)).to eq(false)
      expect(pawn.place(-1, 5, :east, :white)).to eq(false)
    end
  end

  context 'move correctly' do
    before do
      pawn.place(0, 0, :north, :white)
    end

    it 'should return true' do
      expect(pawn.move(1)).to eq(true)
    end

    it 'should have correct positions' do
      pawn.move(1)
      expect(pawn.position[:x]).to eq(0)
      expect(pawn.position[:y]).to eq(1)
    end
  end

  context 'rotate correctly' do
    before do
      pawn.place(0, 0, :north, :white)
    end

    it 'should return back to north from left' do
      expect(pawn.rotate_left).to eq(:west)
      expect(pawn.rotate_left).to eq(:south)
      expect(pawn.rotate_left).to eq(:east)
      expect(pawn.rotate_left).to eq(:north)
    end

    it 'should return back to north from right' do
      expect(pawn.rotate_right).to eq(:east)
      expect(pawn.rotate_right).to eq(:south)
      expect(pawn.rotate_right).to eq(:west)
      expect(pawn.rotate_right).to eq(:north)
    end
  end

  context 'Pawn report' do
    before do
      pawn.place(5, 5, :east, :white)
    end

    it 'should report correct position and direction' do
      expect(pawn.report).to eq("5,5,EAST,WHITE")
    end
  end
end
