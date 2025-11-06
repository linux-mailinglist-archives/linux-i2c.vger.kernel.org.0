Return-Path: <linux-i2c+bounces-13982-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A845AC392DD
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 06:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 103113B97D3
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 05:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4E32D949F;
	Thu,  6 Nov 2025 05:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="QtcLfTc/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB02E2D5A07;
	Thu,  6 Nov 2025 05:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762407604; cv=none; b=KQLwXNL36sI1tTqkIOG7VzwL5eKjn+kNX9A5RDgBeJbUHijzNTACBNulqV0OHtqqcPFBQXYFw1GYkdA8Lhfvz6Ucf9AYUwQTrfweEFX3lRdTMV+u2MUmFO6qaFk8DpjlfG0v0qzVL2rMqDsy9xn4iL/bgCiGdMFXSZbnn0PzRuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762407604; c=relaxed/simple;
	bh=I9IGPVE+YBI/dRlj6+eZuJWgl/DvSxlpz5FiBKVomuM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXALPhqSXmWPZ6Z1/FyNf7ZbT09vJOzBkn/aBSHS4V+CFw7juWEjBd7tYw26BGpApf6eI4mLzsl4lrc7cOGNGponP5X+RCuaErNov7fYfebADmQXoISwch7scSSCOhouucNfTMv5iA3RUDm2DNnNaFvYtPgkn19gTIEsYwGXDOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=QtcLfTc/; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762407514;
	bh=P1Rz7vX4LUWb0KmLFM3Q/aK5/FfNA1LnBQcP6+5neyY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=QtcLfTc/E1qrc5LEdEIAjAU1o6kjEqxYhbxTDsnXEiAHd2/HTs+bUf6Xi2PBXywbw
	 lC+r5MKSRuBozC9alCktQ6v+eMxiHFdAb77XhPhUxDyRQe5SWNZipstuHBu46izRVZ
	 UMQ98xrvckxrNT52sD5Jf2pmFGbJd/LgM5SaRmOY=
X-QQ-mid: zesmtpgz7t1762407512t3ee89d79
X-QQ-Originating-IP: 3VST9Ej0v63tRCSDrHmfzPvPOG/iqybQz5oibi7AIA8=
Received: from = ( [183.48.244.176])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 13:38:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8810434806403676206
EX-QQ-RecipientCnt: 10
Date: Thu, 6 Nov 2025 13:38:30 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: fix detect issue
Message-ID: <0E2B2679F0650AE1+aQw0VgKNbcFqDH33@kernel.org>
References: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
 <aQvTMM0S16gOdiAN@aurel32.net>
 <12878F9DA586AA19+aQv0bKwLTzw_kJOq@kernel.org>
 <aQwzYrmv5TAIuqTh@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQwzYrmv5TAIuqTh@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M8JnMGwRo1mQ/DUTij+F6rLmMw5PkZZKwrJ1NOFPlZPP9FxgJS6cuZKf
	aSUqtmnEk1MOzt087podP1fmhCXAu1SzJM3wFcz5Zk0Bn/LNBVRWl6E5Xbc7W8I3J0jG2pU
	CFj2i+SVqOFLJBiQjyjyZgeRxN+DA8PLFPQtM07d+LFpsUqfzQWmpHFOBY+w89rNvBJaC8a
	xPyNcO27CskSM7y0PN1MIIYeiick8WD7GlEgkRaGZ45DuE4hc9MLQXcY1qBJmNWKg6DcNSH
	P+KatW4iLof/sQBs0VCX0jY22GHZUGc+Hjv87O82iIpugNwkTWw5G/Vn+ql2IeIK8eAbxO1
	zgSV6EWtvXAphULcR4+TxmcCye88oepdDgwbon00UepVuVUQMug/cfKMm3/WICIe/8cMqkg
	whD6cIcZ+Et0eswC37cJdzuFb4y6/0zyAMQ8L2jElQhTvp16+0OF9r4ra62Orlt25qcX98A
	okGjPvOxcB6/mCRx4b2pt9HQm2ALv50SwtsoemVjNOrPClBY2LsG6ty/Z/elh4apXlz7H50
	GpS0jjV+eqAri/o2GFMqZOpvJ04TOEmkf47OYhlKMzZIWEY00iI45KEFc7ABczA1Y3mYub1
	ZBe5kLOKl/1c/fApbHK1RL2wVonTHLq8Xq2y5UuqOO4GMfUs8m2/OU6ifdr9B1qMfU3kZ9o
	MFC2J6OBQ7am2ATXl6XUcFLgE3qYyuEzOejsNDwnol9QVsDO/8bazsdvDA2OBD7Dkk7dMFM
	KRgJcIwUCRipoWx/HHdu7wL67NL5SjAMzGnVDDW8esqnLU0VPgv8wnfGYGuxYHU5TfXyi/T
	/nfVhUS0TawLPTd9y5fQbCMXAfTPASZEfcjKOJ0WQby6M1fOVlzrEoFw38AcjvxBR0hmzF+
	CKeN37R1NK87Y9HbnZmx1wFYuorNQ/qUNcBWKFmDaiudVy/9oGF2KLnYVqpbL6QAv/GGezm
	tVrEJEsS+d/6frQt3i9nLKXOX6a3k1018VPiCF6dxUTEI7nHHAujranXDqmxMHleRyfWy1U
	tqNQZV2YfS1nmcnoIh2zdfBwmOmkE8k0y9mOvuGpHp9nAmuU4wk4HArVrPOX7UV61mgp3ct
	gGROr8bFGihDgSQkHQJrwY=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

On Thu, Nov 06, 2025 at 06:34:26AM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-11-06 09:05, Troy Mitchell wrote:
> > On Wed, Nov 05, 2025 at 11:44:00PM +0100, Aurelien Jarno wrote:
> > > Hi,
> > > 
> > > On 2025-11-03 15:06, Troy Mitchell wrote:
> > [...]
> > > >  	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
> > > >  		spacemit_i2c_reset(i2c);
> > > > -		return -EAGAIN;
> > > > +		if (i2c->status & SPACEMIT_SR_ALD)
> > > > +			return -EAGAIN;
> > > >  	}
> > > 
> > > This makes the resulting code, while correct, complex to understand as 
> > > it is now two really different errors, as you explained well in the 
> > > commit message.
> > > 
> > > I therefore suggest to organize the code as:
> > > 
> > > 	/* Arbitration Loss Detected */
> > > 	if (i2c->status & SPACEMIT_SR_ALD) {
> > > 		spacemit_i2c_reset(i2c);
> > > 		return -EAGAIN;
> > > 	}
> > > 
> > > 	/* Bus Error No ACK/NAK */
> > > 	if (i2c->status & SPACEMIT_SR_BED) {
> > > 		spacemit_i2c_reset(i2c);
> > > 	}
> > Thanks. I'll fix it in the next version.
> > > 
> > > 
> > > >  	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
> > > > @@ -491,6 +492,8 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
> > > >  
> > > >  	spacemit_i2c_init(i2c);
> > > >  
> > > > +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > > > +
> > > 
> > > This sounds good to start the transfer with a clean interrupt state. I 
> > > just wonder if it should be moved to spacemit_i2c_init(), ie where the 
> > > corresponding interrupts are enabled.
> > Uh, We can move it actually. But is it essentail?
> 
> For me ensuring that the interrupt status is in a clean state after 
> enabling the interrupt is part of the initialization.
Yes, I agree that.
> Furthermore if 
> spacemit_i2c_init() has to be called from another place, it's very 
> likely that it's also needed to get interrupt status in a clean state.
Why we need to call init() in other place?
Could you give me a cese?

                    - Troy
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 


