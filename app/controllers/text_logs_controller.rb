class TextLogsController < ApplicationController
  before_action :set_text_log, only: [:show, :edit, :update, :destroy]

  def index
    @text_logs = TextLog.all
  end

  def show
  end

  def new
    @text_log = TextLog.new
  end

  def edit
  end

  def create
    @text_log = TextLog.new(text_log_params)

    respond_to do |format|
      if @text_log.save
        format.html { redirect_to text_logs_path, notice: 'Text log was successfully created.' }
        format.json { render :show, status: :created, location: @text_log }
      else
        format.html { render :new }
        format.json { render json: @text_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @text_log.update(text_log_params)
        format.html { redirect_to text_logs_path, notice: 'Text log was successfully updated.' }
        format.json { render :show, status: :ok, location: @text_log }
      else
        format.html { render :edit }
        format.json { render json: @text_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @text_log.destroy
    respond_to do |format|
      format.html { redirect_to text_logs_url, notice: 'Text log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_text
    @text_log = TextLog.find(params[:text_log_id])

    message = params[:text_message_body]
    phone_number = @text_log.phone_number

    SmsMailer.send_sms(phone_number, message).deliver_now

    create_audit_record(phone_number, message)

    respond_to do |format|
      format.html { redirect_to text_logs_path, notice: 'Text message was successfully sent.' }
    end
  end

  def create_audit_record(phone_number, message)
    SentText.create(phone_number: phone_number, message: message)
  end

  private

  def set_text_log
    @text_log = TextLog.find(params[:id])
  end

  def text_log_params
    params.require(:text_log).permit(:first_name, :last_name, :phone_number, :text_preference, :notes)
  end
end
