Return-Path: <linux-i2c+bounces-2154-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DD28704F5
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 297DA1F229C9
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8282E482DA;
	Mon,  4 Mar 2024 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcJBfY3t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343614653A;
	Mon,  4 Mar 2024 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709564983; cv=none; b=iF1SA613CXY4B6o/HXSwFgvHNcD1EYdSltg2QzPF0Qf+l61fYGvP4T2wF/WZEAo4ntKmUKVkUTqWbnK1iu1WWmc/4LCO/H23d3tSdhzZHHWCbZqI9I5AMNnUeHDbOAKABXtSMbTuKM6bGkKIu2wCrcdt1dHsAHakfTQuQR/SiqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709564983; c=relaxed/simple;
	bh=0EN/djUllp20WYcpsZJ+YqgTYOv5D/8q+MIeYGrZwYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6tat9dOhlSbDaN8zi07nUWJJXel39CrStkuJP78Lw13xOlZ3KvYQJLXnbaFpmcyCLGNpgKrxjHC4rF2LRlBvjjvMSqOWueo1nLbSiMOF6PK+YEiN/1ZDG62M6TRridDz+I2OlwGGA/WMKv/hJdAN0ruMcIkIQ9WmGZbz9MggVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcJBfY3t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101C1C43399;
	Mon,  4 Mar 2024 15:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709564983;
	bh=0EN/djUllp20WYcpsZJ+YqgTYOv5D/8q+MIeYGrZwYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcJBfY3tWVDpuLt/lYCRgDIKDTl7ZAxziWE8a75pn2ypL9ZwdKNKqAK55sRqNjNDx
	 H+0HetMxYYbBKxO/vdb8Ve8331ccpLJXo2tWedX+hxJxqTtSBxVKlsTS21Ui2Ibnd0
	 jwR2fECfOjr1uh4gkXYbNWW1p0tVRlgDcZKqLHcZTsgYmGcyMarFY98PGSNP2XWSvh
	 eRDOYtqTcVp2ypAhC/ZoeL2EG+jx4JrbeLVjVXnaBTRGR11z2YxbsOwVeNa10HP7UZ
	 1k7SWDzWnHyBFtW8BFVvMO/cVpTRh/+ZODJNQc6ox52eo8CYpM9Z97kbrEGwMLPX3s
	 wfSFdiQrjZzLA==
Date: Mon, 4 Mar 2024 16:09:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: Re: [PATCH v2 06/11] i2c: nomadik: support short xfer timeouts
 using waitqueue & hrtimer
Message-ID: <stofbh7be43it734k5icmjpo7oya2x4maevl2xirnf7spfkrzv@h27rc5riemao>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-6-b32ed18c098c@bootlin.com>
 <uq6n6s4ksuxvkonowouhr747cnu4ccwvhgpl6r7txgdtnimqnz@sl33zjshzemk>
 <CZL1F576XCJB.2DBGD5Z7UUXIH@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CZL1F576XCJB.2DBGD5Z7UUXIH@bootlin.com>

Hi Theo,

On Mon, Mar 04, 2024 at 03:32:38PM +0100, Théo Lebrun wrote:
> On Mon Mar 4, 2024 at 2:54 PM CET, Andi Shyti wrote:
> > > +static bool nmk_i2c_wait_xfer_done(struct nmk_i2c_dev *priv)
> > > +{
> > > +	if (priv->timeout_usecs < jiffies_to_usecs(1)) {
> > > +		unsigned long timeout_usecs = priv->timeout_usecs;
> > > +		ktime_t timeout = ktime_set(0, timeout_usecs * NSEC_PER_USEC);
> > > +
> > > +		wait_event_hrtimeout(priv->xfer_wq, priv->xfer_done, timeout);
> > > +	} else {
> > > +		unsigned long timeout = usecs_to_jiffies(priv->timeout_usecs);
> > > +
> > > +		wait_event_timeout(priv->xfer_wq, priv->xfer_done, timeout);
> > > +	}
> > > +
> > > +	return priv->xfer_done;
> >
> > You could eventually write this as
> >
> >   static bool nmk_i2c_wait_xfer_done(struct nmk_i2c_dev *priv)
> >   {
> > 	if (priv->timeout_usecs < jiffies_to_usecs(1)) {
> > 		...
> >
> > 		return !wait_event_hrtimeout(...);
> > 	}
> >
> > 	...
> > 	return wait_event_timeout(...);
> >   }
> >
> > It looks a bit cleaner to me... your choice.
> 
> The full block would become:
> 
> static bool nmk_i2c_wait_xfer_done(struct nmk_i2c_dev *priv)
> {
> 	if (priv->timeout_usecs < jiffies_to_usecs(1)) {
> 		unsigned long timeout_usecs = priv->timeout_usecs;
> 		ktime_t timeout = ktime_set(0, timeout_usecs * NSEC_PER_USEC);
> 
> 		return !wait_event_hrtimeout(priv->xfer_wq, priv->xfer_done,
> 					     timeout);
> 	}
> 
> 	return wait_event_timeout(priv->xfer_wq, priv->xfer_done,
> 				  usecs_to_jiffies(priv->timeout_usecs));
> }
> 
> Three things:
> 
>  - Deindenting the jiffy timeout case means no variable declaration
>    after the if-block. This is fine from my point-of-view.
> 
>  - It means we depend on the half-mess that are return values from
>    wait_event_*timeout() macros. I wanted to avoid that because it
>    looks like an error when you read the above code and see one is
>    negated while the other is not.
> 
>  - Also, I'm not confident in casting either return value to bool; what
>    happens if either macro returns an error? This is a theoretical case
>    that shouldn't happen, but behavior might change at some point or
>    bugs could occur. We know priv->xfer_done will give us the right
>    answer.
> 
> My preference still goes to the original version, but I'm happy we are
> having a discussion about this code block.

sure... it's not a binding comment.

Andi

