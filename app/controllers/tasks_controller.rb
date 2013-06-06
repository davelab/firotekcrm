class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    #@tasks = Task.all
    #TASK ASSEGNATI
    @tasks = Task.where("user_id = ? AND done != ?", current_user.id, 1).order('due_date')
    #TASK DELEGATI
    @created_tasks = Task.where("owner_id = ? AND user_id != ? AND done != ?", current_user.id, "",  1).order('due_date')
    #TASK PERSONALI
    @personal_task = Task.where("owner_id = ? AND user_id IS NULL AND done != ?", current_user.id,  1).order('due_date')

    #TASK FATTI
    @today = Date.tomorrow
    @week_ago = Date.today - 8
    #@done_task = Task.where({:created_at => @week_ago..@today, :done => 1})
    @done_task = Task.where("( created_at BETWEEN ? AND ? AND done = ? ) AND owner_id = ? OR user_id = ?", @week_ago, @today, 1, current_user.id, current_user.id )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save

        if params[:task][:user_id] != ""
          user = User.find(params[:task][:user_id])
          @owner = User.find(params[:task][:owner_id])
          @description = params[:task][:description]
          UserMailer.new_task_assigned(user.email, @owner.username, @description ).deliver
        end
       
        format.html { redirect_to tasks_path, notice: 'Task creato correttamente.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task eliminato correttamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def done
    @task = Task.find(params[:id])
    @task.update_attributes(:done  => params[:done])
    render :nothing => true
  end
end
