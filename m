Return-Path: <linux-i2c+bounces-9635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3995FA48ACD
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 22:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7C0E161C30
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 21:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD43227129B;
	Thu, 27 Feb 2025 21:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="HNFB8BfO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D011CEAA3;
	Thu, 27 Feb 2025 21:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740692876; cv=none; b=pROlkQfY4v+keDtmnWEq+5/XQTSIT7T2Kk7LrRjNvCpLgX0l0EKc3B7uAtaaNO0HhODYUjTp9gMJ7WKJq6N9ccCnlBPmxCyRgnaOYtVsGO0lST/y27o7eViIIA0GDlgo8ess7fY/Jtu7YztumnOEwuWUWr+DTYna+HYVYmoFdG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740692876; c=relaxed/simple;
	bh=8s3KyPP5+X5tLO930i9gADccHKv4fCmFC0alqAjK0f4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QU5oYO8m/oCg5E7qpEnAFPRghWkaFW58VvCc2zPVe6JPAA4Slm9INdre7GqW6aGxDmP15gwNWU/7DeZClxJ0xV0J8wzxzB6lxhRLpsRKQXLrG4v5JGrUMnCSZa3Y/72a/yyte230ist0E4bmZ/BgEEjeOXNbgkWdZI0+zOpFzQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=HNFB8BfO; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=gYjaKOa1qyvTVLLATJgBPcnTo3YvBY1Vu2MT27yHSZo=; b=HNFB8BfOVSohIXtfIvjNdHwd2w
	dasmnZAFnwCd6WtdseHM7+CukesU4EuE8ivRkTdDXlJArWVNQDbDZSrsnuFDo+tFd2R++XK2IElKg
	xA0tAHsF4U1/+6gr/WTi4g0rlvIZSNbZzK5kP0cYNkDmdqdF30mI7/EnnOqooeW7SVVQ5G2//v4pw
	tNHbWcmGHOWXWLkvPtu4yFyyMOXQeo6mxrDQfK0pL0XdRMQ1tnE9+jB43kewfhgmKlBgfPyCFj8NB
	PwP1WFrjrGVIc7V4vS9VSBNbEmF0KltjGsamvRDAYQI3D84FTVHPV65BngQghdP+AkuLMtyUjGbBs
	LTm4jOHg==;
Date: Thu, 27 Feb 2025 22:47:38 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Nishanth Menon <nm@ti.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, <vigneshr@ti.com>,
 <aaro.koskinen@iki.fi>, <khilman@baylibre.com>, <rogerq@kernel.org>,
 <tony@atomide.com>, <jmkrzyszt@gmail.com>, <reidt@ti.com>,
 <wsa@kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@kernel.org>
Subject: Re: [PATCH] i2c: omap: fix IRQ storms
Message-ID: <20250227224738.6d7ebd8e@akair>
In-Reply-To: <20250227142055.ndzavzysaenoducj@murky>
References: <20250207185435.751878-1-andreas@kemnade.info>
	<c3bcusjbn23z5yd2a3xtm7swnfizkl7rb6ufhicdhn52epnjvb@5uqm3g6jcony>
	<20250220100745.05c0eff8@akair>
	<20250227142055.ndzavzysaenoducj@murky>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 27 Feb 2025 08:20:55 -0600
schrieb Nishanth Menon <nm@ti.com>:

> On 10:08-20250220, Andreas Kemnade wrote:
> > Am Wed, 19 Feb 2025 20:22:13 +0100
> > schrieb Andi Shyti <andi.shyti@kernel.org>:
> >  =20
> > > Hi,
> > >=20
> > > On Fri, Feb 07, 2025 at 07:54:35PM +0100, Andreas Kemnade wrote: =20
> > > > On the GTA04A5 writing a reset command to the gyroscope causes IRQ
> > > > storms because NACK IRQs are enabled and therefore triggered but not
> > > > acked.
> > > >=20
> > > > Sending a reset command to the gyroscope by
> > > > i2cset 1 0x69 0x14 0xb6
> > > > with an additional debug print in the ISR (not the thread) itself
> > > > causes
> > > >=20
> > > > [ 363.353515] i2c i2c-1: ioctl, cmd=3D0x720, arg=3D0xbe801b00
> > > > [ 363.359039] omap_i2c 48072000.i2c: addr: 0x0069, len: 2, flags: 0=
x0, stop: 1
> > > > [ 363.366180] omap_i2c 48072000.i2c: IRQ LL (ISR =3D 0x1110)
> > > > [ 363.371673] omap_i2c 48072000.i2c: IRQ (ISR =3D 0x0010)
> > > > [ 363.376892] omap_i2c 48072000.i2c: IRQ LL (ISR =3D 0x0102)
> > > > [ 363.382263] omap_i2c 48072000.i2c: IRQ LL (ISR =3D 0x0102)
> > > > [ 363.387664] omap_i2c 48072000.i2c: IRQ LL (ISR =3D 0x0102)
> > > > repeating till infinity
> > > > [...]
> > > > (0x2 =3D NACK, 0x100 =3D Bus free, which is not enabled)
> > > > Apparently no other IRQ bit gets set, so this stalls.
> > > >=20
> > > > Do not ignore enabled interrupts and make sure they are acked.
> > > > If the NACK IRQ is not needed, it should simply not enabled, but
> > > > according to the above log, caring about it is necessary unless
> > > > the Bus free IRQ is enabled and handled. The assumption that is
> > > > will always come with a ARDY IRQ, which was the idea behind
> > > > ignoring it, proves wrong.
> > > > It is true for simple reads from an unused address.
> > > >=20
> > > > So revert
> > > > commit c770657bd261 ("i2c: omap: Fix standard mode false ACK readin=
gs").
> > > >=20
> > > > The offending commit was used to reduce the false detections in
> > > > i2cdetect. i2cdetect warns for confusing the I2C bus, so having some
> > > > rare false detections (I have never seen such on my systems) is the
> > > > lesser devil than having basically the system hanging completely.
> > > >=20
> > > > No more details came to light in the corresponding email thread sin=
ce
> > > > several months:
> > > > https://lore.kernel.org/linux-omap/20230426194956.689756-1-reidt@ti=
.com/
> > > > so no better fix to solve both problems can be developed right now.=
   =20
> > >=20
> > > I need someone from TI or someone who can test to ack here.
> > >=20
> > > Can someone help?
> > > =20
> > The original (IMHO minor) problem which should be fixed by c770657bd261
> > is hard to test, I have never seen that on any system (and as a
> > platform maintainer have a bunch of them) I have access to.
> > There is not much description anywhere about the system in which the
> > original system occured, and no reaction since several months from the
> > author, so I do not see anything which can be done.
> > Maybe it was just faulty hardware.
> >=20
> > As said in the commit message, reverting it should be the lesser devil.
> > And that state was tested for many years. =20
>=20
> Can we not handle this slightly differently? leave the fix based on
> compatible? we know that the i2c controller changed over time. the
> i2cdetect bug fixed by c770657bd261 esp hard to find and fix.
>=20
looking a bit more deeper in:
Why do we have omap_i2c_isr at all? Can there any case that
stat & mask =3D=3D 0 there (without c770657bd261 applied)?

I looked at omap_i2c_xfer_data() and nothing interesting seems to
happen without other bits besides OMAP_I2C_STAT_NACK.=20
Looking again, things get interesting when that loop is left.

Maybe just acking NACK, setting cmd_err and return -EAGAIN if no other
bits are set. That should not cause changes to scenarios where NACK
comes with other bits set. Lets check whether that fixes the
mess I see here. Well, everything is better then having that IRQ going
mad.

For reference, the sensor involved was the BMG160. Because it is not
enabled in omap2plus_defconfig, the issue did not show up early.
=46rom my understanding, that there is a NACK after the reset command
data byte is sent. @Nikolaus: are there any nice and simple test points
for a scope?

Do you have any chance to test such a scenario on any device requiring
the c770657bd261 applied?

Regards,
Andreas

