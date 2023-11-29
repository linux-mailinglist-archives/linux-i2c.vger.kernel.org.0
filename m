Return-Path: <linux-i2c+bounces-548-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 259457FE1C0
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 22:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3CBF281D3C
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 21:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7091D61687;
	Wed, 29 Nov 2023 21:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mshk4Wxw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0B65EE78
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 21:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B7FC433C9;
	Wed, 29 Nov 2023 21:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701293157;
	bh=ROdIinNcMbpv2zZ2WaGDF27TbBat2/HH4ZUHKaYavi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mshk4Wxw0C1PuUEdL/SVD29XR2CpunRcEl044qrZlvwrelLuUEoLjXeN6ti/tyo/9
	 Ky+KTExJRiau+jLK89jsO6WBTmbXzwQgbSRj6S1CK6+QYZ0EeE73VQlaSrAt3bCo1f
	 ORXWcVaZDQYQiHKjd8iTCMrVsS5Ig4nwpLiEoQSMDTq+f1aiN19H+/Ecq/QU9pQC9q
	 zuroMJSqsObhFl5qqBNsD1tS/1aA6Rykyf+huvAqqgJLoO4eyNfK4MDrq3BqfzO7cO
	 wrY/9U9Te1p8F/MfxFpKSpqzRyQ4ND7qSWKb4t3arWQk7kNbnXOQ2guOdBMm5HSo9f
	 XvyTCYszIFwog==
Date: Wed, 29 Nov 2023 22:25:52 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Wolfram Sang <wsa@kernel.org>,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v2 RESEND 1/2] i2c: aspeed: Fix unhandled Tx done with NAK
Message-ID: <20231129212552.3uy7oqm5fz5h2m6b@zenone.zhora.eu>
References: <20231128075236.2724038-1-quan@os.amperecomputing.com>
 <20231128075236.2724038-2-quan@os.amperecomputing.com>
 <20231129003542.jfhhotebweb3uwyb@zenone.zhora.eu>
 <3f37c359-1c71-421f-b7d9-054696735adc@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f37c359-1c71-421f-b7d9-054696735adc@os.amperecomputing.com>

Hi Quan,

> On 29/11/2023 07:35, Andi Shyti wrote:
> > Hi Quan,
> > 
> > On Tue, Nov 28, 2023 at 02:52:35PM +0700, Quan Nguyen wrote:
> > > Under normal conditions, after the last byte is sent by the Slave, the
> > > TX_NAK interrupt is raised.  However, it is also observed that
> > > sometimes the Master issues the next transaction too quickly while the
> > > Slave IRQ handler is not yet invoked and the TX_NAK interrupt for the
> > > last byte of the previous READ_PROCESSED state has not been ack’ed.
> > > This TX_NAK interrupt is then raised together with SLAVE_MATCH interrupt
> > > and RX_DONE interrupt of the next coming transaction from Master. The
> > > Slave IRQ handler currently handles the SLAVE_MATCH and RX_DONE, but
> > > ignores the TX_NAK, causing complaints such as
> > > "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. Expected
> > > 0x00000086, but was 0x00000084"
> > > 
> > > This commit adds code to handle this case by emitting a SLAVE_STOP event
> > > for the TX_NAK before processing the RX_DONE for the coming transaction
> > > from the Master.
> > > 
> > > Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
> > > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> > > ---
> > > v2:
> > >    + Split to separate series [Joel]
> > >    + Added the Fixes line [Joel]
> > >    + Revised commit message [Quan]
> > > 
> > > v1:
> > >    + First introduced in
> > > https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
> > > ---
> > >   drivers/i2c/busses/i2c-aspeed.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> > > index 28e2a5fc4528..79476b46285b 100644
> > > --- a/drivers/i2c/busses/i2c-aspeed.c
> > > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > > @@ -253,6 +253,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
> > >   	/* Slave was requested, restart state machine. */
> > >   	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
> > > +		if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
> > > +		    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
> > > +			irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
> > > +			i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> > > +		}
> > 
> > this is a duplicate of a later "if (...)" satement. What is the
> > need for having them both?
> > 
> Thanks Andi for the review.
> 
> I assumed the if statement you mentioned is here in [1]. If so, then that is
> not duplicate.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-aspeed.c?h=v6.7-rc3#n287
> 
> 
> The if statement is to process the case when Slave sending data to Master
> but being NAK, the I2C_SLAVE_STOP event will emit later in switch-case
> statement. But it is only for the case INTR_TX_NAK without INTR_SLAVE_MATCH.
> 
> The new code is for the case of INTR_TX_NAK with INTR_SLAVE_MATCH. What it
> does is to detect if there is a mix of INTR_TX_NAK of previous i2c
> transaction and the start of new i2c transaction, indicate by
> INTR_SLAVE_MATCH which is only raised when Slave found its address matched
> on the first byte it received. If so, the new code will try to emit the
> I2C_SLAVE_STOP first to complete the previous transaction and process the
> rest as a new request.
> 
> So if this was the case (with INTR_SLAVE_MATCH), the INTR_RX_DONE should
> always raise with INTR_SLAVE_MATCH because Slave did receive the data which
> matched with its Slave address. And this will be translated into either
> I2C_SLAVE_[READ|WRITE]_REQUESTED and that make the if statement you
> mentioned [1] evaluate to false and skip.
> 
> So, in short, the new code is trying to handle the case of INTR_TX_NAK with
> INTR_SLAVE_MATCH first before let the rest process as normal.

yes, I saw that, but wasn't it easier to do something like this:

	if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
	    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
		irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
		bus->slave_state = ASPEED_I2C_SLAVE_STOP;

		if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH)
			i2c_slave_event(slave, I2C_SLAVE_STOP, &value);

	}

But I see that Andrew has done some similar comment, also for
patch 2. You can answer both in the same mail, not to duplicate
the answer :-)

We can wait for him to reply.

Andi

