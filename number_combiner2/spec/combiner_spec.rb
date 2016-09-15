require 'rspec'
require 'combiner'

describe Combiner do
  def assert_orders(input, expected_order, rev: false)
    output = Combiner.call(input)
    expect(output).to eq expected_order.join

    return unless rev

    output = Combiner.call(input.reverse)
    expect(output).to eq expected_order.join
  end

  describe 'edge cases', :t => true do
    it 'doesn\'t blow up on empty arrays' do
      expect(Combiner.call([])).to eq ""
    end

    it 'doesn\'t blow up when there are not enough numbers to warrant a comparison' do
      expect(Combiner.call([5])).to eq "5"
    end
  end

  xspecify 'higher leading digits come earlier in the combination' do
    100.times do
      input =  [99, 88, 77, 66, 55, 44, 33, 22, 11, 0]
      assert_orders input.shuffle, [99, 88, 77, 66, 55, 44, 33, 22, 11, 0]
    end
  end

  describe 'tie breaking is done by considering the remaining digits' do
    context 'when they both have remaining digits' do
      it 'prefers the one with the larger digit' do
        assert_orders [99, 98], [99, 98], rev: true
      end
      it 'when they are equivalent, break ties on the rest of the digits' do
        assert_orders [998, 999], [999, 998], rev: true
      end
    end
    context 'when neither have remaining digits' do
      xit 'is irrelevant' do
      end
    end
    context 'when only one has remaining digits' do
      it 'prefers the shorter one when the leading digit > the next digit'
      it 'prefers the longer one when the leading digit < the next digit'
    end
  end


  example 'shorter is not always earlier' do
    assert_orders [5, 54], [5, 54]
    assert_orders [5, 56], [56, 5]

    assert_orders [3552, 355], [355, 3552]
    assert_orders [3554, 355], [3554, 355]
  end

  example '[5, 53, ?]' do
    assert_orders [5, 53, 2], [5, 53, 2]
    assert_orders [5, 53, 3], [5, 53, 3]

    assert_orders [5, 53, 4], [5, 53, 4]
    assert_orders [5, 53, 5], [5, 5, 53]
    assert_orders [5, 53, 6], [6, 5, 53]
  end

  example do
    assert_orders [5, 553, 556], [556, 5, 553]
  end

  example 'instructions example 1' do
    assert_orders [50, 2, 1, 9], [9, 50, 2, 1]
  end

  example 'instructions example 2' do
    assert_orders [5, 50, 56],   [56, 5, 50]
  end

  example 'instructions example 3' do
    assert_orders [420, 42, 423], [42, 423, 420]
  end
end
