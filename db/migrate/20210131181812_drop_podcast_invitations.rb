class DropPodcastInvitations < ActiveRecord::Migration[6.0]
  def up
    drop_table :podcast_invitations
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
