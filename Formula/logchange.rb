class Logchange < Formula
  desc "CLI tool for managing markdown changelogs"
  homepage "https://github.com/logchange/logchange"
  version "1.16.8"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/logchange/logchange/releases/download/#{version}/logchange-linuxx64.zip"
    sha256 "40f71b7c799b8b7d80976dd17c6262bfce3c24ab85a8c81c16b011537316b40f"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/logchange/logchange/releases/download/#{version}/logchange-darwinarm64.zip"
    sha256 "5f6583fb29c025806d6d5496cec360f3364c40ddb7764f7cb1f0967d1275b4e0"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/logchange/logchange/releases/download/#{version}/logchange-darwinx64.zip"
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

  test do
    output = shell_output("#{bin}/logchange --version")
    assert_match version, output
  end
end
