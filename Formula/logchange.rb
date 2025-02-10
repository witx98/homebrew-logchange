class Logchange < Formula
  desc "CLI tool for managing markdown changelogs"
  homepage "https://github.com/logchange/logchange"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.intel?
    suffix "linuxx64"
    url "https://github.com/logchange/logchange/releases/download/1.16.7/logchange-#{suffix}.zip"
    sha256 "409df1a137ee2461ec8636d2377e64478df6fa3b53bc85c942ce7bcf3852a031"
  end
  if OS.mac? && Hardware::CPU.arm?
    suffix "darwinarm64"
    url "https://github.com/logchange/logchange/releases/download/1.16.7/logchange-#{suffix}.zip"
    sha256 "5f6583fb29c025806d6d5496cec360f3364c40ddb7764f7cb1f0967d1275b4e0"
  end
  if OS.mac? && Hardware::CPU.intel?
    suffix "darwinx64"
    url "https://github.com/logchange/logchange/releases/download/1.16.7/logchange-#{suffix}.zip"
    sha256 "7cc67b0b4f7b90098c78e163bce03825f2edcc76e85fcb3586e951754a7265ad"
  end

  def install
    libexec.install Dir["*"]
    if OS.linux? && Hardware::CPU.intel?
      chmod 0755, "#{libexec}/logchange-linuxx64/logchange"
      bin.write_exec_script "#{libexec}/logchange-linuxx64/logchange"
    elsif OS.mac? && Hardware::CPU.arm?
      chmod 0755, "#{libexec}/logchange-darwinarm64/logchange"
      bin.write_exec_script "#{libexec}/logchange-darwinx64/logchange"
    elsif OS.mac? && Hardware::CPU.intel?
      chmod 0755, "#{libexec}/logchange-darwinx64/logchange"
      bin.write_exec_script "#{libexec}/logchange-darwinarm64/logchange"
    end
  end
end
