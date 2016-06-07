module RailsDomIdHelper
	def dom_id_for(model)
		# identifies what kind of model we send in
		["#", ActionView::RecordIdentifier.dom_id(model)].join
	end
end