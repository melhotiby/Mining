class LeadsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @leads = Lead.paginate(:page => params[:page], :per_page => 40)    
  end
  
  def search
    beginning_time = Time.now
    Lead.search 'Software'
    end_time = Time.now
    puts "Time elapsed with thinking sphinx all search #{(end_time - beginning_time)*1000} milliseconds"
    
    something = Benchmark.ms do
      Lead.where("title like ?", "%Software%")
    end
    
    something = Benchmark.bm do
      Lead.where("title like ?", "%Software%")
    end
    
    beginning_time = Time.now
    Lead.search :conditions => {:title => 'Software'}
    end_time = Time.now
    puts "Time elapsed with thinking sphinx subject search #{(end_time - beginning_time)*1000} milliseconds"
    
    beginning_time = Time.now
    Lead.where("title like ?", "%Software%")
    end_time = Time.now
    puts "Time elapsed with mysql like search #{(end_time - beginning_time)*1000} milliseconds"
        
    @leads = Lead.paginate(:page => params[:page], :per_page => 40)    
    render action: "index"
  end
  
  def lead_form_submit
    count = Lead.create_records(params["name"], params["state"], params["choices"], params["previous_days"])
    redirect_to leads_path, notice: "Successfully inserted #{count} new records" 
  end
  
  def export
    @leads = Lead.find(params[:ids].split(","))
    respond_to do |format|
        format.csv { render :csv => @leads }
    end
  end

  def show
    @lead = Lead.find(params[:id])
  end

  def new
    @lead = Lead.new
  end

  def edit
    @lead = Lead.find(params[:id])
  end

  def create
    @lead = Lead.new(params[:lead])
    if @lead.save
      redirect_to @lead, notice: 'Lead was successfully created.' 
    else
      render action: "new"
    end
  end

  def update
    @lead = Lead.find(params[:id])
    if @lead.update_attributes(params[:lead])
      redirect_to @lead, notice: 'Lead was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @lead = Lead.find(params[:id])
    @lead.destroy
    redirect_to leads_url
  end
end
