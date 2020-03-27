require 'rails_helper'

RSpec.describe GuestsCleanupJob, type: :job do
  before do
    ActiveJob::Base.queue_adapter = :test
  end

  it 'enque the job' do
    date = Time.current.utc.change(usec: 0) + 1.day
    expect {
      GuestsCleanupJob.set(wait_until: date).perform_later
    }.to have_enqueued_job.at(date)
  end

  it 'enque the job without usec change' do
    date = Time.current.utc + 1.day
    expect {
      GuestsCleanupJob.set(wait_until: date).perform_later
    }.to have_enqueued_job.at(date)
  end
end
