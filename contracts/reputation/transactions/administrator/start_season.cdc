import Reputation from 0x01

// Signed by Administrator

transaction(seasonDuration: UFix64) {
  let Administrator: &Reputation.Administrator
  
  prepare(signer: AuthAccount) {
    self.Administrator = signer.borrow<&Reputation.Administrator>(from: Reputation.AdministratorStoragePath)
                            ?? panic("Could not borrow the Reputation Administrator.")
  }

  execute {
    self.Administrator.startSeason(seasonDuration: seasonDuration)
    log("New Season Started")
  }
}