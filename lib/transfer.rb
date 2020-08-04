class Transfer
  attr_accessor :sender, :status, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if valid? == false
      self.status = "rejected"
     return "Transaction rejected. Please check your account balance."
   elsif  valid? == true
     @sender.deposit(-@amount)
     @receiver.deposit(@amount)
     self.status = "complete"
   end
  end

  def reverse_transfer
    @sender.deposit(@amount)
    @receiver.deposit(-@amount)
    @status = "reversed"
  end


end
