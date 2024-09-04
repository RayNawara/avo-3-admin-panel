class Avo::Resources::Comment < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :idlo
    field :body, as: :text
    field :post_id, as: :number
    field :post, as: :belongs_to
  end
end
