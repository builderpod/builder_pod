#!/usr/bin/env ruby
require File.expand_path('../config/boot',  __FILE__)
require File.expand_path('../config/environment',  __FILE__)
require 'nokogiri'
require 'csv'
require 'json'
def format(hash)
  output = Hash.new
  hash.each do |key, value|
    output[key] = value
  end
  output
end
# @tasks = Task.all
# @tasks.each do |task|
#   task.emc_category_oid = task.emc_category_oid.abs
#   # puts task.name
#   task.save
# end
# CSV.read('category_task.csv').each { |row|
#   unless @t[0].nil? || @t[1].nil? then
#     @child = Category.find_by(oid: @t[1].to_i)
#     oid = @t[0].gsub("﻿","").to_i
#     @category = Category.find_by(oid: oid)
#     @child.update(parent: @category)
#     @child.save!
#   end
# }

# @cats = Dir.glob('../../websites/homeadvisor/category*.html')

# @cats = @cats + @tasks
# @cats.each do |file|
#   doc = File.open(file) { |f| Nokogiri::HTML(f) }
#   arr = file.split('/')[-1].split('.')
#   oid = arr[-2].to_i.abs
#   puts oid
#   if doc.css('title').inner_text.include?('|')
#     arr = doc.css('title').inner_text.split('|').each {|cat| arr << cat.strip! }
#     category_name = arr.join(' | ')
#   else
#     category_name = doc.css('title').inner_text.strip!
#   end


  
#   @category = Category.find_by(oid: oid).update(name: category_name)
#   puts category_name
#   category = Category.find_by(oid: oid).first_or_create.update(oid: oid, name: category_name)
#   doc.css('div.chtd > a').each {|sub_category|
#     unless sub_category['onmouseover'].nil?
#       cat_name = sub_category.inner_text
#       puts cat_name
#       str = sub_category['onmouseover'].split('_')
#       @category = Category.find_by(oid: str[1]).update(name: category_name)
#       # @child = Category.find_by(oid: str[2])
#       # @child.update(parent: @category, name: cat_name)
#     end
#   }
# end

# Dir.glob('../websites/homeadvisor/task*.html').each do |file|
#   arr = file.split('/')[-1].split('.')
#   oid = arr[-2].to_i.abs
#   puts oid
#   category = Category.find_by(oid: oid)
#   doc = File.open(file) { |f| Nokogiri::HTML(f) }
#   unless doc.at_css('script#jsonModel').nil?
#     json_string = doc.at_css('script#jsonModel').inner_text
#     task_string = JSON.parse(json_string, symbolize_names: true)
#     question_sets = format(task_string.select{|k,v| k =~ /^__cache.*interview.*/})
#     task = format(task_string.select{|k,v| k =~ /^__cache.*r_version.*/})
#     task.each { |t|
#       @t = t[1]
#       puts @t[:taskOid]
#       @task = TaskProfile.where(oid: @t[:taskOid]).first_or_create
#       @category = Category.find_by(oid: @t[:emcCategoryOid].abs)
#       @set_id = @t[:primaryQuestionSetId]
#       @task.update(oid: @t[:taskOid], name: @t[:taskName], description: @t[:taskDescription],
#                    xm_descriptor: @t[:xmTaskDescriptor], matchable: @t[:matchable],
#                    profileable: @t[:profileable], es_score: @t[:esScore],
#                    default_cost_guide_id: @t[:defaultCostGuideTaskId], keywords: @t[:taskKeywords],
#                    text_messaging_name: @t[:textMessagingName], rollover_long_desc: @t[:rolloverLongDesc],
#                    rollover_short_desc: @t[:rolloverShortDesc], sector_id: @t[:sectorId],
#                    meta_description: @t[:metaDescription], html_title: @t[:htmlTitle],
#                    content_description: @t[:contentDescription], pwc_id: @t[:pwcId],
#                    accept_goal: @t[:acceptGoal], multi_zip: @t[:multiZip],
#                    pre_match_type_id: @t[:preMatchTypeId], bridge_oid: @t[:bridgeTaskOid],
#                    bridge_text: @t[:bridgeTaskText], bridge_link_text: @t[:bridgeTaskLinkText],
#                    bridge_link_id: @t[:bridgeTaskLinkId], bridge_active: @t[:bridgeTaskActive],
#                    xm_name: @t[:xmName], redirect_to_oid: @t[:redirectToTaskOid],
#                    sp_display_name: @t[:spDisplayName], xm_header_descriptor: @t[:xmHeaderDescriptor],
#                    url_name: @t[:urlName], consideration_id: @t[:taskConsiderationId],
#                    search_keywords: @t[:searchKeywords], emc_category_oid: @t[:emcCategoryOid].abs,
#                    primary_question_set_id: @t[:primaryQuestionSetId], location_specific: @t[:locationSpecific],
#                    commercial: @t[:commercial], view_first_parent_task: @t[:viewFirstParentTask], category_id: @category.id)
#     }
#     question_sets.each { |qs|
#       question_set = qs[1]
#       @question_set = QuestionSet.where(set_id: @set_id).first_or_create
#       @question_set.update(task_oid: question_set[:taskOID], original_task_oid: question_set[:originalTaskOID],
#                            set_id: @set_id, interview_type: question_set[:interviewType])
#       @task.update(question_set_id: @question_set.id)
#       question_set[:questions].each { |question|
#         @question = Question.where(question_id: question[:questionID]).first_or_create
#         @question.update(question_id: question[:questionID], question_display_text: question[:questionDisplayText],
#                          display_to_sp: question[:displayToSP], question_display_sequence: question[:questionDisplaySequence],
#                          page_number: question[:pageNumber], question_text: question[:questionText], short_question_text: question[:shortQuestionText],
#                          parent_question_id: question[:parentQuestionID], parent_answer_id: question[:parentAnswerID],
#                          parent_question_text: question[:parentQuestionText], required: question[:required],
#                          glossary_term: question[:glossaryTerm], default_answer: question[:defaultAnswer],
#                          active: question[:active], attribute_match: question[:attributeMatch], question_set_id: @question_set.id)
#         question[:answers].each { |answer|
#           @answer = Answer.where(aid: answer[:answerID]).first_or_create
#           @answer.update(aid: answer[:answerID], answer_display_sequence: answer[:answerDisplaySequence],
#                          answer_text: answer[:answerText], answer_display_text: answer[:answerDisplayText],
#                          active:  answer[:active], default_answer:  answer[:defaultAnswer],
#                          presentation_type: answer[:presentationType], child_questions: answer[:childQuestions],
#                          question_id: @question.id)
#         }
#       }
#     }
#   end
# end
# CSV.read('categories.csv', headers:true).each { |row|
#   @parent_category = Category.where(oid: @t['category']).first_or_create
#   @parent_category.name = @t['category_name']
#   @parent_category.oid = @t['category']
#   @parent_category.save!
#   @child_category = Category.where(oid: @t['task']).first_or_create
#   @child_category.name = @t['task_name']
#   @child_category.oid = @t['task']
#   @child_category.parent = @parent_category
#   @child_category.save!
# }

CSV.read('contractors_t.csv').each { |row|
  @contractor = Contractor.where(haid: row[1]).first_or_create
  @contractor.update(haid: row[1], name: row[2], website: row[3], description: row[4], rating: row[5], review_count: row[6], telephone: row[7], street_address: row[8], locality: row[9], region: row[10], postal_code: row[11], user_id: row[12], longitude: row[13], latitude: row[14])
}


CSV.read('contractor_services.csv').each { |row|
  contractor = Contractor.find_by(haid: row[0].to_i)
  unless contractor.nil?
    task = TaskProfile.find_by(oid: row[1].to_i)
    unless task.nil?
      contractor_task = ContractorTaskProfile.where(["contractor_id = ? and task_profile_id = ?", contractor.id, task.id]).first_or_create
      contractor_task.update(contractor_id: contractor.id, task_profile_id: task.id)
      category = task.category
      unless category.nil?
        contractor_category = ContractorCategory.where(["contractor_id = ? and category_id = ?", contractor.id, category.id]).first_or_create
        contractor_category.update(contractor_id: contractor.id, category_id: category.id)
      end

    end

  end
}

# count = 0

# CSV.read('category_task.csv').each { |row|
#   count +=1
#   unless @t[0].nil? || @t[1].nil? then
#     @task = Task.where(oid: @t[1].to_i).first_or_create
#     oid = @t[0].gsub("﻿","").to_i
#     @category = Category.where(oid: oid).first
#     puts count
#     @task.category_id = @category.id
#     @task.save
#     # puts @task.name
#   end
# }
# CSV.open("contractor_expertise.csv", "a+") do |csv|
#   doc.css('#profile-area-expertise > ul > li').each { |service|
#     csv << [id, service.inner_text.strip]
#   }
# end
# CSV.open("contractor_brands.csv", "a+") do |csv|
#   doc.css('#profile-product-brands > ul > li').each { |brand|
#     csv << [id, brand.inner_text.strip]
#   }
# end
# end
# end
# puts total
# CSV.read('tasks.csv').each { |row|
#   @task = TaskProfile.where(oid: @t[0]).first_or_create
#   @task.update(oid: @t[0], name: @t[1], description: @t[2], xm_descriptor: @t[3],
#                matchable: @t[4], profileable: @t[5], es_score: @t[6], default_cost_guide_id: @t[7],
#                keywords: @t[8], text_messaging_name: @t[9], rollover_long_desc: @t[10],
#                rollover_short_desc: @t[11], sector_id: @t[12], meta_description: @t[13],
#                html_title: @t[14], content_description: @t[15], pwc_id: @t[16], accept_goal: @t[17],
#                multi_zip: @t[18], pre_match_type_id: @t[19], bridge_oid: @t[20], bridge_text: @t[21],
#                bridge_link_text: @t[22], bridge_link_id: @t[23], bridge_active: @t[24], xm_name: @t[25],
#                redirect_to_oid: @t[26], sp_display_name: @t[27], xm_header_descriptor: @t[28],
#                url_name: @t[29], consideration_id: @t[30], search_keywords: @t[31],
#                emc_category_oid: @t[32], primary_question_set_id: @t[33],
#                location_specific: @t[34], commercial: @t[35], view_first_parent_task: @t[36])
#   puts @t[0]
# }


# CSV.read('question_sets.csv').each { |row|
#   @question_set = QuestionSet.where(oid: @t[0]).first_or_create
#   @question_set.update(
#     oid: @t[0],
#     task_id: @t[1],
#     task_oid: @t[2],
#     original_task_oid: @t[3],
#     set_id: @t[4],
#     interview_type: @t[5]
#   )
#   puts @t[0]
# }

# CSV.read('questions_t.csv').each { |row|
#   @question_set = QuestionSet.find_by(oid: @t[16])
#   @question = Question.where(oid: @t[0]).first_or_create
#   @question.update(
#     oid: @t[0],
#     question_id: @t[1],
#     question_display_text: @t[2],
#     display_to_sp: @t[3],
#     question_display_sequence: @t[4],
#     page_number: @t[5],
#     question_text: @t[6],
#     short_question_text: @t[7],
#     parent_question_id: @t[8],
#     parent_answer_id: @t[9],
#     parent_question_text: @t[10],
#     required: @t[11],
#     glossary_term: @t[12],
#     default_answer: @t[13],
#     active: @t[14],
#     attribute_match: @t[15],
#     question_set_id: @question_set.id
#   )
#   puts @t[2]
# }

# CSV.read('answers_t.csv').each { |row|
#   @question = Question.find_by(oid: @t[8])
#   @answer = Answer.where(aid: @t[0]).first_or_create
#   @answer.update(
#     aid: @t[0],
#     answer_display_sequence: @t[1],
#     answer_text: @t[2],
#     answer_display_text: @t[3],
#     active: @t[4],
#     default_answer: @t[5],
#     presentation_type: @t[6],
#     child_questions: @t[7],
#     question_id: @question.id
#   )
#   puts @t[2]
# }

# TaskProfile.all.each { |task|
#  @question_set = QuestionSet.find_by(task_oid: task.oid)
#  task.update(question_set_id: @question_set.id) unless @question_set.nil?
#  puts task.name
# }