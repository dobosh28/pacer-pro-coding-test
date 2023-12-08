class Item < ApplicationRecord
    # Validations
    validates :name, presence: true
  
    # Marks the item as deleted by setting the deleted_at timestamp
    def soft_delete
      update(deleted_at: Time.current)
    end
  
    # Restores the item by setting the deleted_at to nil
    def restore
      update(deleted_at: nil)
    end
end
  