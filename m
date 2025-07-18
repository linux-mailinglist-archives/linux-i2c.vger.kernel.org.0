Return-Path: <linux-i2c+bounces-11961-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19744B09DCE
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 10:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1759C1C46A15
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 08:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E46290DBC;
	Fri, 18 Jul 2025 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="nZPOQ6q0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33652222B6;
	Fri, 18 Jul 2025 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752826989; cv=none; b=i8wmR9BJ3faCWgzDA21VJcEqh8cNpY3xV1k3eWa9CD++XSYBi3Ad6gdZI1/jrH7qJlK9WUPYQukvy+uIT9ir56R/IYkcYrpdpPMWdC+jIa11kXWU3VmvrJGpLC3/YNeMJI9gCojIwLZOUhtyogS8zplD0HW8ISwgUTcqEyGNFq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752826989; c=relaxed/simple;
	bh=SR1VOC9iktHSawfPj7HA4M42MrvCPWUQ5IFb4CNokCU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VWUSB8OLF5QQQk/U18El4OhoQYpzTQyKVaibDeDj7U0usU3nU2IMtVQ2kMksS7HSwy6mmYVblawIu41/Vv/VhMe+rJO2sVn3MdlLNARhP+8+sCTfkE5rbhWkQbh0GoOjpXZO8/EwYhsIjaZZfI+GBpk+/CVY/szEaOTLTsgd1Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=nZPOQ6q0; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LyOg420EPYvHmbwkKD1VHuO05Tohp6tvVQsTHuJ+F4Y=; b=nZPOQ6q0nqcd3RYvSTj+zk7AYj
	RCK4Jb47f9yUvjAovCC7mWepYxFvS+znpC7HgQCX4LHJDBoxtCXA0JslR9ywt1oFhFOF5XJmK7ciE
	XoXB/A/MEIwHn6jFAnd6LkkUniXyAObDGYjwW3b4cobD9RvzAWaWOIHhuSFGlKzaBNwJA+NsetU+u
	dHk5wvvWTbv0ZEiMuFBCY0i7yrhOEg9vB9gpvWf7MmD6JY9Qh588BMXbNw6+efZA7I1tgSwXYmyYj
	mqfrqYevo5Fu1qvwJ5syYEkIehMbj9Ghh2J6AtfD1VdtobrDBTROeKxuaWdhLZIEk8kbV+y1tAmeE
	kCl4OqKA==;
Date: Fri, 18 Jul 2025 10:20:46 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, vigneshr@ti.com,
 khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
 jmkrzyszt@gmail.com, andi.shyti@kernel.org, miaoqinglang@huawei.com,
 grygorii.strashko@ti.com, wsa@kernel.org, Jean Delvare
 <khali@linux-fr.org>, Komal Shah <komal_shah802003@yahoo.com>, Greg
 Kroah-Hartman <gregkh@suse.de>, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: omap: Handle omap_i2c_init() errors in
 omap_i2c_probe()
Message-ID: <20250718102046.34f2b702@akair>
In-Reply-To: <aG60GJy60Jf3w8tZ@roadster.musicnaut.iki.fi>
References: <cover.1751701715.git.christophe.jaillet@wanadoo.fr>
	<565311abf9bafd7291ca82bcecb48c1fac1e727b.1751701715.git.christophe.jaillet@wanadoo.fr>
	<aG60GJy60Jf3w8tZ@roadster.musicnaut.iki.fi>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 9 Jul 2025 21:25:28 +0300
schrieb Aaro Koskinen <aaro.koskinen@iki.fi>:

> Hi,
> 
> On Sat, Jul 05, 2025 at 09:57:37AM +0200, Christophe JAILLET wrote:
> > omap_i2c_init() can fail. Handle this error in omap_i2c_probe().
> > 
> > Fixes: 010d442c4a29 ("i2c: New bus driver for TI OMAP boards")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > Compile tested only.
> > ---
> >  drivers/i2c/busses/i2c-omap.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> > index 8b01df3cc8e9..485313d872e5 100644
> > --- a/drivers/i2c/busses/i2c-omap.c
> > +++ b/drivers/i2c/busses/i2c-omap.c
> > @@ -1472,7 +1472,11 @@ omap_i2c_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	/* reset ASAP, clearing any IRQs */
> > -	omap_i2c_init(omap);
> > +	r = omap_i2c_init(omap);
> > +	if (r) {
> > +		dev_err(omap->dev, "failure to initialize i2c: %d\n", r);  
> 
> Error paths in omap_i2c_init already print a message and error code,
> so this is log is redundant.
> 
And I have never seen these in normal operation, so adding that error
check should be safe.

Regards,
Andreas

