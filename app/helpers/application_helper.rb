module ApplicationHelper
  def masculine?(model)
    t("activerecord.models.#{model.to_s.underscore}.gender") == "m"
  end

  def feminine?(model)
    t("activerecord.models.#{model.to_s.underscore}.gender") == "f"
  end

  def definite_article(model)
    masculine?(model) ? "le" : "la"
  end

  def indefinite_article(model)
    masculine?(model) ? "un" : "une"
  end
end
