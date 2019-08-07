# https://www.programcreek.com/2012/12/leetcode-evaluate-reverse-polish-notation/

require "minitest/autorun"

def eval_token(t)
  case t
  when "*"
    :*
  when "+"
    :+
  else
    Integer(t)
  end
end

def eval_rpn_exp(exp)
  stack = []
  while t = exp.shift
    token = eval_token(t)
    case token
    when Numeric
      stack << token
    when Symbol
      op1 = stack.pop
      op2 = stack.pop

      if op1.nil? || op2.nil?
        raise "Invalid Exp"
      end

      stack << op1.public_send(token, op2)
    else
      raise "Invalid Exp"
    end
  end

  stack.pop
end

def tokenize_rpn(s)
  s.split(" ")
end

def eval_rpn(s)
  tokenized_rpn = tokenize_rpn(s)
  eval_rpn_exp(tokenized_rpn)
end


class RpnTest < Minitest::Test
  def test_rpn
    assert_equal 9, eval_rpn("2 1 + 3 *")
  end
end
