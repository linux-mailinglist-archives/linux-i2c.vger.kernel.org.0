Return-Path: <linux-i2c+bounces-14837-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1F0CE6FE8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 15:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D280730141D2
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 14:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DAB1F5F6;
	Mon, 29 Dec 2025 14:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="ggtQLHr3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C305731A541;
	Mon, 29 Dec 2025 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767017905; cv=none; b=C6OsTkzCMEBHPKv5/yMyByZ1Y5kaHBKEp9H0qCc9Y9gHYQSU/0VP4MLvOpWTJW4FzWXx04DTvoSsNj+MDrVcWLhdjB5YmOYu7nMXCZx7dRCGMeXGfxiQ1qroM8uXH5Ax6iBm+44CRI3qHsTH5Hbc387dJcAmOg7yQ1d2hi1yC10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767017905; c=relaxed/simple;
	bh=sHa74C3EZvtRNavJonl1DYH5tcnImsFm6z624JXG9Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaFq18rzgZaw6WXp+Slt1B7O69DOMf8SBRNcxIzoEc3DUooJaYtUOd8JIGadQ3/TiF2TLBvp03X4iKiL6R7lZ9RDGduB7dLEodkQ1cLu7XQPOEqhPOML7W9vo6r9isFWkwQ/bEQALAiYWeiP+1Jxmy07vXF2hnaNydFbI3NsfIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=ggtQLHr3; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=xX1Wx+X0ubY/b0ellvNUrpD4D9Hg7TMLd6W83ThtCz4=; b=ggtQLHr33ZOQz8YlJhjK/yNRDX
	pQvy/m1tP3q/9UW+xzfEeS5mGhpisIbPUIgnGEfInpduoetS19YkyyNSl6OOdoxK6KLMD1WaNubJM
	UPyF9GrSpxsbatRk0Lu8/u4KvYEalB/sKNjd4u5B1ISocW0l3+Lq1nmJMlEAQCr5huLmHngyEOCgC
	dyPv0YE/3hJwIrL5CEeWrVQ5fbpK6kiwGpATHuEwHoYKZosWDI56K0wJXESuGKF4HsnANcq6jw84B
	wu7QmmTVsOAGchIypX2pBjmJ0+PE0ekqzhISGeIM5/8+gtN5STFMkWqSah94uLI60XEqRkY3Y8o2Y
	7D6XXY2w==;
Received: from [2a01:e34:ec5d:a742:6075:34ff:c68a:2cc7] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vaDhV-00000003In1-3IyK;
	Mon, 29 Dec 2025 14:54:21 +0100
Date: Mon, 29 Dec 2025 14:54:20 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 2/2] i2c: spacemit: introduce pio for k1
Message-ID: <aVKIDOj6x_BYEttg@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com>
 <86c5e338-e630-4933-a123-cfa1201495ed@riscstar.com>
 <6D29D0765AB5632A+aVHiZ9Wph0hNzqDY@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6D29D0765AB5632A+aVHiZ9Wph0hNzqDY@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

On 2025-12-29 10:07, Troy Mitchell wrote:
> > > @@ -474,6 +608,11 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
> > >   	unsigned long timeout;
> > >   	int idx = 0, cnt = 0;
> > > +	if (i2c->use_pio) {
> > > +		i2c->adapt.timeout = msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT);
> > 
> > Again, why is a rough 1000 millisecond timeout OK for PIO, while a
> > fairly precise timeout value based on the number of bytes to be
> > transferred and the transfer bit rate computed for interrupt mode?
> Sorry I didn't see this.
> 
> In interrupt-driven mode we wait for a single completion event, so the
> timeout needs to reflect the worst-case transfer duration to avoid
> spurious timeouts.
> In PIO mode the loop is driven by FIFO/status progress, and the timeout
> is only a safeguard against a stalled bus rather than an exact transfer
> time.
> Therefore a simple conservative value is sufficient there.

I do think the PIO code is correct wrt timeout. It is not possible to 
predict the time of a transaction as an I2C peripheral can slow down a 
transaction by pulling the SCL line down. Therefore a fixed timeout 
should be used in all cases not only for PIO, and this matches what is 
done in all other I2C drivers.

That said it's probably out of scope for this patch series.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

