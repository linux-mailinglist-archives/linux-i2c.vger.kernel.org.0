Return-Path: <linux-i2c+bounces-9802-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 883BFA5DB80
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 12:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8704A179AEF
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 11:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D7323F372;
	Wed, 12 Mar 2025 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKhzzP19"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC5323F294;
	Wed, 12 Mar 2025 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741778802; cv=none; b=JdCe7K2F4uYJREOy+8hfWkwYQlF8r14o2fic6jtN3xg4Vkuk85ZmRQDFP3N2UneJTRMTJ/7l9IzH7S+pEgt9KoYLyBnciBxOZ9KUsHksKPta1SNBK4flP06LCH0mABnNaRWlmMhg8IcBrNz73W8Zo0jEKNW3hKQ3QqmremQZNJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741778802; c=relaxed/simple;
	bh=tMLPpUCCR4aZ3XPZ5Gtf2u8Rq7BEMXY6q2dZbELeGBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYdD17tXx0zB2pErqPSgItWawpuLeciZiU6YJFJSad/2iR07WJTTba3Bv/JBHxlCWrEGUdTmxNWUoyOLBEq5t9fXRTaHpuwb98O3q6cOzOeQ1TDQXzdg77P3Wlj9cdnRrWsLhJ8FAFlsC4xzMWo1x/MO5/PNB14Qpos0XhK+kLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKhzzP19; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91AAEC4CEEC;
	Wed, 12 Mar 2025 11:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778801;
	bh=tMLPpUCCR4aZ3XPZ5Gtf2u8Rq7BEMXY6q2dZbELeGBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKhzzP19rJVZYx+nE87i4ijtjOfZEl+/FP+yIeXauMUIOwtVyNduf1FsQgq5Bt6Yt
	 FrJ4MfpVsaGp8yap7hlnm9ybWm+zNJG+HkE6NbvV0djzCBXa0xykLM53udQ6J8WgWZ
	 4hj4Pq61fBJXVFBnMBOGOr/QdS/bXOxRoRls5Q6Crm91TfmFyyueUx4RrYw/JEco77
	 DJdDISbFl124gEOno9hAJhG5gcxd0Zv9nRugJjessFokiZBatteIzbRoYtDyUAUX9z
	 DA7Mr3p9XhGypHQ3KiIphodzaibUM63Z/qxRNUfPhwh0PRbf20o4FKEMc4Fm+d2zs5
	 AHb7PwIn7KFiA==
Date: Wed, 12 Mar 2025 12:26:30 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Aniket Limaye <a-limaye@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Andreas Kemnade <andreas@kemnade.info>, 
	vigneshr@ti.com, aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org, 
	tony@atomide.com, jmkrzyszt@gmail.com, reidt@ti.com, wsa@kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@kernel.org
Subject: Re: [PATCH v2] i2c: omap: fix IRQ storms
Message-ID: <k6rzimh2l72xpwpjecrmuqbmfv7pgzpp5uxysqdwvhwhakq4hu@pewez7dbb3mn>
References: <20250228140420.379498-1-andreas@kemnade.info>
 <20250311123947.jce4i5heeufzwmji@serotonin>
 <t43j7wmwsqvs5f6utld72enobqwkendgtpzfu3mth3bdgpxhsh@qeok5d2ujdm2>
 <91b9752c-38e9-453d-90cb-3466e18a15b6@ti.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91b9752c-38e9-453d-90cb-3466e18a15b6@ti.com>

Hi Aniket,

On Wed, Mar 12, 2025 at 02:55:38PM +0530, Aniket Limaye wrote:
> On 12/03/25 03:55, Andi Shyti wrote:
> > On Tue, Mar 11, 2025 at 07:39:47AM -0500, Nishanth Menon wrote:
> > > On 15:04-20250228, Andreas Kemnade wrote:
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
> > > > To still avoid the i2cdetect trouble which is the reason for
> > > > commit c770657bd261 ("i2c: omap: Fix standard mode false ACK readings"),
> > > > avoid doing much about NACK in omap_i2c_xfer_data() which is used
> > > > by both IRQ mode and polling mode, so also the false detection fix
> > > > is extended to polling usage and IRQ storms are avoided.
> > > > 
> > > > By changing this, the hardirq handler is not needed anymore to filter
> > > > stuff.
> > > > 
> > > > The mentioned gyro reset now just causes a -ETIMEDOUT instead of
> > > > hanging the system.
> > > > 
> > > > Fixes: c770657bd261 ("i2c: omap: Fix standard mode false ACK readings").
> > > > CC: <stable@kernel.org>
> > > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > > ---
> > > > This needs at least to be tested on systems where false acks were
> > > > detected.
> > > 
> > > At least on BeaglePlay, I have not been able to reproduce the original
> > > bug which was the trigger for commit c770657bd261
> > > 
> > > I also ran basic boot tests on other K3 platforms and none seem to show
> > > regressions at the very least.
> > > 
> > > Tested-by: Nishanth Menon <nm@ti.com>
> > 
> > Thanks for testing it! I asked some OMAP folks to check this
> > patch, but no one took action. With Nishanth's test, I can now
> > sleep soundly. :-)
> > 
> > Merged to i2c/i2c-host-fixes.
> > 
> > Thanks,
> > Andi
> > 
> 
> I see that the patch got merged so don't know if this is useful at all at
> this point, but yeah looks good to me. Apologies for the slow response.
> Nishanth, Thanks for testing it too!
> 
> Reviewed-by: Aniket Limaye <a-limaye@ti.com>

thanks for your review, I added it.

Andi

