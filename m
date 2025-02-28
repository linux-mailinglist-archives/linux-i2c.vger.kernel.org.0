Return-Path: <linux-i2c+bounces-9639-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD181A496D9
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 11:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FC407A82DA
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 10:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F1E25DCEB;
	Fri, 28 Feb 2025 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="XxojHIRP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8DC25DAF4;
	Fri, 28 Feb 2025 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740737840; cv=none; b=GVqBvwoIARoKLFFVsuIPZobYabjwJ80JSWab7IdfBS5KkJcaW7IpKQ0jj+ECqApUCmt8w6Guk/wzix3Jhb5TK85AYzzG+rP3aqfTcMVgbpl5WtHBV+tCkoqpKsKFCuwJ/6SxLk4gd+3+9TaiTxjecG8Ie0v2MAly6xZo9EWPcGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740737840; c=relaxed/simple;
	bh=fvbjrF3RFlitvr8uzEvx8ow4b31xsSTWcr8kpA4lx3A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b89lqAkLb/x7dIWuaB+NXP9pjUrhEE54634UfU+gGKwCKcXvRG6SN941YatvWP68WMfzQUoQwCQiRmmkxuZTL9X/zsoihBaVYlkOIEM8UjRgzli+BhyKhETsVxMRFgGrjNpRe/+p00219xc2nHDkOmvBfJTsQc2BcmQpd7rqYNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=XxojHIRP; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XM4FcO+7xezO5MBIOl4ah63+MR0NMozspQG+f2a2VZA=; b=XxojHIRPnmi/KnLTCn0pg9t8SF
	435H+hao7/hsBjESMMsyzO52ehDz2U3BVZ7A2ss0o0DTAizrK/ksE+rjA03qdwmFe9y/E57r3KIXt
	uncVANUBjTFZwy57BdErslKvidMkDf3ufAYGxBGm7V2Ygdl39DZZ1uc3xWt98keyYoETq9iWJMBCu
	evGzAFalO1QN5Z2dv2L/ynJmE0RNg2k4Cot5mvee8Z4Gu1UvfUEbJSfFVwqVDrJUOroxeWAH9Sml9
	XQup9aiE7vGTehfEJ3/V4bdRd3VM4MUlzJiBwMUy6BytytQhv6kdPM6Mu1dlCPy0t+uOyLhzBGzhX
	bdTN0yJQ==;
Date: Fri, 28 Feb 2025 11:17:07 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Nishanth Menon <nm@ti.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, <vigneshr@ti.com>,
 <aaro.koskinen@iki.fi>, <khilman@baylibre.com>, <rogerq@kernel.org>,
 <tony@atomide.com>, <jmkrzyszt@gmail.com>, <reidt@ti.com>,
 <wsa@kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@kernel.org>
Subject: Re: [PATCH] i2c: omap: fix IRQ storms
Message-ID: <20250228111707.6bf2b992@akair>
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
Looking again more deeply, I do not understand how c770657bd261
should reliably prevent doing stuff without ARDY:
omap_i2c_xfer_data() is called as a reaction the the IRQ but also in
a polling loop. So it must deal with situations were only NACK is set
there.
So just disabling the IRQ cannot help. If that is just tested via
i2cdetect, the polling mode is not tested.

Regards,
Andreas

