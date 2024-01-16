cask "appflowy" do
    version "0.4.1"
    sha256 :no_check
  
    url do
        assets = GitHub.get_release("davystrong", "AppFlowy", "#{version}").fetch("assets")
        latest = assets.find{|a| a["name"] == "AppFlowy-#{version}-macos-universal.zip" }.fetch("url")
        [latest, header: [
          "Accept: application/octet-stream",
          "Authorization: bearer #{GitHub::API.credentials}"
        ]]
      end
    name "AppFlowy"
    desc "Open-source project and knowledge management tool"
    homepage "https://www.appflowy.io/"
  
    livecheck do
      url :url
      strategy :github_latest
    end
  
    depends_on macos: ">= :mojave"
  
    app "AppFlowy.app"
  
    zap trash: [
      "~/Library/Application Scripts/com.appflowy.macos",
      "~/Library/Containers/com.appflowy.macos",
    ]
  end