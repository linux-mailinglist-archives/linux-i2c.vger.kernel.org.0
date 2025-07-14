Return-Path: <linux-i2c+bounces-11938-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE810B04987
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 23:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21AB04A5DE4
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 21:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED73D1F09B3;
	Mon, 14 Jul 2025 21:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fv8PUTR1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A988B1487F4;
	Mon, 14 Jul 2025 21:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752528637; cv=none; b=N53sGhFH65mq+yghysLZcl42YzGZRosSuU/IpmbkgimB+S/xrgiNHPuJqu8roneoYNwDO7OHpvZgEzgwyxnJD8JpzWxsCqVAWXfcmg8cWZVZsmZrH2mZNBEoqyBEuU5lmusuf4gWb8yr0Kms74p0gzzAvBcTvYBFP+7r5afPH9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752528637; c=relaxed/simple;
	bh=aVMDG6JzIpk4Eo+Pl5FCirxkYzovLZhgl/i7XFV8zEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4OO38LbcInKycEmfdXf1fEv6pAVcJ52qSye2k2/wuOVL5Jl7YoqX5oEO4cCLqShBuBHsOaDDuXM0lj14u+2PHl2R1I3N4WbuVa20NTNVNN2HHOgf8M21MfwI3H7VGP4pHX3TmWga0SqtRbiMtK0YPlYJ7oKj0+wNPAvoK//f3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fv8PUTR1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6178C4CEED;
	Mon, 14 Jul 2025 21:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752528637;
	bh=aVMDG6JzIpk4Eo+Pl5FCirxkYzovLZhgl/i7XFV8zEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fv8PUTR1NHH8rdlrIjssAdpWfw5mwtJ5DNRFbgoL21MHikLHTctDgj9m0l+s1TTfJ
	 3BVuVhpqRyhET2DfZzstugtlJYK+gTnoH0jlrdmr4aw+TXw8qUcvWxXdhdtzuVqADS
	 gAAIaJdjfQj8CBTI2HWzg77kqTUNtE3t2Jyq8cFjOcq1zWCXB3OFqr1/XpErYaA9xZ
	 iccXCBDDcU1nFwRBlALl/HO7lhlehm3BVg9R+f5dEVGTatn44j2PCIhstp2YGdFgtV
	 w5VUxZHUlkklM4rw6xqa4wDxGZEMEqYc9FFQL0F36x7Q4fhf63uOmQbpJGBi8jIXuU
	 7x4FxFWjww8SQ==
Date: Mon, 14 Jul 2025 23:30:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: aspeed: change debug level in irq handler
Message-ID: <bhgxk2qopxguthrismqwif4d7xiqals7kwqq2nxvioxr7wriib@b5ee654pfxnm>
References: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>

Hi Jian,

On Wed, Jun 18, 2025 at 06:21:48PM +0800, Jian Zhang wrote:
> In interrupt context, using dev_err() can potentially cause latency
> or affect system responsiveness due to printing to console.
> 
> In our scenario, under certain conditions, i2c1 repeatedly printed
> "irq handled != irq. expected ..." around 20 times within 1 second.
> Each dev_err() log introduced approximately 10ms of blocking time,
> which delayed the handling of other interrupts — for example, i2c2.
> 
> At the time, i2c2 was performing a PMBus firmware upgrade. The
> target device on i2c2 was time-sensitive, and the upgrade protocol
> was non-retryable. As a result, the delay caused by frequent error
> logging led to a timeout and ultimately a failed firmware upgrade.
> 
> Frequent error printing in interrupt context can be dangerous,
> as it introduces latency and interferes with time-critical tasks.
> This patch changes the log level from dev_err() to dev_dbg() to
> reduce potential impact.

this change doesn't fix any issue. This might improve it in your
system because maybe your printing level does not include debug
messages. But if you increase the printing level you would
immediately fall into this same issue.

...

> @@ -665,7 +665,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  
>  	irq_remaining &= ~irq_handled;
>  	if (irq_remaining)
> -		dev_err(bus->dev,
> +		dev_dbg(bus->dev,
>  			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>  			irq_received, irq_handled);

I agree that this is excessive logging and in my opinion you can
completely remove this line. But what other error are you
hitting?

Andi

>  
> -- 
> 2.47.0
> 

