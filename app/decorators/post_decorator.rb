class PostDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  #

  def renderimage
      "https://media.gettyimages.com/vectors/poseidon-cartoon-vector-id502375985?b=1&k=6&m=502375985&s=170x170&h=SpCLIFikWlufkFKWHIt0ql-6LGdci4NbvSNZmj8khr0="
  end

end
