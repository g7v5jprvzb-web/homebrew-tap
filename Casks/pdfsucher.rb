cask "pdfsucher" do
  version "1.5.0"
  sha256 "8e712f7f9da99f16ed1d121fb8f6a0cf2a2457e38a08346eea0e69eac994c125"

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
