Return-Path: <linux-i2c+bounces-13981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF52C392C2
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 06:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 690173B561A
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 05:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5BB2D876B;
	Thu,  6 Nov 2025 05:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="s1C6BXEr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7898A2D6E64;
	Thu,  6 Nov 2025 05:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762407281; cv=none; b=nvxwOW5qZnu2U0iOrL6cv1Vlo0KWTTxc1gY6MoivcTq2oInYKx6YNgFkC7aG8EyzpKyrqB2oalu7lEVIsiknF0qpn85Jaznl5sPnctkxHSxZiYEdXNkzSmO6gkQg9LLzqvXrW5zB5nFgk8C3WXqM8WV1ueBrqiJN2Eau/RTl3FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762407281; c=relaxed/simple;
	bh=zd+PmBIZBaaUuaEnv0alnOBIu2wIiccyM0pqoAtdJsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkBUFoRZQbm3Egt2IAyi4+HLJ6YTSvekzSAQ/EG4IFhg1AOu6ebbpP01Hk+YZNdZxzhx8gmxGXpsiywuyrTPyQ+W+yl3o8FXUI3Ybp7YzzqiADJySxApyG2jYscYQFL0W8op7y46sxSIKckOmV0l80tv/uNQKPpPwFw/Vfq8CH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=s1C6BXEr; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=acX4/obtZc57euus2wjyzRPxFvGCI3+UJzV/4FNBXzk=; b=s1C6BXEr5oJ1X/hOzOEhUfuaB5
	PBHVKBjGhz8gKMjiYNB+Dg48gQWnPEY4iLHhvBzl58ZOdSaNl/T+vH+MBHhl1h29a85uLcAq8wgPN
	D0mR1W/k5TRhk9GQ6ZldtCTZ5R4QhvnjCrD6NbBns+QugXZBaSGVOedo+WOfgsH9E3WXBw4qWTuS8
	ca0IrnP89cA5iyBcwp/DgbgDS5Z+nk4dOCEqE7xuP64UOBv1+F30XzP47X4pSkyxw+gektOryglGt
	wsXV576Lr9NCtkj2OlIriw3BmmHf5UJJquHQYSFjQB4N+XC3Pf9uCZwoelOZj2zpiVN2waRzyJAtP
	CDgTiJnA==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vGsdf-0000000B370-2CgX;
	Thu, 06 Nov 2025 06:34:27 +0100
Date: Thu, 6 Nov 2025 06:34:26 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: fix detect issue
Message-ID: <aQwzYrmv5TAIuqTh@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
 <aQvTMM0S16gOdiAN@aurel32.net>
 <12878F9DA586AA19+aQv0bKwLTzw_kJOq@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12878F9DA586AA19+aQv0bKwLTzw_kJOq@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

On 2025-11-06 09:05, Troy Mitchell wrote:
> On Wed, Nov 05, 2025 at 11:44:00PM +0100, Aurelien Jarno wrote:
> > Hi,
> > 
> > On 2025-11-03 15:06, Troy Mitchell wrote:
> [...]
> > >  	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
> > >  		spacemit_i2c_reset(i2c);
> > > -		return -EAGAIN;
> > > +		if (i2c->status & SPACEMIT_SR_ALD)
> > > +			return -EAGAIN;
> > >  	}
> > 
> > This makes the resulting code, while correct, complex to understand as 
> > it is now two really different errors, as you explained well in the 
> > commit message.
> > 
> > I therefore suggest to organize the code as:
> > 
> > 	/* Arbitration Loss Detected */
> > 	if (i2c->status & SPACEMIT_SR_ALD) {
> > 		spacemit_i2c_reset(i2c);
> > 		return -EAGAIN;
> > 	}
> > 
> > 	/* Bus Error No ACK/NAK */
> > 	if (i2c->status & SPACEMIT_SR_BED) {
> > 		spacemit_i2c_reset(i2c);
> > 	}
> Thanks. I'll fix it in the next version.
> > 
> > 
> > >  	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
> > > @@ -491,6 +492,8 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
> > >  
> > >  	spacemit_i2c_init(i2c);
> > >  
> > > +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > > +
> > 
> > This sounds good to start the transfer with a clean interrupt state. I 
> > just wonder if it should be moved to spacemit_i2c_init(), ie where the 
> > corresponding interrupts are enabled.
> Uh, We can move it actually. But is it essentail?

For me ensuring that the interrupt status is in a clean state after 
enabling the interrupt is part of the initialization. Furthermore if 
spacemit_i2c_init() has to be called from another place, it's very 
likely that it's also needed to get interrupt status in a clean state.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

