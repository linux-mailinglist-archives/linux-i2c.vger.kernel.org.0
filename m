Return-Path: <linux-i2c+bounces-6719-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4B6978135
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 15:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F57B287E9A
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 13:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72681D86FA;
	Fri, 13 Sep 2024 13:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="FoXKLmkj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BAB43144;
	Fri, 13 Sep 2024 13:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726234382; cv=none; b=OvbYxEIgW8j8kjJWWK/G5gFGA1OEI75tcpWTkWCXack9o7XcUOBONk06Daeyz6YZjRorNqSusSz21ep9HMrwmgG50JUi7cflSunRo6J7T3frj1DAyMA3vL+trF6ezoZdk/vAz7+jKcDX3TAfSMiiGXIhcxbkrW+ui+W+wKjoTLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726234382; c=relaxed/simple;
	bh=uUQd/1Da/Xxm1kE6OdzdbNAjdOJfQIBxpUioYDTwULQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oi7nZgzYlzkjUftx0wf4yVjwi/f6MbrK3YjNwYjnGn+ey9LqRTQ1aJTl6u7RAjbTk04AsTdznY2i67VmSVcCfkhqpOtlv29MjyVJF5i5zeFjDmMQFE3YYZ9x68EB1EEGWfax1DKCR4/GxuLep+oV+9LW2poIGLFujvcB5w5bAVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=FoXKLmkj; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=RDJJpk2SIh0MQg/4338KK0HiVTDWE+lSNgBRvW7MeCY=; b=FoXKLmkjUo5AsulAlYgBYqf8OX
	IIUfakLskE93sj5H+0RlwjZd/uGx8m+e3c78IWkb0yTok0ByEVDbFc7r5M2XQ3wpwZuIexYwPymhx
	q8N7QDGF/5NxXsaxVh0wrzAXprWx+zmTne64hxtgVG1kfX50GJi9WvUkxKp2B9sKNQbjgTkzBHTLk
	Uq02qR/wfeAjLiw1UV8Sh7VXY1APgM7UXKJX97bQu7brrfV2+iozwYYic1QUnX5FrUOc11Y9CIJzV
	QTi3SaBSUQlbm6KLSVgVuNW+YVh1Tvz/hYqJbbvgX+WluX6jjb/GFQGYcoes8uIJj00MpsLdqYDwc
	nF1I0HOQ==;
Date: Fri, 13 Sep 2024 15:32:51 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Reid Tonking <reidt@ti.com>, Tony Lindgren <tony@atomide.com>,
 "Raghavendra, Vignesh" <vigneshr@ti.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-i2c@vger.kernel.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: omap: Fix standard mode false ACK readings
Message-ID: <20240913153251.48ffafbd@akair>
In-Reply-To: <0903DB3E-1A44-44BB-87DC-01C65B97AE4E@goldelico.com>
References: <20230426194956.689756-1-reidt@ti.com>
	<445b3cbf-ffbc-6f77-47db-c30fc599e88f@ti.com>
	<20230428074330.GJ14287@atomide.com>
	<20230428183037.wbhds54dz5l4v5xa@reidt-t5600.dhcp.ti.com>
	<664241E0-8D6B-4783-997B-2D8510ADAEA3@goldelico.com>
	<20240913140934.29bb542b@akair>
	<0903DB3E-1A44-44BB-87DC-01C65B97AE4E@goldelico.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri, 13 Sep 2024 14:28:59 +0200
schrieb "H. Nikolaus Schaller" <hns@goldelico.com>:

> Hi,
> 
> 
> > Am 13.09.2024 um 14:09 schrieb Andreas Kemnade
> > <andreas@kemnade.info>:
> > 
> > Am Wed, 11 Sep 2024 11:40:04 +0200
> > schrieb "H. Nikolaus Schaller" <hns@goldelico.com>:
> >   
> >> Hi,
> >>   
> >>> Am 28.04.2023 um 20:30 schrieb Reid Tonking <reidt@ti.com>:
> >>> 
> >>> On 10:43-20230428, Tony Lindgren wrote:    
> >>>> * Raghavendra, Vignesh <vigneshr@ti.com> [230427 13:18]:    
> >>>>> On 4/27/2023 1:19 AM, Reid Tonking wrote:    
> >>>>>> Using standard mode, rare false ACK responses were appearing
> >>>>>> with i2cdetect tool. This was happening due to NACK interrupt
> >>>>>> triggering ISR thread before register access interrupt was
> >>>>>> ready. Removing the NACK interrupt's ability to trigger ISR
> >>>>>> thread lets register access ready interrupt do this instead.
> >>>>>>  
> >>>> 
> >>>> So is it safe to leave NACK interrupt unhandled until we get the
> >>>> next interrupt, does the ARDY always trigger after hitting this?
> >>>> 
> >>>> Regards,
> >>>> 
> >>>> Tony    
> >>> 
> >>> Yep, the ARDY always gets set after a new command when register
> >>> access is ready so there's no need for NACK interrupt to control
> >>> this.    
> >> 
> >> I have tested one GTA04A5 board where this patch breaks boot on
> >> v4.19.283 or v6.11-rc7 (where it was inherited from some earlier
> >> -rc series).
> >> 
> >> The device is either stuck with no signs of activity or reports RCU
> >> stalls after a 20 second pause.
> >>   
> > cannot reproduce it here.  
> 
> That is good for you :)
> 
which does not mean that there is no problem...

> > I had a patch to disable 1Ghz on that
> > device in my tree. Do you have anything strange in your
> > tree?  
> 
> No, and the omap3 is running with 800 MHz only.
> 
So you have a patch disabling 1Ghz OPP in there? The error messages
look like things I got when 1Ghz was enabled, so better double check.

if it is letux, then there is e.g. the interrupt reversal in there.
Maybe it unveils some problem which should be fixed, maybe it is
harmful, it was never well reviewed...

> I haven't tested on another board but the bug is very reproducible
> and I was able to bisect it to this patch, which makes the difference.
> 
the error messages, esp. regarding rcu do not look so related to this.
Maybe having this patch or not triggers some other bug. Maybe we trigger
some race conditions. Or i2c error checking regarding OPP setting...

> So there may be boards which happily run with the patch and some
> don't. Maybe a race condition with hardware.
> 
I am not ruling out that this patch has nasty side effects but I think
there is more in the game.

Regards,
Andreas

