Return-Path: <linux-i2c+bounces-13972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C59C38A7F
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 02:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 262C91883D8E
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 01:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98731D9A5D;
	Thu,  6 Nov 2025 01:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="m51hBwAA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2991891AB;
	Thu,  6 Nov 2025 01:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762391229; cv=none; b=VG4zFl9OwpB3AdjuRB4i/chZdgZohSpnYke+qxNOcpPUyXnAfS5G7t8EWT+RFk/TrkKyodnCZ9i5kGUwz1pxWu1n2skKfpNrCGpScQ4F5bryiRI1WOTlV0Y3HbY7W3JbTYHGsB1XauXWQzl3ZnQdCJHkJFTO3epbSX7NjbaIj1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762391229; c=relaxed/simple;
	bh=YXj/NbSD4ppvHW9bhlduHnPA9nFHKEfGF2xascbyOHQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAaoDPh88hBrdosoXza1nk+vhaI4/HaMEIatSYmPAUJsGKut5qtigLOFSwqC1GVHQf5Oz8fImJCEguwx2spszLZe9BwNPKxSjI9HKNZbgzY3LfYPT6xuUt0gojcHnKa3JDu/kh7ku4hkS9T9LseWxuHV61CsqpT3eHetVNn1iRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=m51hBwAA; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762391152;
	bh=JFkF8UkYbaaB7pjH4epayy6X+f7NP5eH8pQou+XQb6o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=m51hBwAA1qD/Q91GT1229VZcMB461RwPMwrR4HzaoR269O7/WIPSY7w8Qi4D6KWYx
	 oLEJQb1OxT9UwW/SFrHwvfaRPs7WPNNp3KV+Nly5NUHxe0aUEPe7SFEKkeyw9JDCDf
	 ok6hzVm0g9E/9ZoBixC3Kwk8TSasO/kJDBAQ/GaM=
X-QQ-mid: zesmtpsz7t1762391150tf3744dc0
X-QQ-Originating-IP: KsjedbsCDqWW6E9h2I75XKG5hzaDuX8RrfV6cNDgNwM=
Received: from = ( [183.48.244.176])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 09:05:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10819907063905437385
EX-QQ-RecipientCnt: 10
Date: Thu, 6 Nov 2025 09:05:48 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: fix detect issue
Message-ID: <12878F9DA586AA19+aQv0bKwLTzw_kJOq@kernel.org>
References: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
 <aQvTMM0S16gOdiAN@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQvTMM0S16gOdiAN@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nlpn2WSBPiqi09mhGkZ7fY468yzybPrr6Z+vDJ4hmUCqZrw1ozcSySjS
	ybAOJ/H0GfQzr8GArfOOLaQbhs+bWFGELNQacTYPIiE5uKywRbwU8OPIEOGgmHHqq9THNuS
	Q5LZY6S6VWbuBAByqCgFyNNMLstLK7KjDydNDgq8fd8CW2T1JfGbgk3Z3Yd/ZDwnYDwVamw
	qOBNb1Z6xTxvP8oWVBdiMfBBKSpY7PT9orEGtr7sragNF+Pq6/W7ddV9icIXhVNfgZrirLA
	OWtIPGVD29wVwaUgGOUMD3tFplJgYa7c1uVpE0YR5HZ3pXcWBzV+AmKyC0scSxDgyBSwoVC
	9cSIMUlcd4c355vzT6em/tAW+ovKoxHq2MkztyByNUNYhalhCJ72EvagJ0kEpDI2Q8FFl10
	voyUyOg7+4w1D0tp2SOYINfkTHuj9TeLT9dSfgqg24b5r/DnQWruax55FDWeBtjhqtR29jj
	0GfQmjQ4ZPaamw3DneQ8OhsJ6WTE245cj6bKyb3ti/K0DfKEEmabZ+XODe81hhnhBKtWR3o
	KSdNclTGeK26yqyCWR8V4+w09oRwmtf0J11Z/nIh/S81xzrr6UIUXLkFXdiMcmaOG0gZ1N5
	xIKXZEK9VH5/OCF2hPsgM3A9eYsXlzgnQKb+jE+OrG2Ueo5ynGD5F6T32cIEO/JfshrlIhQ
	7gzD7k0g+TCCVpVJepuV4LOkWToB6UgnzFE6ADewCaVyLAZnQ2KX53pq6yjvqq35UXSFwFm
	r1chXQBsK1lmkgAt1BEiTCCD/niw9UItVV8UDvO36KAEVkwl3ZgvZLx9638WZ1edbZ5ez2C
	fjCYnh0eQkFOk1N1NGg7iceb2AYgvmw4sIUW193P6XCvKWOEcke3QEjTdJvuDUbfVSl1ny+
	mJGbN7tzvaAGdQJphgwQ7nyqsu7dnj72qvRoT8YpjASlll7DC0zGTS4Ck5guWRPEcZBLGHz
	1no/6TdUcXzVKSOnmSsSw6gcnOdvKaG+pQew6w83spvr/RZXWsT12OSdW9tn5rpU6mh8S1A
	se83iPF0k3GgV0VfyE87KvlSunLBHVauntJu9V86P6DPgxZG3ewUn4Q+iycfXIeAR+Omvlg
	l3elE34njNxUCrnA0i8CG4Zsvl+tUYdtQ==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

On Wed, Nov 05, 2025 at 11:44:00PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-11-03 15:06, Troy Mitchell wrote:
[...]
> >  	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
> >  		spacemit_i2c_reset(i2c);
> > -		return -EAGAIN;
> > +		if (i2c->status & SPACEMIT_SR_ALD)
> > +			return -EAGAIN;
> >  	}
> 
> This makes the resulting code, while correct, complex to understand as 
> it is now two really different errors, as you explained well in the 
> commit message.
> 
> I therefore suggest to organize the code as:
> 
> 	/* Arbitration Loss Detected */
> 	if (i2c->status & SPACEMIT_SR_ALD) {
> 		spacemit_i2c_reset(i2c);
> 		return -EAGAIN;
> 	}
> 
> 	/* Bus Error No ACK/NAK */
> 	if (i2c->status & SPACEMIT_SR_BED) {
> 		spacemit_i2c_reset(i2c);
> 	}
Thanks. I'll fix it in the next version.
> 
> 
> >  	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
> > @@ -491,6 +492,8 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
> >  
> >  	spacemit_i2c_init(i2c);
> >  
> > +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > +
> 
> This sounds good to start the transfer with a clean interrupt state. I 
> just wonder if it should be moved to spacemit_i2c_init(), ie where the 
> corresponding interrupts are enabled.
Uh, We can move it actually. But is it essentail?
> 
> >  	spacemit_i2c_enable(i2c);
> >  
> >  	ret = spacemit_i2c_wait_bus_idle(i2c);
> 
> Anyway:
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Thanks!

                          - Troy
> 
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

