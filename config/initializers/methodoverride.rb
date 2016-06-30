class GuardValidator
  def valid?(image_path)
    return false unless path_exists?(image_path)
    result = Picguard.analyze(
      image_path:
        image_path,
      label_detection:
        options[:label_detection]
    )

  end
end
