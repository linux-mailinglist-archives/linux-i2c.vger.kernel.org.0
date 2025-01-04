Return-Path: <linux-i2c+bounces-8914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A03A01133
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 01:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93BDD163618
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 00:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397DC1C01;
	Sat,  4 Jan 2025 00:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LclNP1Vk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FFCA29;
	Sat,  4 Jan 2025 00:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735948976; cv=none; b=oS351nrmDt7U/iRP/NoRJSAZxCHTT1bVBddou2JqS8lnYIXEzx/UrrQfrfo46TbhUr+bQDuSUpFGa1uKrDngL5FdzzM9PjietfOW1T7MjbLPa1Kfza467dZrWq4P7aMROKKSWFWO/Nz4pc29v11OUBaG4LrbVHhieOJ+ev/eutc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735948976; c=relaxed/simple;
	bh=TE63Ok9/k2mxRdrtTCnTzYnZSgktDJM8WGR5CCypWOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0xZiZbRZ5guGBsFVf8ks9eYqBwqOGoWkBJayYOxPOVIRHY3r0DmCz4OUheQPqwqJXkMflUmlX7vIrfni2/tNaXRAqq6Brd4C9chfZxFSg/1OepVhnL8cQxWwWKkJP1sg96mB+ZViZGD851tSJLZ/EBGL8nEZLHX0g8PR+i+OqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LclNP1Vk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E193CC4CEDE;
	Sat,  4 Jan 2025 00:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735948975;
	bh=TE63Ok9/k2mxRdrtTCnTzYnZSgktDJM8WGR5CCypWOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LclNP1Vk5tmWjrsKW4K7ZB1NqpCMwbZW3yGH8htuNDU6CFDHM5brGg9/Hiaes1CLN
	 +6bEWICChpndHl2pA50hXLIIsg2W6B/2mbuficfoBXHB8KkKe5KvzKZhB6GN7XUq69
	 67fiet5wD58jq50X83XwbFVwsLbGIa21rO17f5O7qTmexQP0Kr+xbIdiBcDieUJZHk
	 E4ez3/FzpjhX24jGU1apT8ZoFKzqX/9jQSkkzcO/EHbCQfgRI1OWxcm90pjUGlQ/Ql
	 wQ/2SxKk0KQ05tHwO6Ch2Itl49iHaDiTyMcNp3EUDhlNgwNrIHeR3d5OsW5o1TwgZG
	 JdAbOxiCUE6ng==
Date: Sat, 4 Jan 2025 01:02:51 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] i2c: davinci: kill platform data
Message-ID: <fxj2tqrjfr23cxqmtmpj74bombtfjn3qtpz5iiegvhbap7v5md@pkmrskwamatl>
References: <20241211102337.37956-1-brgl@bgdev.pl>
 <awney7utrl5n63xsgzxnnlpqajuqtjnrjsbpzloic5iqt4pv2u@ktkhejuihbde>
 <CAMRc=Mci6bPCirruk90hnjBvJW0=HKhqCq+9p4t2k9B=Oy8Ocw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mci6bPCirruk90hnjBvJW0=HKhqCq+9p4t2k9B=Oy8Ocw@mail.gmail.com>

Hi Bartosz,

On Thu, Jan 02, 2025 at 01:44:10PM +0100, Bartosz Golaszewski wrote:
> On Fri, Dec 27, 2024 at 12:41 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> >
> > Hi Bartosz,
> >
> > ...
> >
> > >  struct davinci_i2c_dev {
> > >       struct device           *dev;
> > >       void __iomem            *base;
> > > @@ -132,13 +133,10 @@ struct davinci_i2c_dev {
> > >  #ifdef CONFIG_CPU_FREQ
> > >       struct notifier_block   freq_transition;
> > >  #endif
> > > -     struct davinci_i2c_platform_data *pdata;
> > > -};
> > > -
> > > -/* default platform data to use if not supplied in the platform_device */
> > > -static struct davinci_i2c_platform_data davinci_i2c_platform_data_default = {
> > > -     .bus_freq       = 100,
> > > -     .bus_delay      = 0,
> >
> > what happened to bus_delay?
> >
> 
> bus_delay is not set by means other than platform data and it defaults
> to 0 so it's safe to just remove it.

yes, but how is it related to this patch? Can we put it on a
different patch?

Thanks,
Andi

> > ...
> >
> > > +     /* standard bus frequency (kHz) */
> > > +     unsigned int            bus_freq;
> > > +     /* Chip has a ICPFUNC register */
> > > +     bool                    has_pfunc;
> > >  };
> >
> > > -static struct i2c_bus_recovery_info davinci_i2c_gpio_recovery_info = {
> > > -     .recover_bus = i2c_generic_scl_recovery,
> > > -     .prepare_recovery = davinci_i2c_prepare_recovery,
> > > -     .unprepare_recovery = davinci_i2c_unprepare_recovery,
> > > -};
> > > -
> >
> > what happened to the gpio_recovery_info?
> >
> 
> Similar story: it's only ever used if there's a pdata-provided
> recovery GPIO line set but nobody does it anymore.
> 
> Bartosz

