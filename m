Return-Path: <linux-i2c+bounces-9284-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D0CA26AF2
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 05:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85D077A33E4
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 04:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F85B16FF44;
	Tue,  4 Feb 2025 04:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="jOSBxYDT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C980815B0EF
	for <linux-i2c@vger.kernel.org>; Tue,  4 Feb 2025 04:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738642403; cv=none; b=IDJFbu/uNSlF6eOZILfO0kpGQhOIZ6VsjWBz66SlarUMEIBkP+Umrbavcbb9GmEbXNf7QwzO4W/+sPxsJ6Z7HATv8rEk+I/+Neb5i5z5kDO5GChO/40fr8kaZ2AyZ3T8iPQg/n2wKAgmk77CBbsC4O5tNDbByc31nSbYkIlEfCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738642403; c=relaxed/simple;
	bh=RExAYE+eg3+DqD0aIdg6MvAYfgTf4PN07K9zMtWgBAY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GtPmSVSTJBSRrhDm3tsh6gYqCcSF6OMaqc1Isqvc+RVUcX+5+PSsLc+jQITADArdbsneZYL+NR4jWbANRkUeHJ8VTwi/ad2BKs80BcbWsFnKf7DjzNlEJ5Rb27fygixAP9Az0dOBHygS7ESs962EupysHz1eZeLGJL7rNTOrOKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=jOSBxYDT; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738642391;
	bh=RExAYE+eg3+DqD0aIdg6MvAYfgTf4PN07K9zMtWgBAY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jOSBxYDTc82cZ0EYD5pVAKqHHryvcacd/mHlBdRPSwerUw6+8ums9QlQaQkNIcajB
	 6sFBcgF708q3xkMkipQjabZqJgeGrjc2kK0y1k7U1sF8aOra4a26tBaqzwY9lp/e/I
	 X4jq+0Ch7xnpCTLAl2bIVobPfN1b3MvV+wh9JANA5fZ+2rHuMmMpNDkMaEHzLU1cEV
	 2Im2nA45kMPZ1fwD6cWrRERtCACkCEbNUyWkcsGXB87WG/CS2TzpmXo8IjG2ERHLka
	 3WVGuGUerfGX6Bymgqy1ofdxZ4aoYCYuMyEdLoZdkJuw5GrTYmdaUWKL0Z5I4/qZy1
	 /PAithJv8ayjg==
Received: from [192.168.68.112] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 005A7735E6;
	Tue,  4 Feb 2025 12:13:08 +0800 (AWST)
Message-ID: <c35202743a7c63414e19766a54c4b9f055d59d97.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: aspeed: Nullify bus messages after timeout
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, ryan_chen@aspeedtech.com, 
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org
Date: Tue, 04 Feb 2025 14:43:07 +1030
In-Reply-To: <e68a787b-f442-4509-bd3b-b407a6075130@linux.ibm.com>
References: <20250131222941.798065-1-eajames@linux.ibm.com>
	 <8f51f0852317a28fc5cf1ba213902be838c9545e.camel@codeconstruct.com.au>
	 <e68a787b-f442-4509-bd3b-b407a6075130@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-03 at 14:29 -0600, Eddie James wrote:
>=20
> On 2/2/25 21:31, Andrew Jeffery wrote:
> > On Fri, 2025-01-31 at 16:29 -0600, Eddie James wrote:
> > > For multimaster case, it's conceivable that an interrupt comes
> > > in after the transfer times out and attempts to use bus messages
> > > that have already been freed by the i2c core.
> > This description seems a little vague. Did you hit this case in
> > practice?
>=20
>=20
> Yes. I no longer have the back trace but it's a null pointer access in=
=20
> the interrupt handler. We had a certain system that would hit this under=
=20
> certain conditions and this patch fixed it.
>=20
>=20
> I can update the commit message with some more detail.

Thanks.

>=20
>=20
> >=20
> > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > > ---
> > > =C2=A0=C2=A0drivers/i2c/busses/i2c-aspeed.c | 1 +
> > > =C2=A0=C2=A01 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/i2c/busses/i2c-aspeed.c
> > > b/drivers/i2c/busses/i2c-aspeed.c
> > > index 1550d3d552aed..e344dcc2233fe 100644
> > > --- a/drivers/i2c/busses/i2c-aspeed.c
> > > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > > @@ -731,6 +731,7 @@ static int aspeed_i2c_master_xfer(struct
> > > i2c_adapter *adap,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * master command.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_lock_irqsave(&bus->lock, flags);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0bus->msgs =3D NULL;
> > It feels like there's buggy code elsewhere in the driver that this is
> > protecting (broken state machine)? I've had a look at the
> > aspeed_i2c_master_irq() implementation and can't see what though, as we
> > take an early-exit (before indexing into bus->msgs) if bus-
> > > master_state is INACTIVE or PENDING.
> > Can you be a bit more specific about where the issue lies?
>=20
>=20
> I'm sure the state machine isn't perfect, yea.
>=20

Right, so I think that's what should be fixed; the explicit states
define possible invariants in the implementation. We shouldn't need to
test `msgs` to know its value (whether its value is correct should be
defined by the current state).

> The bad access can happen=20
> like this: if a transfer times out while waiting for an interrupt, the=
=20
> aspeed_i2c_master_xfer function will either reset the engine or recover=
=20
> the bus, and exit ETIMEDOUT. Resetting the engine will turn off=20
> interrupts, so we're safe. But recovering the bus doesn't turn off=20
> interrupts, so after the function exits ETIMEDOUT, I assume what happens=
=20
> is we get the interrupt for the previous transfer and try and access the=
=20
> messages pointer, which the i2c core has already freed.

So what immediately concerns me is there's no RECOVER state in `enum
aspeed_i2c_master_state` or the rest of the implementation. We do have
the PENDING state, which we don't have in hardware, so there's no
reason for RECOVER to be missing, especially since we have the RECOVER
state in hardware (I2CD14[22:19] =3D 0b0011).

What do you think of adding that, and testing for it in the interrupt
handler?

Andrew

