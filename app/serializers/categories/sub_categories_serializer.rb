class Categories::SubCategoriesSerializer < ActiveModel::Serializer
  attributes :id, :name, :category_id
end
