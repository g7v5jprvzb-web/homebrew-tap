cask "pdfsucher" do
  version "1.3.4"
  sha256 "13ef143f1bc487b0aa345892a7758ffb07ff361bd7f60c012b086631109ce69e"

  url "https://github.com/g7v5jprvzb-web/pdfsucher/releases/download/v#{version}/PDFSucher-#{version}.zip"
  name "PDFSucher"
  desc "Durchsucht PDF-Ordner und zeigt Treffer als Seitenkacheln"
  homepage "https://github.com/g7v5jprvzb-web/pdfsucher"

  depends_on macos: :tahoe

  app "PDFSucher.app"

  # Die App ist nur ad-hoc signiert (keine Apple-Developer-ID, nicht notarisiert).
  # Ohne diesen Schritt blockiert Gatekeeper den ersten Start.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PDFSucher.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/PDFSucher",
    "~/Library/Caches/local.pdfsucher",
    "~/Library/Preferences/local.pdfsucher.plist",
  ]
end
