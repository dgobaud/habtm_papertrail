# config/initializers/paper_trail_extension.rb
ActiveRecord::Base.module_eval do
  class << self
    def inherited_with_paper_trail subclass
      # remember to skip it on SchemaMigration which has its own version method
      skipped_models = ["ActiveRecord::SchemaMigration", "PaperTrail::Version", "ActiveRecord::SessionStore::Session"]
      inherited_without_paper_trail subclass
      unless skipped_models.include?(subclass.to_s)
        subclass.send(:has_paper_trail)
      end
    end
    alias_method_chain :inherited, :paper_trail
  end
end
