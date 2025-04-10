Return-Path: <linux-i2c+bounces-10252-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CE2A83CB4
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 10:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 970A41B66567
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 08:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D932920B813;
	Thu, 10 Apr 2025 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHqX2mW9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2591F03F8;
	Thu, 10 Apr 2025 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273301; cv=none; b=Me5k3mf7j6UjOFKwb45FB0FSEaiYEo0gJwWAlbRLsQzqlxlFYu4sbZn9rJh1oWtrkskbcXGaJqEsB6rkVXS0zPoPDYkAfd23dOU5I7DFA/DpkCTDQ4gSyV0p+RL0FSgP5FGTsNmsh2d4pNgKBJiwLAdKy6OYThrTmobRExA9ywk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273301; c=relaxed/simple;
	bh=oE27GsIInnvywdfxX0MmCMRtS+md3d+J5Fr+8BysSMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E05KcU0ClR4Rp3XZkTldFE7FhkEP2zLeXhUusgQe4IO6UaN+ys90uyQGG/z+sk1xxa/7zC0ljRhYmsiz4IjHJZDGsfnkAeq3Tro0AhEPrKQh/IoTXXO267T79U00+doSZ2WsYOMR4tSbbDnS+Vdmy8EBNyC69/9/cInYg0fp2MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHqX2mW9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64388C4CEDD;
	Thu, 10 Apr 2025 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744273299;
	bh=oE27GsIInnvywdfxX0MmCMRtS+md3d+J5Fr+8BysSMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHqX2mW9Zjwnt70+e0Tz0XPrkqHOtRGF/P69tBC+UmJYQMsTed3SOZ6EedJfZQjJf
	 w5WM/9bt71oA38jm3o63EOmToJHx3UbTjhrYeefhAbILWJAiS4q2QYJCpHJKwlNh/k
	 9vLO59VSIZvsqYux6o1BoYYbkm+yBbt0SRVK1BiBAJNOmgZqDhlqn5ZETEFunMsnt/
	 hy8+o0EY1K8T63ZQA9+4sGRhftCcM4NfBud/wrw7vfKy1IL/gwad2OjFwt/ot38+uO
	 bkvkWMHcrxxDykCGGY9OBhCTC4GGOUT1ZZpem2HTqfbnsdf3mdhSFb8qkstBZH9WhH
	 JvucG4tU7jseg==
Date: Thu, 10 Apr 2025 09:21:32 +0100
From: Lee Jones <lee@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl,
	andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250410082132.GP372032@google.com>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-2-a0282524688@gmail.com>
 <20250307011542.GE8350@google.com>
 <CAOoeyxUgiTqtSksfHopEDhZHwNkUq9+d-ojo8ma3PX2dosuwyQ@mail.gmail.com>
 <20250320145042.GS3890718@google.com>
 <CAOoeyxXZmrzBSNRdRx9vK84m5Z5y8T_A+wY98vVrPUZ7f4w4iw@mail.gmail.com>
 <20250404142115.GC278642@google.com>
 <CAOoeyxVVgHGkH5ajQT0NGNPv7FmVPLzuZtGjCiF7mRRto70aAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOoeyxVVgHGkH5ajQT0NGNPv7FmVPLzuZtGjCiF7mRRto70aAg@mail.gmail.com>

On Mon, 07 Apr 2025, Ming Yu wrote:

> Lee Jones <lee@kernel.org> 於 2025年4月4日 週五 下午10:21寫道：
> >
> > > ...
> > > > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x1),
> > > > > >
> > > > > > IDs are usually given in base-10.
> > > > > >
> > > > >
> > > > > Fix it in v9.
> > > > >
> > > > > > Why are you manually adding the device IDs?
> > > > > >
> > > > > > PLATFORM_DEVID_AUTO doesn't work for you?
> > > > > >
> > > > >
> > > > > I need to manage these IDs to ensure that child devices can be
> > > > > properly utilized within their respective modules.
> > > >
> > > > How?  Please explain.
> > > >
> > > > This numbering looks sequential and arbitrary.
> > > >
> > > > What does PLATFORM_DEVID_AUTO do differently such that it is not useful?
> > > >
> > >
> > > As far as I know, PLATFORM_DEVID_AUTO assigns dynamic IDs to devices,
> > > but I need fixed IDs.
> > > For example, the GPIO driver relies on these IDs to determine the
> > > group, allowing the firmware to identify which GPIO group to operate
> > > on through the API.
> >
> > PLATFORM_DEVID_AUTO will allocate IDs 0 through 16, the same as you've
> > done here.  These lines do not have any differentiating attributes, so
> > either way we are not allocating specific IDs to specific pieces of the
> > H/W.  I still do not understand why you need to allocate them manually.
> >
> 
> I'm using PLATFORM_DEVID_AUTO to allocate child device IDs with
> MFD_CELL_NAME(), like this:
> 
> static const struct mfd_cell nct6694_dev[] = {
>     MFD_CELL_NAME("nct6694-gpio"),
>     MFD_CELL_NAME("nct6694-gpio"),
>     ......
>     MFD_CELL_NAME("nct6694-gpio"),
>     MFD_CELL_NAME("nct6694-i2c"),
>     MFD_CELL_NAME("nct6694-i2c"),
>     ......
>     MFD_CELL_NAME("nct6694-i2c"),
>     ......
> };
> 
> For example, the device IDs retrieved in gpio-nct6694.c is 1~16, and
> i2c-nct6694.c is 17~22. Does this mean each driver should
> independently handle its dynamically assigned IDs?
> Additionally, I originally referred to cgbc-core.c with i2c-cgbc.c,
> and ab8500-core.c with pwm-ab8500.c for associating child devices. Do
> you think this approach is appropriate in my case?

Yes, if you _need_ the ranges to start from 0, then you will have to
call mfd_add_devices() separately on those ranges.  Otherwise one range
will follow directly on to another range.

But wait, you're using mfd_add_hotplug_devices(), which means you are
using PLATFORM_DEVID_AUTO.  So your .id values that you've added are
being ignored anyway.  Thus, if you have tested that this works, you
don't need them anyway, right?

-- 
Lee Jones [李琼斯]

