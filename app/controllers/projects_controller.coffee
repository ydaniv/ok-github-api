load 'application'

before 'load project', ->
  Project.find params.id, (err, project) =>
    if err
      redirect path_to.projects()
    else
      @project = project
      next()
, only: ['show', 'edit', 'update', 'destroy']

action 'new', ->
  @project = new Project
  @title = 'New project'
  render()

action 'create', ->
  Project.create body.Project, (err, project) =>
    if err
      flash 'error', 'Project can not be created'
      @project = project
      @title = 'New project'
      render 'new'
    else
      flash 'info', 'Project created'
      redirect path_to.projects()

action 'index', ->
  Project.all (err, projects) =>
    @projects = projects
    @title = 'Projects index'
    render()

action 'show', ->
  @title = 'Project show'
  render()

action 'edit', ->
  @title = 'Project edit'
  render()

action 'update', ->
  @project.updateAttributes body.Project, (err) =>
    if !err
      flash 'info', 'Project updated'
      redirect path_to.project(@project)
    else
      flash 'error', 'Project can not be updated'
      @title = 'Edit project details'
      render 'edit'

action 'destroy', ->
  @project.destroy (error) ->
    if error
      flash 'error', 'Can not destroy project'
    else
      flash 'info', 'Project successfully removed'
    send "'" + path_to.projects() + "'"

