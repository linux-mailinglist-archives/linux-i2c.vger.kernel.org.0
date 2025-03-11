Return-Path: <linux-i2c+bounces-9788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2631FA5D281
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 23:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D3557AA52E
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 22:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18F1264FB3;
	Tue, 11 Mar 2025 22:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvizajpk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64652229B18;
	Tue, 11 Mar 2025 22:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741731962; cv=none; b=SrFYTZ6mi7GsA8R4vQ4lQpNgMaMwYBEEyWXsH7KnQhO8cOcnWvPDcmDcqx+mb9wZQvu7ArlC5l9JUyTOCYoFowm3ZxDyd01qbI9OgdeO38Z1YxtssuI1dS2RnlLakfkwjYAG+nuVKt9dJnMRusGuRUoNmZSpPXuTdWLEzJLbhuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741731962; c=relaxed/simple;
	bh=Alj+56UiSeF6BBH3b7zGYm5FSbwhWwKw/aZtV+05RyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOkHAlaE4h20GseyaVmKUXVRENnK5tQS6wxyS+LROkqL+pwwHrSWQH05D1L4JCzvFjjehHs3o0bNkzymB9qSNpsB3s/NG1IIWLsByUk+F/S+ue1uiLV+vkMplbGnz0noq261KAU8DkjTHKLVY9UHNLeB0A3vk3OgPCMQPpvumlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvizajpk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1531AC4CEEA;
	Tue, 11 Mar 2025 22:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741731961;
	bh=Alj+56UiSeF6BBH3b7zGYm5FSbwhWwKw/aZtV+05RyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dvizajpkBggKTnFqNwp5b3ZLA0XJfYGT0cfrMBs+LvWypY9GljOA/6dKx69z84HRx
	 GlKJPm3JTX5YvJdBFoG9IKElx2ns/muz71GB+GPNHL/fXMy0oWVoLwvJXWrpJ1faWe
	 t1VQthkYu43HPce+9bKIYJ+ziGphN19K8D5fVZEDR2488GO1jLQshBdizB2sjmZF9F
	 qOft1Izwp1bPC26Vz2E/DFseqFty9q7Qn1iKyIkxwM5mLoJJB3OHlPcoYUWuWc5osk
	 xPRxg8xQTgEyIJROllTXS+CyPRWCYbz8gIldK9r/b7pcgJSKqrrsHIZqcrYaDXm1VC
	 HCiIej/p0fQoQ==
Date: Tue, 11 Mar 2025 23:25:48 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Nishanth Menon <nm@ti.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, vigneshr@ti.com, 
	aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, 
	jmkrzyszt@gmail.com, reidt@ti.com, wsa@kernel.org, linux-omap@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2] i2c: omap: fix IRQ storms
Message-ID: <t43j7wmwsqvs5f6utld72enobqwkendgtpzfu3mth3bdgpxhsh@qeok5d2ujdm2>
References: <20250228140420.379498-1-andreas@kemnade.info>
 <20250311123947.jce4i5heeufzwmji@serotonin>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311123947.jce4i5heeufzwmji@serotonin>

Hi,

On Tue, Mar 11, 2025 at 07:39:47AM -0500, Nishanth Menon wrote:
> On 15:04-20250228, Andreas Kemnade wrote:
> > On the GTA04A5 writing a reset command to the gyroscope causes IRQ
> > storms because NACK IRQs are enabled and therefore triggered but not
> > acked.
> > 
> > Sending a reset command to the gyroscope by
> > i2cset 1 0x69 0x14 0xb6
> > with an additional debug print in the ISR (not the thread) itself
> > causes
> > 
> > [ 363.353515] i2c i2c-1: ioctl, cmd=0x720, arg=0xbe801b00
> > [ 363.359039] omap_i2c 48072000.i2c: addr: 0x0069, len: 2, flags: 0x0, stop: 1
> > [ 363.366180] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x1110)
> > [ 363.371673] omap_i2c 48072000.i2c: IRQ (ISR = 0x0010)
> > [ 363.376892] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> > [ 363.382263] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> > [ 363.387664] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> > repeating till infinity
> > [...]
> > (0x2 = NACK, 0x100 = Bus free, which is not enabled)
> > Apparently no other IRQ bit gets set, so this stalls.
> > 
> > Do not ignore enabled interrupts and make sure they are acked.
> > If the NACK IRQ is not needed, it should simply not enabled, but
> > according to the above log, caring about it is necessary unless
> > the Bus free IRQ is enabled and handled. The assumption that is
> > will always come with a ARDY IRQ, which was the idea behind
> > ignoring it, proves wrong.
> > It is true for simple reads from an unused address.
> > 
> > To still avoid the i2cdetect trouble which is the reason for
> > commit c770657bd261 ("i2c: omap: Fix standard mode false ACK readings"),
> > avoid doing much about NACK in omap_i2c_xfer_data() which is used
> > by both IRQ mode and polling mode, so also the false detection fix
> > is extended to polling usage and IRQ storms are avoided.
> > 
> > By changing this, the hardirq handler is not needed anymore to filter
> > stuff.
> > 
> > The mentioned gyro reset now just causes a -ETIMEDOUT instead of
> > hanging the system.
> > 
> > Fixes: c770657bd261 ("i2c: omap: Fix standard mode false ACK readings").
> > CC: <stable@kernel.org>
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> > This needs at least to be tested on systems where false acks were
> > detected.
> 
> At least on BeaglePlay, I have not been able to reproduce the original
> bug which was the trigger for commit c770657bd261
> 
> I also ran basic boot tests on other K3 platforms and none seem to show
> regressions at the very least.
> 
> Tested-by: Nishanth Menon <nm@ti.com>

Thanks for testing it! I asked some OMAP folks to check this
patch, but no one took action. With Nishanth's test, I can now
sleep soundly. :-)

Merged to i2c/i2c-host-fixes.

Thanks,
Andi

