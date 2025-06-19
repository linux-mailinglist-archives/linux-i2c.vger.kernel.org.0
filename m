Return-Path: <linux-i2c+bounces-11527-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A48EDAE0A64
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 17:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3E323B2FAB
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 15:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FC5231829;
	Thu, 19 Jun 2025 15:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtEyfa2K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E023085DB;
	Thu, 19 Jun 2025 15:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346901; cv=none; b=lAVDOS7/lcSUPqoZbHHgIueyFRYRSpTZycSgTi2ZbjExpjYo0FQVgDhuEEpHKj35pwQ+MpYA9V1uY3Nrx7Zj/ROJms1vikHVP/WDF11Gny5sBWxZ8gTne+ru9AIOLGKUAMkUr/N9mEN6jo8a2h4jUyQvmigy0u9DF//ETqqo0us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346901; c=relaxed/simple;
	bh=nkBVuy8yaSRVyY7240jNJJUyi5FunCZ+peQkhFA/csM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpPcsarb3ZkS2yenQdTwbl1sEcdDb4b+XBqz1xBN/b9HH1ecVWsUXObt/nAMPCJI27vFQq8QlLA4tsiX5rGMimzK+60E57ghnXSnn8cqpBT9DCEQJ5r2Q+ZFeI9DjUNUERc50po21EpIf3IWOTvtVZGqZsTNniRIfAcM80L0Bw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtEyfa2K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DFBC4CEEA;
	Thu, 19 Jun 2025 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750346901;
	bh=nkBVuy8yaSRVyY7240jNJJUyi5FunCZ+peQkhFA/csM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtEyfa2K8XZUovYXxPzSvi1B6sGFrKKf5w0404gJgSUfaiqDcwouKi3F5OY2vJRwH
	 tEgizBKEFsPK6NAhMu9Y/vxnEiUcvIgudryHoLidQKCNtyMfMFsbJ2KRPgMJellZkA
	 DvsqCB6tYVkm6bWc8YNG5fVkPRo/+2b0M2llnbJmkeyb8A8BZalVR1qZTL0MUwtMjE
	 fUbvdqYyJCLosgCmBnjTwqMXDbtNCghKERGQ0pxjoJRXMrAY/Q926eA1djUl3KWfyo
	 xa2Jztnw1w/aJ8IC1u3MaO2fGMLXMAcNndfCWf8NMyngNoWUdvkQjvLl/VzhJRKUUr
	 tkiEIDhWMvGcg==
Date: Thu, 19 Jun 2025 16:28:14 +0100
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
Message-ID: <20250619152814.GK795775@google.com>
References: <20250604041418.1188792-1-tmyu0@nuvoton.com>
 <20250604041418.1188792-2-tmyu0@nuvoton.com>
 <20250612140041.GF381401@google.com>
 <CAOoeyxVvZiD18qbGd5oUnqLNETKw50fJBjJO3vR50kon_a5_kA@mail.gmail.com>
 <20250612152313.GP381401@google.com>
 <CAOoeyxV-E_HQOBu0Pzfy0b0yJ2qbrW_C8pATCTWE4+PXqvHL6g@mail.gmail.com>
 <20250613131133.GR381401@google.com>
 <CAOoeyxXftk9QX_REgeQhuXSc9rEguzXkKVKDQdawU=NzGbo9oA@mail.gmail.com>
 <20250619115345.GL587864@google.com>
 <CAOoeyxXSTeypv2qQjcK1cSPtjch=gJGYzqoMsLQ-LJZ8Kwgd=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOoeyxXSTeypv2qQjcK1cSPtjch=gJGYzqoMsLQ-LJZ8Kwgd=w@mail.gmail.com>

On Thu, 19 Jun 2025, Ming Yu wrote:

> Lee Jones <lee@kernel.org> 於 2025年6月19日 週四 下午7:53寫道：
> >
> > On Fri, 13 Jun 2025, Ming Yu wrote:
> >
> > > Lee Jones <lee@kernel.org> 於 2025年6月13日 週五 下午9:11寫道：
> > > >
> > > > On Fri, 13 Jun 2025, Ming Yu wrote:
> > > >
> > > > > Lee Jones <lee@kernel.org> 於 2025年6月12日 週四 下午11:23寫道：
> > > > > >
> > > > > > On Thu, 12 Jun 2025, Ming Yu wrote:
> > > > > >
> > > > > > > Dear Lee,
> > > > > > >
> > > > > > > Thank you for reviewing,
> > > > > > >
> > > > > > > Lee Jones <lee@kernel.org> 於 2025年6月12日 週四 下午10:00寫道：
> > > > > > > >
> > > > > > > ...
> > > > > > > > > +static const struct mfd_cell nct6694_devs[] = {
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
> > > > > > > > > +
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
> > > > > > > >
> > > > > > > > Why have we gone back to this silly numbering scheme?
> > > > > > > >
> > > > > > > > What happened to using IDA in the child driver?
> > > > > > > >
> > > > > > >
> > > > > > > In a previous version, I tried to maintain a static IDA in each
> > > > > > > sub-driver. However, I didn’t consider the case where multiple NCT6694
> > > > > > > devices are bound to the same driver — in that case, the IDs are not
> > > > > > > fixed and become unusable for my purpose.
> > > > > >
> > > > > > Not sure I understand.
> > > > > >
> > > > >
> > > > > As far as I know, if I maintain the IDA in the sub-drivers and use
> > > > > multiple MFD_CELL_NAME("nct6694-gpio") entries in the MFD, the first
> > > > > NCT6694 device bound to the GPIO driver will receive IDs 0~15.
> > > > > However, when a second NCT6694 device is connected to the system, it
> > > > > will receive IDs 16~31.
> > > > > Because of this behavior, I switched back to using platform_device->id.
> > > >
> > > > Each of the devices will probe once.
> > > >
> > > > The first one will be given 0, the second will be given 1, etc.
> > > >
> > > > Why would you give multiple IDs to a single device bound to a driver?
> > > >
> > >
> > > The device exposes multiple peripherals — 16 GPIO controllers, 6 I2C
> > > adapters, 2 CAN FD controllers, and 2 watchdog timers. Each peripheral
> > > is independently addressable, has its own register region, and can
> > > operate in isolation. The IDs are used to distinguish between these
> > > instances.
> > > For example, the GPIO driver will be probed 16 times, allocating 16
> > > separate gpio_chip instances to control 8 GPIO lines each.
> > >
> > > If another device binds to this driver, it is expected to expose
> > > peripherals with the same structure and behavior.
> >
> > I still don't see why having a per-device IDA wouldn't render each
> > probed device with its own ID.  Just as you have above.
> >
> 
> For example, when the MFD driver and the I2C sub-driver are loaded,
> connecting the first NCT6694 USB device to the system results in 6
> nct6694-i2c platform devices being created and bound to the
> i2c-nct6694 driver. These devices receive IDs 0 through 5 via the IDA.
> 
> However, when a second NCT6694 USB device is connected, its
> corresponding nct6694-i2c platform devices receive IDs 6 through 11 —
> instead of 0 through 5 as I originally expected.
> 
> If I've misunderstood something, please feel free to correct me. Thank you!

In the code above you register 6 I2C devices.  Each device will be
assigned a platform ID 0 through 5. The .probe() function in the I2C
driver will be executed 6 times.  In each of those calls to .probe(),
instead of pre-allocating a contiguous assignment of IDs here, you
should be able to use IDA in .probe() to allocate those same device IDs
0 through 5.

What am I missing here?

-- 
Lee Jones [李琼斯]

