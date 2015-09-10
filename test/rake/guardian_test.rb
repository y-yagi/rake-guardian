require 'test_helper'

class Rake::GuardianTest < Minitest::Test
  def test_default_env
    assert_equal %w(production), Rake::Guardian.config.env
  end

  def test_default_tasks
    assert_equal %w(db:drop db:reset db:purge db:drop:all), Rake::Guardian.config.tasks
  end

  def test_db_drop_do_not_run_if_you_specify_production_in_RAILS_ENV
    stdout, stderr, status = Open3.capture3("rake db:drop RAILS_ENV=production")
    assert_equal "[rake-guardian] db:drop can not invoke.\n", stderr
  end

  def test_db_drop_run_if_you_not_specify_RAILS_ENV
    stdout, stderr, status = Open3.capture3("rake db:drop")
    assert_equal "run db:drop\n", stderr
  end

  def test_other_task_run_if_you_specify_production_in_RAILS_ENV
    stdout, stderr, status = Open3.capture3("rake test:other RAILS_ENV=production")
    assert_equal "run test:other\n", stderr
  end

  def test_run_together_tasks_to_be_guard
    stdout, stderr, status = Open3.capture3("rake test:other db:drop RAILS_ENV=production")
    assert_equal "run test:other\n[rake-guardian] db:drop can not invoke.\n", stderr
  end
end
