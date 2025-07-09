Return-Path: <linux-i2c+bounces-11887-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6153AFF159
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 21:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9DEF4E6D35
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 19:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C723923ED69;
	Wed,  9 Jul 2025 19:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uCNwN7RE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767B823CEFF;
	Wed,  9 Jul 2025 19:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752087795; cv=none; b=UJDCSeu2UYbTX/clfO+SyG3HNklGf/VnZbnSq6Aaf0Y8EWc0U+VxQv5PgQVGY7IbJf0+J1rYYxyjcDotOr4E4JdXha2dFjjtv59qLWorVxtwtMu5eCS4SkpdYPmepO0iLM/AHDtc5xbq/4F7u4w7vohkRrlR7ldSt5UQW4dYQ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752087795; c=relaxed/simple;
	bh=lSMeAZGO+rQcyXO17LJXWE7R5OHREkUaiHJQysbQyAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLkk4RKR58lCUct1RJ8ZdSyzBKsGVsyc4BTRs8olQ+SDq1kxvq3t8/6Jk6fxmTkU7K1tnBwKRhxKs1OgQpciluuErxZRiEvO5PHAG0+xQD9jJIl5ZMoVkdhB0n5y/rsugDoEzmq6oNkVZ17PdV3ep5jFkIQFBCQAPPnM/9LG9q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uCNwN7RE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69159C4CEEF;
	Wed,  9 Jul 2025 19:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752087795;
	bh=lSMeAZGO+rQcyXO17LJXWE7R5OHREkUaiHJQysbQyAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uCNwN7RE0zBLIznZQ4rO0vv2r6KKEzCUXW+lP5lOxzZmIRXBc7cjgAyerPJvMwj1L
	 uAg0enabL2soT/Hr6W0nfHHGxizr5YyaoWqJfpzASrenDnnvv2LzrnXHkPV8S7R/tN
	 ESyXzqb036DdvWfqou325nJDpUNJz7LHFcRtDCaS/NlBCrQdvQD4caLHg0qEt3eIY/
	 kTHI5g+2cj+/1A7f9JXOZGaMmJv4PUdSJygyRy4pD8ybIitR6OpW6MoIMwXN9297sf
	 BOpKQWEEWMlLhHb3KKRZP32Lxh7xn3+U6xM4sDL2mUmAq3y8w6I9uCOjNrpMOsSM0o
	 J78G7CngDS4qQ==
Date: Wed, 9 Jul 2025 21:03:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, vigneshr@ti.com, 
	andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, 
	jmkrzyszt@gmail.com, miaoqinglang@huawei.com, grygorii.strashko@ti.com, 
	wsa@kernel.org, Jean Delvare <khali@linux-fr.org>, 
	Komal Shah <komal_shah802003@yahoo.com>, Greg Kroah-Hartman <gregkh@suse.de>, linux-omap@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: omap: Handle omap_i2c_init() errors in
 omap_i2c_probe()
Message-ID: <joo6ibjqnsriouiw77fwc5kd2p2wd2junhlhe5nzivzot2jgac@q33qj637wt53>
References: <cover.1751701715.git.christophe.jaillet@wanadoo.fr>
 <565311abf9bafd7291ca82bcecb48c1fac1e727b.1751701715.git.christophe.jaillet@wanadoo.fr>
 <aG60GJy60Jf3w8tZ@roadster.musicnaut.iki.fi>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG60GJy60Jf3w8tZ@roadster.musicnaut.iki.fi>

Hi Aaro,

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

Good point! I will take care of it, no need to send a v2.

Thanks,
Andi

