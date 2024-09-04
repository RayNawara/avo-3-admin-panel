class Avo::Resources::Post < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :title, as: :text
    field :body, as: :textarea
  end

  # Refactored grid view (outside def fields)
  self.grid_view = {
    card: -> do
      {
        cover_url:
          if record.image.attached?
            main_app.url_for(record.image)
          end,
        title: record.title,
        body: ActionView::Base.full_sanitizer.sanitize(record.body).truncate(120)
      }
    end
  }
end
