Return-Path: <linux-i2c+bounces-11587-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F02AE8726
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 16:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61B183BEBB5
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 14:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BAA2620CF;
	Wed, 25 Jun 2025 14:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vEVPBNft"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D1F1D5165;
	Wed, 25 Jun 2025 14:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863209; cv=none; b=kU4zPKBm8njAFWmdB2XmLsZyVnDL64sEsZxyfZZONdNCOP+884WlIyUS1DpXY+2YdN7THbmsxabFVj3eV92/K/gQkJWEhZouk7iLCp+4zUPFt67K1Nta41DuogIXy/S7ZKTWN9ZOItIZczy6vWHo58kR5AMO9hykH0lxsokxsK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863209; c=relaxed/simple;
	bh=IJe6mOkdno5hFkqOuZzP6lWj3MzgBpaudeFCugaeW5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAt1tjPIzZkIJoIYkr0k3ztq16seMjP5OlFLwx5w6umNWdUV9k5Ks5ogMJWUTHt8beFoObIk1koseH25F2THMP2hqTb2m0V2ukh0WTZvtrdgqs3nWzP068ylvqTKb0036VMZg2aN7V23ciQOH1RtEjaY1k/a7J2ClgAslOUnkqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vEVPBNft; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECC9C4CEEA;
	Wed, 25 Jun 2025 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750863208;
	bh=IJe6mOkdno5hFkqOuZzP6lWj3MzgBpaudeFCugaeW5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vEVPBNft67yFnyq10OuAhQPYNrznG7vdFztn5fo09zOvfI1ukOyexva0fcqBcgH1+
	 Poc+Rb0Q5wYPAF/RBKgwIjSfT2BhCBTKF+H8lEqIVVYj1XhQ6eqImEr0zIkf9KMqw7
	 wiDedspcBMpswvzBkjaXn7mWBDM8TOacEww3P7XsmLAiB3sIDsxxwTjSwKOjvnR7Q1
	 1NxF/XUkzI+5ZbrxOPPItZejLHz6Wxesu97Cz+s5IctHQ6Mtt4IqKBjldDxRny3SM9
	 0ysMFTmtKsCs2h7HEwnIh6QfiPwtGQI/kkcruqpQN+baPGTpL/7UmgHyPI+QBY9a7o
	 2QdK6TZwf1GhQ==
Date: Wed, 25 Jun 2025 15:53:21 +0100
From: Lee Jones <lee@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
	linux@roeck-us.net, jdelvare@suse.com,
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250625145321.GZ795775@google.com>
References: <20250613131133.GR381401@google.com>
 <CAOoeyxXftk9QX_REgeQhuXSc9rEguzXkKVKDQdawU=NzGbo9oA@mail.gmail.com>
 <20250619115345.GL587864@google.com>
 <CAOoeyxXSTeypv2qQjcK1cSPtjch=gJGYzqoMsLQ-LJZ8Kwgd=w@mail.gmail.com>
 <20250619152814.GK795775@google.com>
 <CAOoeyxU7eQneBuxbBqepta29q_OHPzrkN4SKmj6RX72L3Euw5A@mail.gmail.com>
 <20250625090133.GP795775@google.com>
 <CAOoeyxWoxC-n3JjjFe8Ruq_VydXk=jev=mopKfL5B7gsaSg=Ag@mail.gmail.com>
 <20250625134634.GY795775@google.com>
 <CAOoeyxVuu-kKoQa84mGOX=thAc0hnzQU8L=MnycoRRhzoZMnNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOoeyxVuu-kKoQa84mGOX=thAc0hnzQU8L=MnycoRRhzoZMnNw@mail.gmail.com>

[...]

> > > > > > In the code above you register 6 I2C devices.  Each device will be
> > > > > > assigned a platform ID 0 through 5. The .probe() function in the I2C
> > > > > > driver will be executed 6 times.  In each of those calls to .probe(),
> > > > > > instead of pre-allocating a contiguous assignment of IDs here, you
> > > > > > should be able to use IDA in .probe() to allocate those same device IDs
> > > > > > 0 through 5.
> > > > > >
> > > > > > What am I missing here?
> > > > > >
> > > > >
> > > > > You're absolutely right in the scenario where a single NCT6694 device
> > > > > is present. However, I’m wondering how we should handle the case where
> > > > > a second or even third NCT6694 device is bound to the same MFD driver.
> > > > > In that situation, the sub-drivers using a static IDA will continue
> > > > > allocating increasing IDs, rather than restarting from 0 for each
> > > > > device. How should this be handled?
> > > >
> > > > I'd like to see the implementation of this before advising.
> > > >
> > > > In such a case, I assume there would be a differentiating factor between
> > > > the two (or three) devices.  You would then use that to decide which IDA
> > > > would need to be incremented.
> > > >
> > > > However, Greg is correct.  Hard-coding look-ups for userspace to use
> > > > sounds like a terrible idea.
> > > >
> > >
> > > I understand.
> > > Do you think it would be better to pass the index via platform_data
> > > and use PLATFORM_DEVID_AUTO together with mfd_add_hotplug_devices()
> > > instead?
> > > For example:
> > > struct nct6694_platform_data {
> > >     int index;
> > > };
> > >
> > > static struct nct6694_platform_data i2c_data[] = {
> > >     { .index = 0 }, { .index = 1 }, { .index = 2 }, { .index = 3 }, {
> > > .index = 4 }, { .index = 5 },
> > > };
> > >
> > > static const struct mfd_cell nct6694_devs[] = {
> > >     MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[0], sizeof(struct
> > > nct6694_platform_data), 0),
> > >     MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[1], sizeof(struct
> > > nct6694_platform_data), 0),
> > >     MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[2], sizeof(struct
> > > nct6694_platform_data), 0),
> > >     MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[3], sizeof(struct
> > > nct6694_platform_data), 0),
> > >     MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[4], sizeof(struct
> > > nct6694_platform_data), 0),
> > >     MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[5], sizeof(struct
> > > nct6694_platform_data), 0),
> > > };
> > > ...
> > > mfd_add_hotplug_devices(dev, nct6694_devs, ARRAY_SIZE(nct6694_devs));
> > > ...
> >
> > No, that's clearly way worse.  =:-)
> >
> > The clean-up that this provides is probably not worth all of this
> > discussion.  I _still_ think this enumeration should be done in the
> > driver.  But if you really can't make it work, I'll accept the .id
> > patch.
> >
> 
> Okay, I would like to ask for your advice regarding the implementation of IDA.
> 
> Using a global IDA in the sub-driver like this:
> (in i2c-nct6694.c)
> static DEFINE_IDA(nct6694_i2c_ida);
> 
> static int nct6694_i2c_probe(struct platform_device *pdev)
> {
>     ida_alloc(&nct6694_i2c_ida, GFP_KERNEL);
>     ...
> }
> 
> causes IDs to be globally incremented across all devices. For example,
> the first NCT6694 device gets probed 6 times and receives IDs 0–5, but
> when a second NCT6694 device is added, it receives IDs starting from
> 6, rather than starting again from 0. This makes per-device ID mapping
> unreliable.
> 
> To solve this, I believe the right approach is to have each NCT6694
> instance maintain its own IDA, managed by the MFD driver's private
> data. As mentioned earlier, for example:
> (in nct6694.c)
> struct nct6694 {
>     struct device *dev;
>     struct ida i2c_ida;
> };
> 
> static int nct6694_probe(struct platform_device *pdev)
> {
>     ...
>     ida_init(&nct6694->i2c_ida);
>     ...
> }
> 
> (in i2c-nct6694.c)
> static int nct6694_i2c_probe(struct platform_device *pdev)
> {
>     id = ida_alloc(&nct6694->i2c_ida, GFP_KERNEL);
> }
> 
> This way, each device allocates IDs independently, and each set of
> I2C/GPIO instances gets predictable IDs starting from 0 per device. I
> think this resolves the original issue without relying on hardcoded
> platform IDs.
> Please let me know if this implementation aligns with what you had in mind.

This sounds like an acceptable way forward.

-- 
Lee Jones [李琼斯]

