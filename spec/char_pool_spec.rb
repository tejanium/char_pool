require 'spec_helper'
require 'pry'

EXPECTATIONS = %w(
  a
  b
  c

  aa
  ab
  ac

  ba
  bb
  bc

  ca
  cb
  cc

  aaa
  aab
  aac

  aba
  abb
  abc

  aca
  acb
  acc

  baa
  bab
  bac

  bba
  bbb
  bbc

  bca
  bcb
  bcc

  caa
  cab
  cac

  cba
  cbb
  cbc

  cca
  ccb
  ccc

  aaaa
)

describe CharPool do
  let(:char_pool) { CharPool.new ['a', 'b', 'c'] }

  it 'has a version number' do
    expect(CharPool::VERSION).not_to be nil
  end

  it 'increment string from simple pool' do
    expect(char_pool.start).to eq('a')
    expect(char_pool.next).to  eq('b')
    expect(char_pool.next).to  eq('c')
  end

  it 'increment string from simple pool with specified start' do
    char_pool.start('b')

    expect(char_pool.next).to eq('c')
  end

  it 'increase the size of the string if current length is exhausted' do
    char_pool.start('c')

    expect(char_pool.next).to eq('aa')
    expect(char_pool.next).to eq('ab')
    expect(char_pool.next).to eq('ac')
  end

  it 'not increase the size of the string if current length and state is not exhausted' do
    char_pool.start('bc')

    expect(char_pool.next).to eq('ca')
    expect(char_pool.next).to eq('cb')
    expect(char_pool.next).to eq('cc')
  end

  it 'increase the size of the string if current length is exhausted' do
    char_pool.start('cc')

    expect(char_pool.next).to eq('aaa')
    expect(char_pool.next).to eq('aab')
    expect(char_pool.next).to eq('aac')
  end

  it 'satisfied all EXPECTATIONS' do
    expect((0..39).map{ |_| char_pool.next }).to eql EXPECTATIONS
  end

  it 'can accept number, encode it' do
    EXPECTATIONS.each_with_index do |expectation, index|
      expect(char_pool.index_at(index)).to eql expectation
    end
  end

  it 'works for decode and encode' do
    (0..100_000).to_a.each do |index|
      expect(char_pool.index(char_pool.index_at(index))).to eql index
    end
  end

  it 'works for big number' do
    char_pool = CharPool.new(('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a)
    index     = 100_000_000_000_000

    expect(char_pool.index(char_pool.index_at(index))).to eql index
  end
end
