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
    if valid? == true
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
      end
    end
     return "Transaction rejected. Please check your account balance."
     @status = "rejected"
  end

  def reverse_transfer
    @sender.deposit(@amount)
    @receiver.deposit(-@amount)
    @status = "reversed"
  end


end
