RSpec.describe R18Client do
  client = R18Client::Client.new
  client.load 'FLAV-210'

  it 'finds title' do
    title = 'Sex With A Seductive Schoolgirl With A Big Ass In A School Swimsuit. Slender Body With A Small Waist And Big Ass. 94cm Hip.'
    expect(client.title).to eq(title)
  end
  
  it 'finds cast' do
    cast = ['Yukine Sakuragi']
    expect(client.cast).to eq(cast)
  end

  it 'finds release_date' do
    date = '2018-12-17'
    expect(client.release_date).to eq(date)
  end
  
  it 'finds genres' do
    genres = ['Schoolgirl', 'Slut', 'School Swimsuits', 'Ass Lover', 'Featured Actress', 'Hi-Def']
    expect(client.genres).to eq(genres)
  end

  it 'finds cover' do
    cover = 'https://pics.r18.com/digital/video/flav00210/flav00210pl.jpg'
    expect(client.cover).to eq(cover)
  end

  it 'fails safely when no video is found' do
    client_fail = R18Client::Client.new
    client_fail.load 'ABP-1098'
    expect(client_fail.success).to eq(false)
  end
end
