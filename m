Return-Path: <linux-i2c+bounces-11923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC4B0341F
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 03:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B4451778A0
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 01:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CD419AD5C;
	Mon, 14 Jul 2025 01:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="BBPlxzk9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6472AD3E;
	Mon, 14 Jul 2025 01:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752455555; cv=none; b=X6lOag+Ut55lC2H2shwDAqhShMKULPnVQDMV7LAO2bLeIVFx681DLhICEHRcNxaPCyK/XSj5rftjT7+EPhHOpejqMx8cParT+axwt+svLAwYiu5mKu3EH5cPzBEJusZh/Hsk+aweuYM2TBu8uAm0RT2LCU+77yXro0Bs6O2lNkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752455555; c=relaxed/simple;
	bh=8IpIMTppj7RNZiLYT1pD+ZGIOcFGOOuJZpusmqnD4KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6hoC2L9KNJQI+HRoVkkBZUbYNxEV4RKiMxp4STYtvmGscOBSMAOPKq4aiQdyNsZFIpv27hTiruc+BM8G9N7dZF//5Rr+GKBa+usK17nZP0BTdZhHZbij84FzuMe62umcyScKd0bU4Jt65FJv8PZfDUFme3H+q5GL7K8hFbqoDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=BBPlxzk9; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1752455472;
	bh=Amtu/BMQ4xmWdYjBSji486U4RjhuzbYA7jha03pBhjg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=BBPlxzk9Adp+ew3JynSnWvYMw4IvBcfdrKJfvabsUdK+/1Qja0Yzxrw+oNX7zSIiQ
	 MxFfC4+PGANzE3Pg70aYSynMuQrbTjfiTKs/bGNfmCaX6gSll+k95DzHnfewLwmYZS
	 WHOo4pT/Vc/44lzj/NUtuE1T30vCYszP+gSNEDqE=
X-QQ-mid: esmtpgz11t1752455466t98e6bb1f
X-QQ-Originating-IP: sb1Z4YGB401YU+EpphLSHmw9KA7oI9snJgML1SxSMyk=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 14 Jul 2025 09:11:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4221218909025609194
EX-QQ-RecipientCnt: 7
Date: Mon, 14 Jul 2025 09:11:05 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: configure ILCR for accurate SCL frequency
Message-ID: <54384E7E7AD6D77C+aHRZKYHMHTiHXPWW@LT-Guozexi>
References: <20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com>
 <bf6nkxdfctgz2tacf3vm6tv4qhd72vbqj52gu6kt2fc5erltkw@nufl7i3bddkb>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf6nkxdfctgz2tacf3vm6tv4qhd72vbqj52gu6kt2fc5erltkw@nufl7i3bddkb>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NSEFX6u+4l+KDZ9Z+o4732aEfDt7l3MfBCgkh3FgU6RdpVeVwB2wXZV/
	PPMLlq/OSDUd+1z6aSYEZHp+aQ2YnY1omlVxMV70bSSVm8wH0ihSaAclGdQg74xadApPykE
	oHqVdHpuD7vtS6gpP7LVsQkcuvwgEuuTKVuWDrMLy2BKFC9Ry26j7JzjirzS2GIbK6KHi2x
	9h2yQkhFVZ4FA4myRI13VKXl7qCgn1Owmop8wF7k942Bnh3QNmV3jJ6S5v+qFhOL256cx1N
	Nva59Pgw8/pzt7KtKk6Gwau90Op/zz9YRQgcZFNh4r1VgLOQHSHPbhoZn7OpGUz4kPVrPig
	hrHpsBhlEhHuzNfDqtHrYDqm2U/RIVQsg+vrDzNBqTRS0dyCE6mKKrsEPkAFHD9YUUnzTlu
	zIeRvVz67LXjBSUAzkNSDDnrl56VUOEeZdNl1or6WO2+TgDsoehL75BS4wPENaupMEorDXU
	O3rU+JdcFrHCOMxuu+KCfr/RjnokJj2ilYHTtg4WbFHXWlQ4in+oEb/6NX5rh48oorqgHKo
	LyCQ7zJ/AbdO8zvWg3YxCRx1lRjziBGJHgtetvjcJTEIKkW8c3UhPcj7/V10yYEw1eoZjBn
	23KfHzef2UXOTY8ARALNGrNh9aewNxUmTsrtdANCvdPi0vmrJ36CexM12KDowHIHcVLIEYT
	vgkkGkB9hm2NT9p1wIEdm40nM7M6wqkZUAxXQQKnk3Lmzobbkc9fNMW8BjkPosuN2SXhxpt
	eimSeAlX6QgmxsZ2O1q5emhHvNKmmq3NAWYkLgUGCw4rAMhhDT3sFr24FEQk8pzWdCVdzPm
	TmKEGCXfAvmZs48U3HrC4gn1lpVJJtCfvr1UYws4PMmpWTLJn+7C7FDpZS6A4GgT4/9g+0Q
	IpdruTdGlI+Qjw4XCejH2nQ2oxQrQhjDlT+h1LPbGuz8Yw2tqEZaJ1t4XzNHqy6IO/y2s1R
	tJ+1XmLwlj+Vazh8T6QPXgOiHQEduxH3hdUh3JGqgEuo2NERxg500KmkP6AvIrHe6/f4=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

Hi Andi, Thanks for your review!

On Fri, Jul 11, 2025 at 11:20:48AM +0200, Andi Shyti wrote:
> Hi Troy,
> 
> > - #include <linux/clk.h>
> > - #include <linux/i2c.h>
> > - #include <linux/iopoll.h>
> > - #include <linux/module.h>
> > - #include <linux/of_address.h>
> > - #include <linux/platform_device.h>
> > +#include "linux/bits.h"
> 
> this should be <linux/bits.h>
> 
> > +#include <linux/clk.h>
> > +#include <linux/clkdev.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/i2c.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> 
> Is the diff a bit noisy or am I failing to see some differences?
I removed whitespaces

> 
> >  /* spacemit i2c registers */
> >  #define SPACEMIT_ICR		 0x0		/* Control register */
> >  #define SPACEMIT_ISR		 0x4		/* Status register */
> >  #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
> > +#define SPACEMIT_ILCR		 0x10		/* Load Count Register */
> >  #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
> 
> ...
> 
> > +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > +				unsigned long parent_rate)
> 
> here the alignment is a bit off.
> 
> > +{
> > +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> > +	u32 lv, lcr;
> > +
> > +	lv = DIV_ROUND_UP(parent_rate, rate);
> 
> do we want to sanity check the lv value here?
Yes, I'll check it in the next version.

> 
> > +	lcr = readl(i2c->base + SPACEMIT_ILCR);
> > +	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
> > +		lcr &= ~SPACEMIT_LCR_LV_STANDARD_MASK;
> > +		lcr |= lv << SPACEMIT_LCR_LV_STANDARD_SHIFT;
> > +	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
> > +		lcr &= ~SPACEMIT_LCR_LV_FAST_MASK;
> > +		lcr |= lv << SPACEMIT_LCR_LV_FAST_SHIFT;
> > +	}
> > +	writel(lcr, i2c->base + SPACEMIT_ILCR);
> > +
> > +	return 0;
> > +}
> > +
> > +static long spacemit_i2c_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > +				unsigned long *parent_rate)
> 
> Alignment.
> 
> > +{
> > +	u32 lv, freq;
> > +
> > +	lv = DIV_ROUND_UP(*parent_rate, rate);
> > +	freq = DIV_ROUND_UP(*parent_rate, lv);
> > +
> > +	return freq;
> > +}
> > +
> > +static unsigned long spacemit_i2c_clk_recalc_rate(struct clk_hw *hw,
> > +						unsigned long parent_rate)
> 
> alignment.
> 
> > +{
> 
> ...
> 
> > @@ -519,15 +636,13 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
> >  		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
> >  
> >  	/* For now, this driver doesn't support high-speed. */
> > -	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> > -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> > -			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> > -		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> > -	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> > -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> > -			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
> > -		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
> > -	}
> > +	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> > +	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> > +		i2c->mode = SPACEMIT_MODE_FAST;
> > +	else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ)
> > +		i2c->mode = SPACEMIT_MODE_STANDARD;
> > +	else
> > +		return -EINVAL;
> 
> Should we print an error here? And how likely is this case to
> happen? Perhaps we can force the mode even if the frequency is
> off and move forward instead of forcing the failure.
Yes we can force the mode to fast.

        - Troy
> 
> Andi
> 
> >  
> >  	i2c->dev = &pdev->dev;
> 

