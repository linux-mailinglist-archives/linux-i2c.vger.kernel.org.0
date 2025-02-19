Return-Path: <linux-i2c+bounces-9500-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D18A3C87E
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 20:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5CB57A770A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 19:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB17122ACEF;
	Wed, 19 Feb 2025 19:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VC0GJR/z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9F722ACC5;
	Wed, 19 Feb 2025 19:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739992939; cv=none; b=iSvs4D3df/MAf4BjJENFs3to5VOGiBJAfcgbg2d3NAjA1lD8tTBwBMz3uyGETIGIqt1nJMVUUnjM1s5p1nVGAbBT4QWBLGaQbYQRuWAnHsMH0OS9U/D8Yz/k7xCxr5NKNIAX5VGlMLUDoggZ517rt9xpPK+SDGtDfjo6VWMDDKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739992939; c=relaxed/simple;
	bh=La6YpO1quzw/PLTrDv6KYWGSnd+rPhsxECccWv9nqa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqAOPv49fPT7lwCAxBluKXWSXk3z5sjbH49adVGWOjp8gUqE+B+E5qn2dtG/SR+E4XITukBVf7pCNj8bJ7U3BkSMsHCsHM3YglFSUrMhsJU4XcSvR4ZLzR5eg9Vs3kA7Ta+CC5/A+liSSTt0yPO1TQlA4cKDqnwD2xHRRO7ryj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VC0GJR/z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EBBC4CED1;
	Wed, 19 Feb 2025 19:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739992938;
	bh=La6YpO1quzw/PLTrDv6KYWGSnd+rPhsxECccWv9nqa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VC0GJR/zH6HKyhpw5vHIdKm9LjePcxjRFfYB8b2TcZtQ95FVen8g0jWPJl3JTQ7FA
	 Ikn8we5oMtT3QPFO5Bv4omRt/830AofvaCk1t20WKvkjoiSKkY+WWaQxt49kXP630D
	 6dSln/zLQqd9tk/jnGSdUhBWXgpege5XIJe2Gho3eBACar6mv989kLx0mog3MOGU3N
	 Qkbs5jZLYvcMqeZlL9FVCl2//CJgN3zTFR+NyOQv9zTLu6vqDeandpdB55nMZgmMyH
	 7zM/3dX1epcTJmzjY4m+Oz30HFNBfe/9MRxjWfpoQVfsxNboP4lavzKXasMEbv2RBG
	 UXPwMAA62QpZw==
Date: Wed, 19 Feb 2025 20:22:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: vigneshr@ti.com, aaro.koskinen@iki.fi, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, jmkrzyszt@gmail.com, reidt@ti.com, 
	wsa@kernel.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] i2c: omap: fix IRQ storms
Message-ID: <c3bcusjbn23z5yd2a3xtm7swnfizkl7rb6ufhicdhn52epnjvb@5uqm3g6jcony>
References: <20250207185435.751878-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207185435.751878-1-andreas@kemnade.info>

Hi,

On Fri, Feb 07, 2025 at 07:54:35PM +0100, Andreas Kemnade wrote:
> On the GTA04A5 writing a reset command to the gyroscope causes IRQ
> storms because NACK IRQs are enabled and therefore triggered but not
> acked.
> 
> Sending a reset command to the gyroscope by
> i2cset 1 0x69 0x14 0xb6
> with an additional debug print in the ISR (not the thread) itself
> causes
> 
> [ 363.353515] i2c i2c-1: ioctl, cmd=0x720, arg=0xbe801b00
> [ 363.359039] omap_i2c 48072000.i2c: addr: 0x0069, len: 2, flags: 0x0, stop: 1
> [ 363.366180] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x1110)
> [ 363.371673] omap_i2c 48072000.i2c: IRQ (ISR = 0x0010)
> [ 363.376892] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> [ 363.382263] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> [ 363.387664] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> repeating till infinity
> [...]
> (0x2 = NACK, 0x100 = Bus free, which is not enabled)
> Apparently no other IRQ bit gets set, so this stalls.
> 
> Do not ignore enabled interrupts and make sure they are acked.
> If the NACK IRQ is not needed, it should simply not enabled, but
> according to the above log, caring about it is necessary unless
> the Bus free IRQ is enabled and handled. The assumption that is
> will always come with a ARDY IRQ, which was the idea behind
> ignoring it, proves wrong.
> It is true for simple reads from an unused address.
> 
> So revert
> commit c770657bd261 ("i2c: omap: Fix standard mode false ACK readings").
> 
> The offending commit was used to reduce the false detections in
> i2cdetect. i2cdetect warns for confusing the I2C bus, so having some
> rare false detections (I have never seen such on my systems) is the
> lesser devil than having basically the system hanging completely.
> 
> No more details came to light in the corresponding email thread since
> several months:
> https://lore.kernel.org/linux-omap/20230426194956.689756-1-reidt@ti.com/
> so no better fix to solve both problems can be developed right now.

I need someone from TI or someone who can test to ack here.

Can someone help?

Thanks,
Andi

