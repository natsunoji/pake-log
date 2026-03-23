ActiveSupport.on_load(:active_storage_blob) do
  # Cloudinary使用時は、Rails側でのバリデーション（加工チェック）をスキップさせる
  ActiveStorage::Transformers::ImageProcessingTransformer.send(:define_method, :validate_transformation) { |*| }
end
