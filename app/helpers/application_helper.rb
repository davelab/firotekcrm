module ApplicationHelper


	def show_non_blank_field(label, value)
		  @content = content_tag(:dt, content_tag(:strong, "#{label}:")) 
		  @content << content_tag(:dd, "#{h value}")
		  @content unless value.blank?
	end

	def link_icon(icon)
		content_tag(:i, nil , class: "icon-#{icon}")
	end

	def date_format_and_ago(date)
		  raw "<a href='javascript:void(0)' rel='tooltip' title='#{l date}'>#{distance_of_time_in_words_to_now date}</a>"
	end

	def regions
			regioni = [ "Abruzzo", "Basilicata", "Calabria", "Campania", "Emilia-Romagna", "Friuli-Venezia Giulia", "Lazio", "Liguria", "Lombardia", "Marche", "Molise", "Piemonte", "Puglia", "Sardegna", "Sicilia", "Toscana", "Trentino-Alto Adige", "Umbria", "Valle d'Aosta", "Veneto"] 
	end
end
