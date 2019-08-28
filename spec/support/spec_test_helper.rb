module SpecTestHelper
  def add_session(session)
    allow_any_instance_of(ActionDispatch::Request)
      .to receive(:session).and_return(session)
  end
end