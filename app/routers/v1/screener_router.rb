require "date"
require_relative "../../utils/screener"

module Routers
  module V1
    module ScreenerRouter
      def self.registered(app)
        app.post "/v1/screener/score" do
          responses = JSON.parse(request.body.read)

          # Should do some validation that the request is in the correct format

          screener = Utils::ScreenerScorer.new(responses)
          assigner = Utils::L2AssessmentAssigner.new

          domain_scores = screener.score
          assessments = assigner.assign_assessments(domain_scores)

          json({ results: assessments })
        end
      end
    end
  end
end
