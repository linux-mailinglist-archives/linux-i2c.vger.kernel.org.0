Return-Path: <linux-i2c+bounces-14009-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06146C3E1F1
	for <lists+linux-i2c@lfdr.de>; Fri, 07 Nov 2025 02:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78719188BC34
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Nov 2025 01:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1E92F5A11;
	Fri,  7 Nov 2025 01:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="CZ3ws+h3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FA92F746D;
	Fri,  7 Nov 2025 01:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762478663; cv=none; b=SHE471MPiD0SJxG02u87yLKjqn3jrbhWDB0LC07EeaaBLG9WCDuaEwZobEtycDbrRf+4JTxlvH1bYx/G51lywDU2/gh25nFbEZEkCf8EeC/p3tyY5zkksIRurm/SoqXrPIl4YO+CGJQFDO643TnuS/MiXXXIEORMJStZI93WuGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762478663; c=relaxed/simple;
	bh=RiCZcqBXx0qoO2I1MVaNX2wlPuTAl6GxJCLOENck4q8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iauOCZc9uxUtDiJDstbdXEGLkozjblN2ffWrwL+r7ssLnvkM78AT9S60hFaA9MBFGgjyl++PutlfEZw9vHd+X42F8cJfGwpXLACg+rOOYkn/FdpdxvG1Y9cME5PCWtGY3OFk7W3ztv6PMEnDpufwP4r5ac34ilAtcijZyFeI9hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=CZ3ws+h3; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762478569;
	bh=t7tRvyZ7ednKIkr3XeRZc9amYYNTVix6VkI2QvXO0V4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=CZ3ws+h3j0d9TEdczQzd43r2NzM/WoFr3UPHJ30mryhpuiezKavMg0c3hMzMkrdaV
	 xTxV+gqCxQG8ppTTvYunLvhtU6yhrKD6+hQOq3jwabr7VcMf+34UGJoR7Gih2EjqtT
	 epJlf8aQWNdTwYBJwjs7cbH9zgO912LnRRpnbxOQ=
X-QQ-mid: zesmtpsz3t1762478566tf97beed2
X-QQ-Originating-IP: Jv1aKYQ/MjyLhPILSXPUmj2hn/opOWyMKd601+FeEek=
Received: from = ( [183.48.246.190])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Nov 2025 09:22:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13905674889772998339
EX-QQ-RecipientCnt: 10
Date: Fri, 7 Nov 2025 09:22:44 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: fix detect issue
Message-ID: <28675E3B65BB7C20+aQ1J5NTKx6i623ju@kernel.org>
References: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
 <aQvTMM0S16gOdiAN@aurel32.net>
 <12878F9DA586AA19+aQv0bKwLTzw_kJOq@kernel.org>
 <aQwzYrmv5TAIuqTh@aurel32.net>
 <0E2B2679F0650AE1+aQw0VgKNbcFqDH33@kernel.org>
 <aQzmHB2FaPFS4qwj@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQzmHB2FaPFS4qwj@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NhdiEwnVOUqExbdtneD2Nu7ZvMKRJvSXJb3DC08ek4AVlnHiOQCf8xaL
	2LVw1ILvRSjSVTkzdKOyYZPPKLAXX1YIMc5TCutKiqw0Hk58pir8CcQqSInwiTeBBsMSZt/
	VDC4ZMk+OSC+T12JfVIpOovBi7reZjxUbzEMYK0ss9aSYvzD6frpF1XYJ+mQYZJUrV7GZak
	IUt7L9dn2OQlYD4YloRLEmj79MuzKMVL90zaMM/BxMAjLJ4ukj1cc0mDn87/2INh+/LgbE7
	Ru0Zp8gmwXH2lQvk6jxQa4GJ4oedcHZREEWCI6yMsZwz8lbd8b5m07TmyWqHIwGlhZCaQER
	FncKk8HDoM6tjwgATCtAdhjmzH1P4MrKci3K/UBGGUVLSUp8lIGyJr5/gjUS0srbiE5gbyf
	NocdKk1Lz38jCHGr990c1cG19xtqoUq3bA5h3LkPYdOqqOjpVSmyxi5N6Aj6UzA3ckVzHoq
	xM4WF6SbPufYOIKChuH2wMktVwrJiD5mNmey7jYDZG2gKj4ifzxYwpvO/8GGEpNINHMHOxD
	TViDTem+mKHIWuidtMjPzQ9zMxefUPAF4dNcxKz49VH5DhprVggE3SWsUbQwjT9UXmnpF9Y
	0iW0MhUwjeN3+NfgiyRywO6HA3I+btzn/0RmVGUqvbsY32yBPFzmWaq/W9pYQ38li8xrjl1
	H5CjXkOT3bLtp70ut9K3P6dcwVunZX2i/mhnRLmj/AerOX925ozTdufIwHnnVFJiMAnjlUs
	mb6+H0k1rD+1MD2W3cuN5oes99VFj4zCzTWCyl2iI60PlIvBRX81jcwJ3pt5iLEyKIqvAl9
	8d4KkJXyinc9Q+jNPWCWEFxvEPWKsOZ1YZwVjCZCEO5++vmDhubCpdFaehTBIS3oNskmzOh
	2JkFgG2aQ2wYf0UEVEXwRqXgeFDTVBkkJIeQx0vbjaaBqvR9wpQEdAgqOuuboDcokixwzsG
	q5pPbpYueZnmk1Kju+Lhg9MR4fBJc+yyb9aGsllhBFdJApUmeSJ/pOktS7a2oUuFlCqfUmi
	Eb7XR+kptktCVVdWPQwbB3AJdYrqRWU45cW90i0qtgMhqyRdmkr7KayD76RvQ=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On Thu, Nov 06, 2025 at 07:17:00PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-11-06 13:38, Troy Mitchell wrote:
> > On Thu, Nov 06, 2025 at 06:34:26AM +0100, Aurelien Jarno wrote:
> > > Hi,
> > > 
> > > On 2025-11-06 09:05, Troy Mitchell wrote:
> > > > On Wed, Nov 05, 2025 at 11:44:00PM +0100, Aurelien Jarno wrote:
> > > > > Hi,
> > > > > 
> > > > > On 2025-11-03 15:06, Troy Mitchell wrote:
> > > > [...]
> > > > > >  	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
> > > > > >  		spacemit_i2c_reset(i2c);
> > > > > > -		return -EAGAIN;
> > > > > > +		if (i2c->status & SPACEMIT_SR_ALD)
> > > > > > +			return -EAGAIN;
> > > > > >  	}
> > > > > 
> > > > > This makes the resulting code, while correct, complex to understand as 
> > > > > it is now two really different errors, as you explained well in the 
> > > > > commit message.
> > > > > 
> > > > > I therefore suggest to organize the code as:
> > > > > 
> > > > > 	/* Arbitration Loss Detected */
> > > > > 	if (i2c->status & SPACEMIT_SR_ALD) {
> > > > > 		spacemit_i2c_reset(i2c);
> > > > > 		return -EAGAIN;
> > > > > 	}
> > > > > 
> > > > > 	/* Bus Error No ACK/NAK */
> > > > > 	if (i2c->status & SPACEMIT_SR_BED) {
> > > > > 		spacemit_i2c_reset(i2c);
> > > > > 	}
> > > > Thanks. I'll fix it in the next version.
> > > > > 
> > > > > 
> > > > > >  	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
> > > > > > @@ -491,6 +492,8 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
> > > > > >  
> > > > > >  	spacemit_i2c_init(i2c);
> > > > > >  
> > > > > > +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > > > > > +
> > > > > 
> > > > > This sounds good to start the transfer with a clean interrupt state. I 
> > > > > just wonder if it should be moved to spacemit_i2c_init(), ie where the 
> > > > > corresponding interrupts are enabled.
> > > > Uh, We can move it actually. But is it essentail?
> > > 
> > > For me ensuring that the interrupt status is in a clean state after 
> > > enabling the interrupt is part of the initialization.
> > Yes, I agree that.
> > > Furthermore if 
> > > spacemit_i2c_init() has to be called from another place, it's very 
> > > likely that it's also needed to get interrupt status in a clean state.
> > Why we need to call init() in other place?
> > Could you give me a cese?
> 
> Currently there is no need to do that. However if the driver is extended 
> (e.g. to add new features) and spacemit_i2c_init() needs to be called 
> from another place, it is likely that a reset of the interrupt status 
> should also be included. Therefore it's better to just include it 
> directly in spacemit_i2c_init().
I'll move it in init(). But it's not for reuse.
It's not for reuse, but because the name init() should indeed ensure the
hardware is in a clean state.

Thanks!

                                      - Troy
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

