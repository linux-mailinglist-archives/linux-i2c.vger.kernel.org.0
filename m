Return-Path: <linux-i2c+bounces-14008-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4852BC3D0B1
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 19:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 453BD3B8BD3
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 18:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF352DC328;
	Thu,  6 Nov 2025 18:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="ZZI0A6kl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4713719CCFC;
	Thu,  6 Nov 2025 18:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762453041; cv=none; b=A8YC/y84Z/2YZ4o/orsVthdraADm+lhGbMVasLtGUhTlRvLtpq01PC8y8zmPbvUjYYWToYWN5AdSmHbiCUcz8liM+kGDMpZjppre8ncQNMun5BoLn8g4aL9FqTPe+tgaonsZN46FwqKXj6Jv6AYlZNkS2sIKoyrm8CvlmsEWVfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762453041; c=relaxed/simple;
	bh=90/P2km+N/HE+yoO3nEDIaTfmdLy55aPIqUiyAKxzwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJuQDtcmwoQflegPmclmd8nZwE+hkVKVA/yS4ICafh0sf2cv2WkrbquGXMFbz/QpxuO6ZuSpESXN69pnNS15xhGkSJwzisAOr199j8CBcXMogVQG4wPQaokpEkLzFGgU8BiPHvVwfff8/AdxQQZD52m3PDqAft7ZpgGt3nJBRK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=ZZI0A6kl; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=yhLVE3WqZbAmQWYaSUimEUdVgYXmhd0JHFmuEZay51c=; b=ZZI0A6klrxnPS3iH/iWsrA5fcU
	7l9gA6gmjDcNasJU8yz9uC8yg3bNDHlddwR9KeRWYBkOHZFsgjB2F6vkuozYVfP3E2j/QxiP8RV0L
	VvWn7mNNC5q0Q48cV7SG9Wdgv4iZyKm/vWu6hl6NUggsGGEBjdi3uc7YcaOCkDeQCxccgiCvL13aT
	lfAiWCGeNayXGM6a3TDKTLReKWlMDJteGbcDGV5mCwlKAc90pFRbItc25Opub21yAbfK4aL9F4wLH
	p85GWTscZzTmZwIlv6jvGSfuLyokHbF1HhzSA1NWnm3aTviYwSGhZasg1wF5mCMvr5uQrVYPLLxqC
	xxx0aEhg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vH4Xc-0000000BmAz-2u8W;
	Thu, 06 Nov 2025 19:17:00 +0100
Date: Thu, 6 Nov 2025 19:17:00 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: fix detect issue
Message-ID: <aQzmHB2FaPFS4qwj@aurel32.net>
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
 <aQwzYrmv5TAIuqTh@aurel32.net>
 <0E2B2679F0650AE1+aQw0VgKNbcFqDH33@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0E2B2679F0650AE1+aQw0VgKNbcFqDH33@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

On 2025-11-06 13:38, Troy Mitchell wrote:
> On Thu, Nov 06, 2025 at 06:34:26AM +0100, Aurelien Jarno wrote:
> > Hi,
> >=20
> > On 2025-11-06 09:05, Troy Mitchell wrote:
> > > On Wed, Nov 05, 2025 at 11:44:00PM +0100, Aurelien Jarno wrote:
> > > > Hi,
> > > >=20
> > > > On 2025-11-03 15:06, Troy Mitchell wrote:
> > > [...]
> > > > >  	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
> > > > >  		spacemit_i2c_reset(i2c);
> > > > > -		return -EAGAIN;
> > > > > +		if (i2c->status & SPACEMIT_SR_ALD)
> > > > > +			return -EAGAIN;
> > > > >  	}
> > > >=20
> > > > This makes the resulting code, while correct, complex to understand=
 as=20
> > > > it is now two really different errors, as you explained well in the=
=20
> > > > commit message.
> > > >=20
> > > > I therefore suggest to organize the code as:
> > > >=20
> > > > 	/* Arbitration Loss Detected */
> > > > 	if (i2c->status & SPACEMIT_SR_ALD) {
> > > > 		spacemit_i2c_reset(i2c);
> > > > 		return -EAGAIN;
> > > > 	}
> > > >=20
> > > > 	/* Bus Error No ACK/NAK */
> > > > 	if (i2c->status & SPACEMIT_SR_BED) {
> > > > 		spacemit_i2c_reset(i2c);
> > > > 	}
> > > Thanks. I'll fix it in the next version.
> > > >=20
> > > >=20
> > > > >  	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
> > > > > @@ -491,6 +492,8 @@ static int spacemit_i2c_xfer(struct i2c_adapt=
er *adapt, struct i2c_msg *msgs, in
> > > > > =20
> > > > >  	spacemit_i2c_init(i2c);
> > > > > =20
> > > > > +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK=
);
> > > > > +
> > > >=20
> > > > This sounds good to start the transfer with a clean interrupt state=
=2E I=20
> > > > just wonder if it should be moved to spacemit_i2c_init(), ie where =
the=20
> > > > corresponding interrupts are enabled.
> > > Uh, We can move it actually. But is it essentail?
> >=20
> > For me ensuring that the interrupt status is in a clean state after=20
> > enabling the interrupt is part of the initialization.
> Yes, I agree that.
> > Furthermore if=20
> > spacemit_i2c_init() has to be called from another place, it's very=20
> > likely that it's also needed to get interrupt status in a clean state.
> Why we need to call init() in other place?
> Could you give me a cese?

Currently there is no need to do that. However if the driver is extended=20
(e.g. to add new features) and spacemit_i2c_init() needs to be called=20
=66rom another place, it is likely that a reset of the interrupt status=20
should also be included. Therefore it's better to just include it=20
directly in spacemit_i2c_init().

Regards
Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

