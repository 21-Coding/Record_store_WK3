require 'rspec'
require 'album'

describe '#Album' do

  before(:each) do
    Album.clear()
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Blue", nil, nil, nil, nil)
      album2 = Album.new("Blue", nil, nil, nil, nil)
      expect(album).to(eq(album2))
    end
  end

  describe('#save') do
    it("saves an album") do
      album = Album.new("Giant Steps", nil, nil, nil, nil) # nil, nil added as second argument
      album.save()
      album2 = Album.new("Blue", nil, nil, nil, nil) # nil, nil added as second argument
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new("Giant Steps", nil, nil, nil, nil)
      album.save()
      album2 = Album.new("Blue", nil, nil, nil, nil)
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new("Giant Steps", nil, nil, nil, nil)
      album.save()
      album2 = Album.new("Blue", nil, nil, nil, nil)
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new("Giant Steps", nil, nil, nil, nil)
      album.save()
      album2 = Album.new("Blue", nil, nil, nil, nil)
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new("Giant Steps", nil, nil, nil, nil)
      album.save()
      album.update("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#add_properties') do
    it("Add the release year to an album") do
      album = Album.new("Darkside of the Moon", nil, "1973", nil, nil)
      album.save()
      expect(album.year).to(eq("1973"))
    end
  end

  describe('#add_properties') do
    it("Add a genre to an album") do
      album = Album.new("Black Moth Super Rainbow", nil, nil, "psychedelic", nil)
      album.save()
      expect(album.genre).to(eq("psychedelic"))
    end
  end

  describe('#add_properties') do
    it("Add a genre to an album") do
      album = Album.new("Attack of the Living Trance Zombies", nil, nil, "psytrance", nil)
      album.save()
      expect(album.genre).to(eq("psytrance"))
    end
  end


end
