# -*- encoding : utf-8 -*-
module Concerns
  # The common manifest for containing instances
  # provides both the instance relationships and relevant methods.
  module Manifest
    extend ActiveSupport::Concern

    included do
      include Concerns::IntellectualEntity
      # A work can have many instances
      has_many :instances, :class_name => 'ActiveFedora::Base', :property=>:is_representation_of, :inverse_of => :has_representation
    end

    # @return Whether any instances for the manifest exists.
    def has_ins?
      return instances.any?
    end

    # @return all ordered instances.
    def ordered_instances
      res = []
      instances.each do |ins|
        if ins.kind_of? OrderedInstance
          res << ins
        end
      end

      res
    end

    # @return all single file instances
    def single_file_instances
      res = []
      instances.each do |ins|
        if ins.kind_of? SingleFileInstance
          res << ins
        end
      end

      res
    end

    # @return whether its preservation can be inherited.
    # For the manifests, this is true (since it has the instances).
    def preservation_inheritance?
      return true
    end

    # @return the list of objects, which can inherit the preservation settings (only one level)
    def preservation_inheritable_objects
      instances
    end

    # Retrieves a formatted relation to the people and the instances of the manifest.
    # @return The specific metadata for the manifest.
    def get_specific_metadata_for_preservation
      res = ''
      instances.each do |ins|
        res += '<representation>'
        res += "<name>#{ins.instance_name}</name>"
        res += "<uuid>#{ins.uuid}</uuid>"
        res += '</representation>'
      end
      res
    end

    private
    # adds the manifest as intellectual entity for the instances.
    def add_ie_to_ins
      add_ie_to_ins instances
    end

    # go through the given instance array and add itself as intellectual entity for the given instance for each of them.
    # @param ins_array The array of instances to add the intellectual entity for.
    def add_ie_to_ins(ins_array)
      if ins_array
        ins_array.each do |ins|
          if ins.ie.nil?
            ins.ie = self
            ins.save
          end
        end
      end
    end
  end
end
