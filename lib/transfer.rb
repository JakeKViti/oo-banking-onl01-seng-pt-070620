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
      return "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
    counter = 0
    until counter = 1
    @sender.deposit(-@amount)
    @receiver.deposit(@amount)
    @status = "complete"
    counter =+ 1
    end
  end

  def reverse_transfer

  end


end
