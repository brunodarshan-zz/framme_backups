class VolumeManagerService
  class << self

    def set_archive(archive, volume)
      if volume && volume.space_available >= archive.size
        in_use = volume.in_use
        volume.update(:in_use => in_use + archive.size)
        return archive.save
      else
        return archive.errors.add(:size, message: "Archive cannot save. The volume has not space.")
      end
      nil
    end

    def update_archive(archive, params)
      volume = volumes_archive(archive)
      if archive && volume && has_space_to_update(volume, params)
        size  = params[:size] - archive.size_was
        volume.in_use += size
        volume.save!
        return archive.update(params)
      else
        return archive.errors.add(:capacity, message: "The follow size cannot fit on the volume")
      end
      nil
    end

    def destroy_archive(archive)
      volume = volumes_archive(archive)
      volume.in_use -= archive.size
      volume.save!
      return archive.destroy!
    end

    private
    def has_space_to_update(volume, params)
      size_to_add = params[:size] - archive.size_was
      return volume.space_available >= size_to_add
    end

    def volumes_archive(arc)
      Volume.find(arc.volume_id)
    end
  # end static context
  end
# End class
end
