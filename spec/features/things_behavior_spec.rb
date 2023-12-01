require 'rails_helper'

describe 'interaction for ThingsController' do
  include HotGlue::ControllerHelper
  include ActionView::RecordIdentifier

  # HOTGLUE-SAVESTART
  # HOTGLUE-END
  







  let!(:user1) {create(:user)}










  let!(:thing1) {
    thing = create(:thing , 
                          name: FFaker::Movie.title, 
                          description:  FFaker::Lorem.paragraphs(10).join(), 
                          executed_on: Date.current + rand(50).days, 
                          concieved_of_at: DateTime.current + 1.day, 
                          will_be_at: Time.current + rand(5000).seconds, 
                          forecast: FFaker::Movie.title, 
                          user: user1, 
                          when_at: Date.current + rand(50).days, 
                          background_details:  FFaker::Lorem.paragraphs(10).join(), 
                          will_call: !!rand(2).floor, 
                          amount: rand(1)*10000, 
                          aaa: FFaker::Movie.title, 
                          bbb: rand(100), 
                          ccc:  FFaker::Lorem.paragraphs(10).join(), 
                          ddd: Date.current + rand(50).days, 
                          eee: DateTime.current + 1.day )

    thing.save!
    thing
  }
  
  let(:testing_timezone) {
    Rails.application.config.time_zone
  }
  describe "index" do
    it "should show me the list" do
      visit things_path
      expect(page).to have_content(thing1.name)
      expect(page).to have_content(thing1.description)
      expect(page).to have_content(thing1.executed_on)
      expect(page).to have_content(thing1.concieved_of_at.in_time_zone(testing_timezone).strftime('%m/%d/%Y @ %l:%M %p %Z').gsub('  ', ' '))
      
      expect(page).to have_content(thing1.persona)
      expect(page).to have_content(thing1.forecast)
      
      expect(page).to have_content(thing1.when_at)
      expect(page).to have_content(thing1.background_details)
      expect(page).to have_content(thing1.expected_result)
      expect(page).to have_content(thing1.will_call ? 'YES' : 'NO')
      expect(page).to have_content(thing1.amount)
      expect(page).to have_content(thing1.aaa)
      expect(page).to have_content(thing1.bbb)
      expect(page).to have_content(thing1.ccc)
      expect(page).to have_content(thing1.ddd)
      expect(page).to have_content(thing1.eee.in_time_zone(testing_timezone).strftime('%m/%d/%Y @ %l:%M %p %Z').gsub('  ', ' '))
    end
  end

  describe "new & create" do
    it "should create a new Thing" do
      visit things_path
      click_link "New Thing"
      expect(page).to have_selector(:xpath, './/h3[contains(., "New Thing")]')
      new_name = FFaker::Movie.title 
      find("[name='thing[name]']").fill_in(with: new_name)
      new_description = FFaker::Lorem.paragraphs(1).join() 
      find("[name='thing[description]']").fill_in(with: new_description)
      new_executed_on = Date.current + (rand(100).days) 
      find("[name='thing[executed_on]']").fill_in(with: new_executed_on)
      new_concieved_of_at = DateTime.current + 1.year 
      find("[name='thing[concieved_of_at]']").fill_in(with: new_concieved_of_at)
      new_will_be_at = Time.current + 5.seconds 
      find("[name='thing[will_be_at]']").fill_in(with: new_will_be_at)
      list_of_persona_type = Thing.defined_enums['persona'].keys 
      new_persona = list_of_persona_type[rand(list_of_persona_type.length)].to_s 
      find("select[name='thing[persona]']  option[value='#{new_persona}']").select_option
      new_forecast = FFaker::Movie.title 
      find("[name='thing[forecast]']").fill_in(with: new_forecast)
      user_id_selector = find("[name='thing[user_id]']").click 
      user_id_selector.first('option', text: user1.name).select_option
      new_when_at = Date.current + (rand(100).days) 
      find("[name='thing[when_at]']").fill_in(with: new_when_at)
      new_background_details = FFaker::Lorem.paragraphs(1).join() 
      find("[name='thing[background_details]']").fill_in(with: new_background_details)
      list_of_expected_result_type = Thing.defined_enums['expected_result'].keys 
      new_expected_result = list_of_expected_result_type[rand(list_of_expected_result_type.length)].to_s 
      find("select[name='thing[expected_result]']  option[value='#{new_expected_result}']").select_option
      new_will_call = 1 
      find("[name='thing[will_call]'][value='#{new_will_call}']").choose
      new_amount = rand(10) 
      find("[name='thing[amount]']").fill_in(with: new_amount)
      new_aaa = FFaker::Movie.title 
      find("[name='thing[aaa]']").fill_in(with: new_aaa)
      new_bbb = rand(10) 
      find("[name='thing[bbb]']").fill_in(with: new_bbb)
      new_ccc = FFaker::Lorem.paragraphs(1).join() 
      find("[name='thing[ccc]']").fill_in(with: new_ccc)
      new_ddd = Date.current + (rand(100).days) 
      find("[name='thing[ddd]']").fill_in(with: new_ddd)
      new_eee = DateTime.current + 1.year 
      find("[name='thing[eee]']").fill_in(with: new_eee)
      click_button "Save"
      expect(page).to have_content("Successfully created")

      expect(page).to have_content(new_name)
      expect(page).to have_content(new_description)
      expect(page).to have_content(new_executed_on)
      expect(page).to have_content(new_concieved_of_at.in_time_zone(testing_timezone).strftime('%m/%d/%Y @ %l:%M %p %Z').gsub('  ', ' '))
      expect(page).to have_content(new_will_be_at.strftime('%l:%M %p').strip)
      expect(page).to have_content(new_persona)
      expect(page).to have_content(new_forecast)
       expect(page).to have_content(user1.name)
      expect(page).to have_content(new_when_at)
      expect(page).to have_content(new_background_details)
      expect(page).to have_content(new_expected_result)
      expect(page).to have_content(thing1.will_call ? 'YES' : 'NO')
      expect(page).to have_content(new_amount)
      expect(page).to have_content(new_aaa)
      expect(page).to have_content(new_bbb)
      expect(page).to have_content(new_ccc)
      expect(page).to have_content(new_ddd)
      expect(page).to have_content(new_eee.in_time_zone(testing_timezone).strftime('%m/%d/%Y @ %l:%M %p %Z').gsub('  ', ' '))
    end
  end


  describe "edit & update" do
    it "should return an editable form" do
      visit things_path
      find("a.edit-thing-button[href='/things/#{thing1.id}/edit']").click

      expect(page).to have_content("Editing #{thing1.name.squish || "(no name)"}")
      new_name = FFaker::Movie.title 
      find("[name='thing[name]']").fill_in(with: new_name)
      new_description = FFaker::Lorem.paragraphs(1).join() 
      find("[name='thing[description]']").fill_in(with: new_description)
      new_executed_on = Date.current + (rand(100).days) 
      find("[name='thing[executed_on]']").fill_in(with: new_executed_on)
      new_concieved_of_at = DateTime.current + 1.year 
      find("[name='thing[concieved_of_at]']").fill_in(with: new_concieved_of_at)
      new_will_be_at = Time.current + 5.seconds 
      find("[name='thing[will_be_at]']").fill_in(with: new_will_be_at)
      list_of_persona_type = Thing.defined_enums['persona'].keys 
      new_persona = list_of_persona_type[rand(list_of_persona_type.length)].to_s 
      find("select[name='thing[persona]']  option[value='#{new_persona}']").select_option
      new_forecast = FFaker::Movie.title 
      find("[name='thing[forecast]']").fill_in(with: new_forecast)
      user_id_selector = find("[name='thing[user_id]']").click 
      user_id_selector.first('option', text: user1.name).select_option
      new_when_at = Date.current + (rand(100).days) 
      find("[name='thing[when_at]']").fill_in(with: new_when_at)
      new_background_details = FFaker::Lorem.paragraphs(1).join() 
      find("[name='thing[background_details]']").fill_in(with: new_background_details)
      list_of_expected_result_type = Thing.defined_enums['expected_result'].keys 
      new_expected_result = list_of_expected_result_type[rand(list_of_expected_result_type.length)].to_s 
      find("select[name='thing[expected_result]']  option[value='#{new_expected_result}']").select_option
      new_will_call = 1 
      find("[name='thing[will_call]'][value='#{new_will_call}']").choose
      new_amount = rand(10) 
      find("[name='thing[amount]']").fill_in(with: new_amount)
      new_aaa = FFaker::Movie.title 
      find("[name='thing[aaa]']").fill_in(with: new_aaa)
      new_bbb = rand(10) 
      find("[name='thing[bbb]']").fill_in(with: new_bbb)
      new_ccc = FFaker::Lorem.paragraphs(1).join() 
      find("[name='thing[ccc]']").fill_in(with: new_ccc)
      new_ddd = Date.current + (rand(100).days) 
      find("[name='thing[ddd]']").fill_in(with: new_ddd)
      new_eee = DateTime.current + 1.year 
      find("[name='thing[eee]']").fill_in(with: new_eee)
      click_button "Save"
      within("turbo-frame#__#{dom_id(thing1)} ") do
        expect(page).to have_content(new_name)
       expect(page).to have_content(new_description)
       expect(page).to have_content(new_executed_on)
       expect(page).to have_content(new_concieved_of_at.in_time_zone(testing_timezone).strftime('%m/%d/%Y @ %l:%M %p %Z').gsub('  ', ' '))
       expect(page).to have_content(new_will_be_at.strftime('%l:%M %p').strip)
       expect(page).to have_content(new_persona)
       expect(page).to have_content(new_forecast)
        expect(page).to have_content(user1.name)
       expect(page).to have_content(new_when_at)
       expect(page).to have_content(new_background_details)
       expect(page).to have_content(new_expected_result)
       expect(page).to have_content(thing1.will_call ? 'YES' : 'NO')
       expect(page).to have_content(new_amount)
       expect(page).to have_content(new_aaa)
       expect(page).to have_content(new_bbb)
       expect(page).to have_content(new_ccc)
       expect(page).to have_content(new_ddd)
       expect(page).to have_content(new_eee.in_time_zone(testing_timezone).strftime('%m/%d/%Y @ %l:%M %p %Z').gsub('  ', ' '))
      end
    end
  end 

  describe "destroy" do
    it "should destroy" do
      visit things_path
      accept_alert do
        find("form[action='/things/#{thing1.id}'] > input.delete-thing-button").click
      end
      expect(page).to_not have_content(thing1.name)
      expect(Thing.where(id: thing1.id).count).to eq(0)
    end
  end
end

