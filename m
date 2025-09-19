Return-Path: <linux-i2c+bounces-13060-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BB5B8B3FB
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Sep 2025 22:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B689E18995C4
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Sep 2025 20:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9046C2C2ACE;
	Fri, 19 Sep 2025 20:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cADIhg/4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4610B223702;
	Fri, 19 Sep 2025 20:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758315211; cv=none; b=r+hTWC/RdE1Gd7uQzr8iMWTfkPdL3X+neewC38kYHjtbBTO/RpHLufE3hNAJa92IF69lpA6BYVMUu7J+9MwXviNLO8V2XgDTqykGH5/iDpykrNXwhlwqslsivGxc0FWhpcQ0XVTyj6KSD8sjLYkeO55dRanStCeJNieHIZtWbj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758315211; c=relaxed/simple;
	bh=E1ZV+UNqR3veyxuHfX6mAzdM+m+4EnKUxmuyWi+TK24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PU3XD/sYXcCTZG69Lq73A4a8zUJjKBRrAtEtCA7ui4vE02E2hv43rqBqU+ihqyWsY7RTT1qBLCN0LHCS4jN9aPqg9Bvtt4say2rmbKMInTk+UDOZx8P5iGcN437BoNo/QBTPOm7SgWyvTnURFQbMzYpP49AJ7tbXaQup0Q3vcKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cADIhg/4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97ABEC4CEF0;
	Fri, 19 Sep 2025 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758315210;
	bh=E1ZV+UNqR3veyxuHfX6mAzdM+m+4EnKUxmuyWi+TK24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cADIhg/49suBO/uC2IsFh0Z7L+funFZc48pMScM7SuZh2dhesxomGab/EsnPO8bdD
	 BeF+aZ1x7wBm0wJcNgRvxBhY+NZIzza1GoorjrVhGAnu0KMJU8BsAQTn7ZnrZ8cy/v
	 k2nEtYObhwAaQKGRaorlKhok+oho/mDNS94ZwHXxz3NqaOQv76rzs2SThvkFERpMSD
	 agfFoSpllXKFRxQBQ5PmodugBYh6s0bt/MmWq0QpygbEpo+3JczH8bcI0ASmFpVxk8
	 R2li5Bcz9H3VLWwBtpbG2PRrkEbZGjHH0SJa2xd1wasFzPTmaDC+Mvw8qZWv/QYP0y
	 Fwj2Hwaj1icUw==
Date: Fri, 19 Sep 2025 15:53:29 -0500
From: Rob Herring <robh@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v18 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
Message-ID: <20250919205329.GA2192084-robh@kernel.org>
References: <20250820051832.3605405-1-ryan_chen@aspeedtech.com>
 <20250820051832.3605405-2-ryan_chen@aspeedtech.com>
 <9d6660f0bf5119cedee824cf764f15838622833a.camel@codeconstruct.com.au>
 <OS8PR06MB7541C0D6696FC754D944D45EF208A@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <03abda47219b8b0b476a3740c7ed2acc4b2b16dc.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03abda47219b8b0b476a3740c7ed2acc4b2b16dc.camel@codeconstruct.com.au>

On Mon, Sep 15, 2025 at 11:41:31AM +0800, Jeremy Kerr wrote:
> Hi Ryan,
> 
> > > OK, but the ast2400 and ast2500 I2C peripherals - which this binding also
> > > describes - do not have that facility. Given the 2600 is a distinct peripheral (as
> > > discussed on the v16 series), this would seem to warrant a distinct binding.
> > > 
> > > Should this be split out into an ast2600-specific binding, to reflect that it is
> > > different hardware? The reference to the global registers and transfer modes
> > > would then be added only to the ast2600-i2c-bus binding.
> > 
> > I agree it would be cleaner to split out a new binding file specifically for AST2600,
> > for example: `aspeed,ast2600-i2c.yaml`
> > But also I think `aspeed,i2cv2.yaml` more better name, that compatible will 
> > support next generation such like AST2700 .....
> 
> The ship may have already sailed on that one, as you already have the
> existing compatible string describing existing hardware.
> 
> I would assume that the compatible string should be fixed for an
> instance of the specific hardware, but the DT maintainers may be able to
> provide some input/precedence on changing an existing binding, if
> necessary.
> 
> If this does get changed, I would expect that you would need a
> corresponding update in the old driver too.
> 
> Or, another option may be to keep the current generation ("v2 core with
> compat registers") as-is (ie., at ast2600-i2c-bus), and introduce a new
> string for the next - where the primary hardware change might be the
> removal of compat registers, but it's still new hardware

About the only place we use version numbers (without regret) is when the 
version can be traced back to the actual verilog. This is typically only 
IP targeted to FPGAs. The reality in SoCs is h/w designers can't help 
themselves to not change things. In reality, there are almost always 
some changes.

Rob

