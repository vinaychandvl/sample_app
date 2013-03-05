class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :show, :destroy, :addnewrow, :createnewuser]
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @users }
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    if request.post? and params[:user]
      @user = User.new(params[:user])

      respond_to do |format|
        if @user.save
          flash[:notice] = "User created."
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { respond_with(@user) }
          format.xml  { render :xml => @user, :status => :created, :location => @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@user) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@user) }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
      format.xml  { head :ok }
    end
  end

  def addnewrow
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Add new user details in table.' }
      format.xml { redirect_to users_url }
      format.js
    end

  end


  def createnewuser
    puts params.inspect
  @user = User.new
  @user.userName = params[:user][:userName]
  @user.firstName = params[:user][:firstName]
  @user.lastName = params[:user][:lastName]
  @user.emailID = params[:user][:emailID]
  @user.password = "foobar"
  @user.password_confirmation = "foobar"
   respond_to do |format|
        if @user.save
          format.html { redirect_to users_url }
          format.json { respond_with(@user) }
          format.xml  { render :xml => @user, :status => :created, :location => @user }
          format.js { render :js => "window.location.replace('#{article_path(@article)}');"}
        else
          format.html { redirect_to users_url }
          format.json { render json: @user.errors, status: :unprocessable_entity }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
  end

  private
  def signed_in_user
    redirect_to signin_url, notice: "Please sign in" unless signed_in?
  end

end
