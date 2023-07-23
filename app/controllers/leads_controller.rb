class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  def index
    @leads = Lead.all
    if params[:query].present? && !params[:query].empty?
      @leads = @leads.where("name ILIKE ?", "%#{params[:query]}%")
    end
    respond_to do |format|
      format.html
      format.text { render partial: "leads/list", locals: { leads: @leads }, formats: [:html] }
    end
  end

  def show
    @lead = Lead.find(params[:id])
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      redirect_to lead_path(@lead)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @lead = Lead.find(params[:id])
    if @lead.update(lead_params)
      redirect_to leads_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lead = Lead.find(params[:id])
    if @lead.destroy
      redirect_to leads_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def lead_params
    params.require(:lead).permit(
      :name,
      :telephone_number,
      :email_address,
      :linked_in,
      :github,
      :follow_up,
      :interview,
      :offer
    )
  end

  def set_lead
    @lead = Lead.find(params[:id])
  end
end
