module Utils
  class ScreenerScorer
    def initialize(answers)
      @answers = answers
      @question_cache = {}
      @domain_scores = {}
    end

    def score
      domain_scores = {}
      @answers["answers"].each do |answer|
        domain = question_domain(answer["question_id"])
        add_domain_score(domain, answer["value"])
      end

      @domain_scores
    end

    def add_domain_score(domain, score)
      @domain_scores[domain] ||= 0
      @domain_scores[domain] += score
    end

    def question_domain(question_id)
      if @question_cache[question_id].nil?
        @question_cache[question_id] = Models::ScreeningQuestion.first(question_id: question_id).domain
      end

      @question_cache[question_id]
    end
  end

  class L2AssessmentAssigner

    def initialize
      @score_thresholds = {
        "depression": { threshold: 2, assessment: "PHQ-9" },
        "mania": { threshold: 2, assessment: "ASRM" },
        "anxiety": { threshold: 2, assessment: "PHQ-9" },
        "substance_use": { threshold: 1, assessment: "ASSIST" }
      }
    end
  
    def assign_assessments(domain_scores)
      assignments = Set.new
      domain_scores.keys.each do |domain|
        if domain_scores[domain] >= @score_thresholds[domain.to_sym][:threshold]
          assignments.add @score_thresholds[domain.to_sym][:assessment]
        end
      end
  
      assignments.to_a
    end
  end
end