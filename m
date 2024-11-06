Return-Path: <linux-i2c+bounces-7824-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A2C9BE25A
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 10:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EC61287EA4
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 09:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27491D9341;
	Wed,  6 Nov 2024 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="WO9N43Ha"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A131D9339;
	Wed,  6 Nov 2024 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730885037; cv=none; b=JFS5LK7Z+mQOF0pD+B7+s3hB50XXohPEAQ2cnYkjrv8D5m4cQI9qpzC52Vb3ATz/r+3BGnaT0+Qepj0Vjiojwg9AdJkRg8xwFhe+nnf4fDK0aFlIRFLNaFCFW+04C/ZO4SsDraUgSuBxlGfTMo7yS3+SL1eA7+D7g0nLz+80fnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730885037; c=relaxed/simple;
	bh=05NiNYkzern77O2dzcorGVgTTuDosIz2qvsbEWhI1Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sEcAvtCuBiyBEpzhUiKoQ5m+4Je1RZjFkubKZ61amwFKeMW9gT7UFJqj6Jn+hgJhP0xWsItHYkD4Z7neqKjdAteuVOmvTA2IgaGCtgA9LsoPDVT7FxkFHuAAoTIwDOyke/nKXMpUn0aYopYpFzv7dr2RTeGK0CEf5IxmSmUJ6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=WO9N43Ha; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+C9y87arjknzfpBLjJ93cRQXmOcS1EWBKhC9mjNn3MM=; b=WO9N43HawEheQieAKYzN7m2qAl
	c0/jBL1DlT2dLtS1K0PADrP3tXJp6yLkw/G1FSjE9jD/TDOzj/y8Y/65I6LbRQD/HyEn5GJekIXtx
	+roFlLGkI8GUGdpZ/v+MnNlLmA/mSXig6LyJeLYj7AH263VOjpT/etAHc3yMyFC1/ez4JpJh3sPUj
	9vSCdKfzoj7t+WlcR6uCdrFQk3v/aPlhcIokxdv3rDLOxVRf7DIxH1ruyWpx8KOKxoG40+INxnSHN
	YmHR1tTZ+hsbXjz5ZUkEdIsXedXnaNKP78x+49HDm+NmcR4qynXv7Rq2+zKdKzk9N9SkrSbB0cPi6
	9lJ04Kpw==;
Date: Wed, 6 Nov 2024 10:23:42 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Reid Tonking <reidt@ti.com>, Tony Lindgren <tony@atomide.com>,
 "Raghavendra, Vignesh" <vigneshr@ti.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-i2c@vger.kernel.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: omap: Fix standard mode false ACK readings
Message-ID: <20241106102342.393abe25@akair>
In-Reply-To: <664241E0-8D6B-4783-997B-2D8510ADAEA3@goldelico.com>
References: <20230426194956.689756-1-reidt@ti.com>
	<445b3cbf-ffbc-6f77-47db-c30fc599e88f@ti.com>
	<20230428074330.GJ14287@atomide.com>
	<20230428183037.wbhds54dz5l4v5xa@reidt-t5600.dhcp.ti.com>
	<664241E0-8D6B-4783-997B-2D8510ADAEA3@goldelico.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 11 Sep 2024 11:40:04 +0200
schrieb "H. Nikolaus Schaller" <hns@goldelico.com>:

> Hi,
> 
> > Am 28.04.2023 um 20:30 schrieb Reid Tonking <reidt@ti.com>:
> > 
> > On 10:43-20230428, Tony Lindgren wrote:  
> >> * Raghavendra, Vignesh <vigneshr@ti.com> [230427 13:18]:  
> >>> On 4/27/2023 1:19 AM, Reid Tonking wrote:  
> >>>> Using standard mode, rare false ACK responses were appearing with
> >>>> i2cdetect tool. This was happening due to NACK interrupt
> >>>> triggering ISR thread before register access interrupt was
> >>>> ready. Removing the NACK interrupt's ability to trigger ISR
> >>>> thread lets register access ready interrupt do this instead.  
> >> 
> >> So is it safe to leave NACK interrupt unhandled until we get the
> >> next interrupt, does the ARDY always trigger after hitting this?
> >> 
> >> Regards,
> >> 
> >> Tony  
> > 
> > Yep, the ARDY always gets set after a new command when register
> > access is ready so there's no need for NACK interrupt to control
> > this.  
> 
> I have tested one GTA04A5 board where this patch breaks boot on
> v4.19.283 or v6.11-rc7 (where it was inherited from some earlier -rc
> series).
> 
> The device is either stuck with no signs of activity or reports RCU
> stalls after a 20 second pause.
> 
Reproduced some problem here:
i2cset 1 0x69 0x14 0xb6 (reset command for gyro BMG160)
[  736.136108] omap_i2c 48072000.i2c: addr: 0x0069, len: 2, flags: 0x0,
stop: 1
[  736.136322] omap_i2c 48072000.i2c: IRQ (ISR = 0x0010)
either with this patch applied:
... system mostly hangs, i2cset does not return.
with it reverted:
... most times I see after this:
[  736.136505] omap_i2c 48072000.i2c: IRQ (ISR = 0x0002)
and i2cset says:
i2cset: write failed: Remote I/O error

... sometimes:
omap_i2c 48072000.i2c: IRQ (ISR = 0x0004)
and i2cset is successful.

Other register writes seem to work reliably, just the reset command.
I had tested with bmg driver disabled earlier,
so it did not come to light.

Regards,
Andreas

