class Logchange < Formula
  desc "CLI tool for managing markdown changelogs"
  homepage "https://github.com/logchange/logchange"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/logchange/logchange/releases/download/1.16.7/logchange-linuxx64.zip"
    sha256 "409df1a137ee2461ec8636d2377e64478df6fa3b53bc85c942ce7bcf3852a031"
    def install
      libexec.install Dir["*"]
      chmod 0755, "#{libexec}/logchange-linuxx64/logchange"
      bin.write_exec_script "#{libexec}/logchange-linuxx64/logchange"
    end
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/logchange/logchange/releases/download/1.16.7/logchange-darwinarm64.zip"
    sha256 "9a0cdd9714f18777a17b233c2acfbfd32c0a6ef99a0730a81576668cc559fd3b"
    def install
      libexec.install Dir["*"]
      chmod 0755, "#{libexec}/logchange-darwinarm64/logchange"
      bin.write_exec_script "#{libexec}/logchange-darwinarm64/logchange"
    end
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/logchange/logchange/releases/download/1.16.7/logchange-darwinx64.zip"
    sha256 "f363c98d6387aaaa1c4e8ddce0813e1214a13515218e0fa7f5eca3c0a2cbefc8"
    def install
      libexec.install Dir["*"]
      chmod 0755, "#{libexec}/logchange-darwinx64/logchange"
      bin.write_exec_script "#{libexec}/logchange-darwinx64/logchange"
    end
  end
end
