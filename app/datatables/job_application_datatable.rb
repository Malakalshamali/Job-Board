class JobApplicationDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  self.nulls_last = true
  # def_delegators :@view, :link_to, :JobApplication_path, :edit_JobApplication_path, :company_path, :can_current_ability
  def_delegators :@view, :link_to

    def initialize(params, opts = {})
      @view = opts[:view_context]
      super
    end

  def view_columns
    hash = {}
    hash[:id] = { source: 'JobApplication.id' }
    hash[:name] = { source: 'JobApplication.name', searchable: true }
    hash[:email] = { source: 'JobApplication.email' }
    hash[:cover_letter] = { source: 'JobApplication.cover_letter', searchable: true }
    hash[:status] = { source: 'JobApplication.status', searchable: true }
    hash[:user_id] = { source: 'User.user_id', searchable: true }
    hash[:resume] = { source: 'JobApplication.resume' }
    @view_columns ||= hash
  end

  def data
    records.map do |record|
      hash = {}
      # hash[:id] = link_to(record.id, JobApplication_path(record.id), class: 'btn btn-info btn-circle')
      hash[:id] = record.id
      hash[:name] = record.name
      hash[:email] = record.email
      hash[:cover_letter] = record.cover_letter
      hash[:status] = record.status
      hash[:email] = record.email
      hash[:user_id] = record.user_id
      hash[:resume] = record.resume

      hash[:actions] = get_actions(record)

      hash.each do |key, value|
        hash.delete(key) unless key.in?(@view_columns.keys)
      end
      hash
    end
  end

  def get_actions(record)
    actions = []
    actions.push(link_to('Seen', root_path_path(record.id), class: 'btn btn-primary mr-2'))
    actions.collect { |action| action }.join('  ').html_safe
  end

  def get_raw_records
    JobApplication.all
  end
end
