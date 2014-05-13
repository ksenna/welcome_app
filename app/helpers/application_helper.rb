module ApplicationHelper

	def full_title(page_title)
		base_title = "User Auth & Email App"
		page_title.empty? ?  base_title : "#{base_title} | #{page_title}"
	end

	def format_date(date)

    if !date.nil?
      date.strftime("%B %d, %Y")
    else
      "No record"
    end
  end
  
end
