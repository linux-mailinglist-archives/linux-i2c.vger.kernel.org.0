Return-Path: <linux-i2c+bounces-9630-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58290A4827A
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 16:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4591C3A73D3
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 15:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2CB26A0D1;
	Thu, 27 Feb 2025 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="SZtVIS9f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766CA2309A1;
	Thu, 27 Feb 2025 15:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740668933; cv=none; b=J7/fXy9CbpYW7LTqIxmNkJgV6eVVn1mX+EEln05BMGgQpONQhf3KGWPUseLPNZTGfu8ksm5PfgyIpln7f6BA/NKfuP0d24K6ARqqv2XBL7TGneS4/e9MlaPTon5XEZMbn0AchkCuknI8/6GiA20qIt3MuoN2lbHys/ECEjDjh74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740668933; c=relaxed/simple;
	bh=iP8PUJPcmKZSxlJFtwXJuimP1kWAHvhZ3In9+uE2P58=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JJX/MVUttGhd4Dj/uQDN5ex/XubKc1RMX5aWzB5RJsf8O5OOFFTi/ARlhKPtvM3dWVzoGY1SCEzqEdqkaRGyYXgcC0CME4acS0IEztvgiSnlF1wGFFTplylfwCCrhdUtQy9frZwvGjTKl2AhFK/rZAScSwsCYsVboh2VCqgM4EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=SZtVIS9f; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=qfpFFmDtQTEvG1J6T0okYpBJq/PXy8yQO3Kv+Yj8Xuw=; b=SZtVIS9fo/x2BdfamBxOP4pV0a
	dLg6lC6/jOaZfl7jKBrGS1Keh9tfGqsYYjFqbrykxJ6KTbr3UsdAuf1Oo2TuQQsipSTgN5fLIcOkX
	WyArqkpr1Jw+Mh3aQz6DJT7Uqkw+chTm8F/nzUHH/RDGcD6r7YMaJTk00mysRoWc8fL6fPj/0oSY4
	2RvMRQJsBCrdxmgfyMBoP0YzmeFcZfR120EOT7KfeqWhZRCsM03qB+XNGr+dlaWqYOWhah1ZDYkA0
	C42TAOWeitfL7S2MMMm9PFvXVejd0rKJTPmGk0AhvNx6fWavqXyf+URB9OY/1g+bHFTe8NMOMh0UK
	njtuApAg==;
Date: Thu, 27 Feb 2025 16:08:40 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Nishanth Menon <nm@ti.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, <vigneshr@ti.com>,
 <aaro.koskinen@iki.fi>, <khilman@baylibre.com>, <rogerq@kernel.org>,
 <tony@atomide.com>, <jmkrzyszt@gmail.com>, <reidt@ti.com>,
 <wsa@kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@kernel.org>
Subject: Re: [PATCH] i2c: omap: fix IRQ storms
Message-ID: <20250227160840.086e48f0@akair>
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
Content-Transfer-Encoding: 7bit

Hi,

Am Thu, 27 Feb 2025 08:20:55 -0600
schrieb Nishanth Menon <nm@ti.com>:

> On 10:08-20250220, Andreas Kemnade wrote:
> > Am Wed, 19 Feb 2025 20:22:13 +0100
> > schrieb Andi Shyti <andi.shyti@kernel.org>:
> >   
> > > Hi,
> > > 
> > > On Fri, Feb 07, 2025 at 07:54:35PM +0100, Andreas Kemnade wrote:  
> > > > On the GTA04A5 writing a reset command to the gyroscope causes IRQ
> > > > storms because NACK IRQs are enabled and therefore triggered but not
> > > > acked.
> > > > 
> > > > Sending a reset command to the gyroscope by
> > > > i2cset 1 0x69 0x14 0xb6
> > > > with an additional debug print in the ISR (not the thread) itself
> > > > causes
> > > > 
> > > > [ 363.353515] i2c i2c-1: ioctl, cmd=0x720, arg=0xbe801b00
> > > > [ 363.359039] omap_i2c 48072000.i2c: addr: 0x0069, len: 2, flags: 0x0, stop: 1
> > > > [ 363.366180] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x1110)
> > > > [ 363.371673] omap_i2c 48072000.i2c: IRQ (ISR = 0x0010)
> > > > [ 363.376892] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> > > > [ 363.382263] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> > > > [ 363.387664] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> > > > repeating till infinity
> > > > [...]
> > > > (0x2 = NACK, 0x100 = Bus free, which is not enabled)
> > > > Apparently no other IRQ bit gets set, so this stalls.
> > > > 
> > > > Do not ignore enabled interrupts and make sure they are acked.
> > > > If the NACK IRQ is not needed, it should simply not enabled, but
> > > > according to the above log, caring about it is necessary unless
> > > > the Bus free IRQ is enabled and handled. The assumption that is
> > > > will always come with a ARDY IRQ, which was the idea behind
> > > > ignoring it, proves wrong.
> > > > It is true for simple reads from an unused address.
> > > > 
> > > > So revert
> > > > commit c770657bd261 ("i2c: omap: Fix standard mode false ACK readings").
> > > > 
> > > > The offending commit was used to reduce the false detections in
> > > > i2cdetect. i2cdetect warns for confusing the I2C bus, so having some
> > > > rare false detections (I have never seen such on my systems) is the
> > > > lesser devil than having basically the system hanging completely.
> > > > 
> > > > No more details came to light in the corresponding email thread since
> > > > several months:
> > > > https://lore.kernel.org/linux-omap/20230426194956.689756-1-reidt@ti.com/
> > > > so no better fix to solve both problems can be developed right now.    
> > > 
> > > I need someone from TI or someone who can test to ack here.
> > > 
> > > Can someone help?
> > >  
> > The original (IMHO minor) problem which should be fixed by c770657bd261
> > is hard to test, I have never seen that on any system (and as a
> > platform maintainer have a bunch of them) I have access to.
> > There is not much description anywhere about the system in which the
> > original system occured, and no reaction since several months from the
> > author, so I do not see anything which can be done.
> > Maybe it was just faulty hardware.
> > 
> > As said in the commit message, reverting it should be the lesser devil.
> > And that state was tested for many years.  
> 
> Can we not handle this slightly differently? leave the fix based on
> compatible? we know that the i2c controller changed over time. the
> i2cdetect bug fixed by c770657bd261 esp hard to find and fix.
> 
Yes, if there are nicer solutions, then I agree. But if there is a case
where NACK should be ignored, then we should either

a) not set it in OMAP_I2C_IE_REG

or 

b) do something more sophisticated in omap_i2c_isr_thread() to not do
nonsense in that case.

Even just not setting NACK in IE should improve things, so maybe the
i2c get stuck but no IRQ storms. Of course conditions to do such could
depend on compatible. I will investigate what you have sent me.

Regards,
Andreas

