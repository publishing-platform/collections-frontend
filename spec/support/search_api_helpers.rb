module SearchApiHelpers
  def stub_search(body:, params: nil)
    if params
      stub_any_search
        .with(
          query: hash_including(params),
        )
        .to_return("body" => body.to_json)
    else
      stub_any_search.to_return("body" => body.to_json)
    end
  end
end
