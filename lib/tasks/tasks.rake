namespace :tasks do
  desc "Reindexing positions"
  task reindex_positions: :environment do
    Task.all.each_with_index.map{|x,i| x.update_column(:position, i)}
  end

end
