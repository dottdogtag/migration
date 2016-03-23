require 'csv'

array = []

CSV.foreach("#{File.dirname(__FILE__)}/../data_source/User_Follow_Lost.csv", headers: true) do |row|
  obj = row.to_hash
  id = obj['id']
  user_id = obj['new_user_id']
  lost_report_id = obj['new_lost_id']
  created_at = obj['Create_Date']
  updated_at = obj['Last_Modify_Date']

  confirm_user_exist = obj['confirm_user_exist']
  confirm_report_exist = obj['confirm_report_exist']
  confirm_created_by_exist = obj['confirm_created_by_exist']

  update_hash =
    "{

      user_id: '#{user_id}',
      lost_report_id: '#{lost_report_id}',
      created_at: '#{created_at}',
      updated_at: '#{updated_at}'
    }"

  if (lost_report_id != "NULL") && (confirm_user_exist != "NULL") && (confirm_report_exist != "NULL") && (confirm_created_by_exist != "NULL")
    puts update_hash
    array.push update_hash
  end
end

user_update_ruby = "LostReportFollowing.create([#{array.join(",")}])"
File.write("#{File.dirname(__FILE__)}/../results/Following.rb", user_update_ruby)
