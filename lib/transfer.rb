class Transfer
  # your code here
  attr_reader :receiver, :amount, :sender
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else 
     reject_transation
    end
  end

  def reverse_transfer
    if valid? && sender.balance > amount && self.status == "complete"
    receiver.balance -= amount
    sender.balance += amount
    self.status = "reversed"
    else
     reject_transation
  end
end

  def reject_transation
    self.status = "rejected"
     "Transaction rejected. Please check your account balance."
  end


end
