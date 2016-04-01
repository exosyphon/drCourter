class PatientResourcesController < ApplicationController
  def index
  end

  def new_patient_forms
  end

  def q_a
  end

  def post_op_instructions
  end

  def surgical_instructions
  end

  def download_patient_medical_history
    send_file "#{Rails.root}/app//assets/documents/patient_medical_history.pdf", :type => "application/pdf"
  end

  def download_patient_information
    send_file "#{Rails.root}/app/assets/documents/patient_information.pdf", :type => "application/pdf"
  end
end