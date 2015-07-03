# encoding: utf-8
require 'spec_helper'
require 'mailchimp_api_v3'

describe MailchimpAPIV3::List, vcr: { cassette_name: 'mailchimp' } do
  let(:lists) { MailchimpAPIV3.connect.lists }
  let(:list) { lists.first }

  it 'is the expected class' do
    expect(list).to be_a MailchimpAPIV3::List
  end

  it 'has a name' do
    expect(list.name).to eq 'My first list'
  end

  it 'has an id' do
    expect(list.id).to eq 'e73f5910ca'
  end

  it 'has an id + name method' do
    expect(list.id_and_name).to eq 'e73f5910ca___My first list'
  end

  it 'has a members collection' do
    members = list.members
    expect(members).to be_an Array
    expect(members.sample).to be_a MailchimpAPIV3::List::Member
  end

  it 'has a interest_categories collection' do
    interest_categories = list.interest_categories
    expect(interest_categories).to be_an Array
    expect(interest_categories.sample).to be_a MailchimpAPIV3::List::InterestCategory
  end

  context 'get a specific member' do
    let(:email_address) { 'ann@sayers.cc' }
    let(:id) { '140b91c107d2058dee730e75be0b1151' }

    it 'gets a member by id' do
      member = list.members id
      expect(member).to be_a MailchimpAPIV3::List::Member
      expect(member.id).to eq id
      expect(member.email_address).to eq email_address
    end

    it 'gets a member by email address' do
      member = list.members email_address
      expect(member).to be_a MailchimpAPIV3::List::Member
      expect(member.id).to eq id
      expect(member.email_address).to eq email_address
    end
  end
end
