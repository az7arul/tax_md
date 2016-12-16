#!/usr/bin/env ruby

require_relative "../lib/tax_md"
require_relative "../lib/tax_md/parser"
require_relative "../lib/tax_md/presenter"


receipt = TaxMd::Parser.generate_receipt_from ARGF

presenter = TaxMd::Presenter::StdoutPresenter.new(receipt)

presenter.print_info
