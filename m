Return-Path: <linux-i2c+bounces-549-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4061D7FE376
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 23:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDF3C2822E0
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 22:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEE21D691;
	Wed, 29 Nov 2023 22:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="HKhhAUwU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39FA4122;
	Wed, 29 Nov 2023 14:44:50 -0800 (PST)
Received: from [192.168.68.112] (ppp118-210-131-38.adl-adc-lon-bras33.tpg.internode.on.net [118.210.131.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2A2642014A;
	Thu, 30 Nov 2023 06:44:38 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1701297884;
	bh=3/RdWbl1/Y7109L7deJTqux8rPtQXt1q7C4U6mcb2AM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HKhhAUwUL/rIv0NFaMEyE2NscNboxbaKpc7q+jumnKREr/4dyPS0lTIGAoUtjzfqI
	 +ZJn2JIvPHsZz3k7RVK6CUo9GZENgHOgcOzuUx0XI0hQoafGnNX/xgV265OxHK35Ir
	 SQi66MjFYqk027UQfs8101rerH89LCnVaUhBb+qM6yr6n0RZp5Xqkebh4Nc7oxpyJX
	 G5xKKjNRd9fVJgifEa1f2Tc3PxXfHtWCmoGpnBbOtowN/T/Ia0sZSkFnn28f3bkOlP
	 sP5IWPBvU3wOQ+wjR/7Jt0CmAIBwT0bpO7DypAUHs/f0z2F6k3adv4wQTGKzhrr1ah
	 ck2dkrKQPNUQQ==
Message-ID: <cb6043dfa13a269eb287a38521dc1b7722a237cc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 RESEND 2/2] i2c: aspeed: Acknowledge Tx done with and
 without ACK irq late
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Quan Nguyen <quan@os.amperecomputing.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>,  Joel Stanley <joel@jms.id.au>, Andi Shyti
 <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission
	 <patches@amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, 
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
Date: Thu, 30 Nov 2023 09:14:37 +1030
In-Reply-To: <66dcea57-db0b-4686-9eaf-746db637f31c@os.amperecomputing.com>
References: <20231128075236.2724038-1-quan@os.amperecomputing.com>
	 <20231128075236.2724038-3-quan@os.amperecomputing.com>
	 <2186c3b9ac92f03c68e8a2dd9fda871f80a6d664.camel@codeconstruct.com.au>
	 <66dcea57-db0b-4686-9eaf-746db637f31c@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2023-11-29 at 16:02 +0700, Quan Nguyen wrote:
>=20
> On 29/11/2023 07:33, Andrew Jeffery wrote:
> > On Tue, 2023-11-28 at 14:52 +0700, Quan Nguyen wrote:
> > > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c=
-aspeed.c
> > > index 79476b46285b..3231f430e335 100644
> > > --- a/drivers/i2c/busses/i2c-aspeed.c
> > > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > > @@ -611,8 +611,9 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, vo=
id *dev_id)
> > >  =20
> > >   	spin_lock(&bus->lock);
> > >   	irq_received =3D readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> > > -	/* Ack all interrupts except for Rx done */
> > > -	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
> > > +	/* Ack all interrupts except for Rx done and Tx done with/without A=
CK */
> >=20
> > I'm not a huge fan of this comment, it just says what the code does. It
> > would be much better to explain *why* the code does what it does.
> >=20
> > I realise describing what the code does was already the gist of the
> > comment and that you're just updating it to match the change to the
> > code, but that's my entire problem with it. We'd be better off deleting
> > it if we're not going to explain why the masking is necessary.
> >=20
>=20
> Thanks for the comment Andrew.
>=20
> I would prefer to delete it.
>=20
> But if to put some comment, how about:
>=20
> /* Early ack INTR_RX_DONE, INTR_TX_[ACK|NAK] would indicate HW to start=
=20
> receiving/sending new data and may cause a race condition as irq handler=
=20
> not yet to handle these irqs but being acked. Let ack them late in the=
=20
> end of irq handler when those are truly processed */

Please update the patch with this comment. It at least goes some way to
explain why.

>=20
> > > +	writel(irq_received &
> > > +	       ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEE=
D_I2CD_INTR_TX_NAK),
> > >   	       bus->base + ASPEED_I2C_INTR_STS_REG);
> > >   	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> > >   	irq_received &=3D ASPEED_I2CD_INTR_RECV_MASK;
> > > @@ -657,12 +658,12 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, =
void *dev_id)
> > >   			"irq handled !=3D irq. expected 0x%08x, but was 0x%08x\n",
> > >   			irq_received, irq_handled);
> > >  =20
> > > -	/* Ack Rx done */
> > > -	if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
> > > -		writel(ASPEED_I2CD_INTR_RX_DONE,
> > > -		       bus->base + ASPEED_I2C_INTR_STS_REG);
> > > -		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> > > -	}
> > > +	/* Ack Rx done and Tx done with/without ACK */
> > > +	writel(irq_received &
> > > +	       (ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED=
_I2CD_INTR_TX_NAK),
> > > +	       bus->base + ASPEED_I2C_INTR_STS_REG);
> > > +	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> >=20
> > I'm not sure why the write was conditional, but I'm not sure that
> > making it unconditional is valid either? Why the change? Why not add
> > the extra interrupt bits to the condition in addition to the value mask
> > for the write?
> >=20
>=20
> In original code, only INTR_RX_DONE was acked late. So the check=20
> (irq_received & ASPEED_I2CD_INTR_RX_DONE) is need and that help to save=
=20
> one write() then read() if there was no such irq.
>=20
> In the new code, there is no such check and the drawback is that there=
=20
> always be one write() and one read() for all cases, include the case=20
> where there is no irq at all, ie writing 0 into ASPEED_I2C_INTR_STS_REG.
>=20
> And yes, your concern maybe right, we can not say of writing 0 into=20
> ASPEED_I2C_INTR_STS_REG is good or not.
>=20
> I checked back my debug log and seeing that irq always come with at=20
> least one of INTR_RX_DONE BIT(2), INTR_TX_ACK BIT(0), INTR_TX_NAK BIT(1)=
=20
> raised. So it seems like the case of writing 0 into=20
> ASPEED_I2C_INTR_STS_REG is indeed rarely to happen.
>=20
> Do you think we should change it to:
>=20
> if (irq_received & (INTR_RX_DONE | INTR_TX_ACK | INTR_TX_NAK)) {
> 	writel( irq_received & (INTR_RX_DONE| INTR_TX_ACK| INTR_TX_NAK),
> 		bus->base + ASPEED_I2C_INTR_STS_REG);
> 	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> }

This is less different from the existing strategy and doesn't require
any explanation beyond what you're already trying to achieve in the
patch, so I think you should switch to this approach.

If someone wants to work out why it was done conditionally and argue
for its removal then they can do that separately.

Cheers,

Andrew

