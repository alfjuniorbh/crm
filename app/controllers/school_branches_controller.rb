class SchoolBranchesController < ApplicationController
  def index
    @school_branchs = SchoolBranch.all
  end
end
