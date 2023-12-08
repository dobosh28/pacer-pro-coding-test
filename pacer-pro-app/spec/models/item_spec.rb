require 'rails_helper'

RSpec.describe Item, type: :model do
  # Setup for tests
  let!(:item) { Item.create(name: 'Test Item') }

  describe 'soft_delete' do
    it 'sets deleted_at to current time' do
      item.soft_delete
      expect(item.deleted_at).not_to be_nil
    end
  end

  describe 'restore' do
    it 'sets deleted_at to nil' do
      item.soft_delete
      item.restore
      expect(item.deleted_at).to be_nil
    end
  end

  describe 'default scope' do
    it 'excludes soft deleted items from queries' do
      item.soft_delete
      expect(Item.all).not_to include(item)
    end
  end
end
