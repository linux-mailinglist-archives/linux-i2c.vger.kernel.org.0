Return-Path: <linux-i2c+bounces-11530-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46887AE0B45
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 18:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88F083A9C34
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 16:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03FC28BA82;
	Thu, 19 Jun 2025 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UZjTVYXA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3772BCF5;
	Thu, 19 Jun 2025 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750350050; cv=none; b=V8lHowKiEZUpMsPqGrC6D+ivTNfxk9Z7NDa12Xk8mQl04yXUq+GNd8kZvTsLUxvjPUm6gXQH6bv1ldEBv42GdN0FPyqDnjpNDC4UsJ1PHYx6HzKHDFodo2Y9POmaAuiJns3PnYwLhBnDp4jAypiAvbs9Gnee7N6VQdwGIVbdFZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750350050; c=relaxed/simple;
	bh=0cK3MBCollfYDzJaHmtoeXygpX004TDISddH5chzKRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hb9a1L8LkzzWVkmQCMOsbxkYF3lx07MQlKaQXN0r/VXjFWO0tWHuXUlK+gKsQdpn40Zz3LCpI3zh7YiQUik8Vyhz4NhnIkso0d1vFFGN8f+T84NWchFKwFgRB4eYK1OF9zX0cJMkHZdzELAU3bXPLOy4orJddS2S7nvNhe2SW2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UZjTVYXA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422F8C4CEEA;
	Thu, 19 Jun 2025 16:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750350049;
	bh=0cK3MBCollfYDzJaHmtoeXygpX004TDISddH5chzKRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UZjTVYXAvBhH5UnXSAzKI3yDcTnJVUcSZuFkUztSoNjHYoD6/nwAJKzmxNQw6Mrnt
	 r4ZAQq/+/b18dMcjs4WiVT4KGC56tfvD1Kmy6cfTJm4YV+qyUPeo9NHcsKPmUVBpjJ
	 3oEdCYuaKTOiUuuPOnV7WcxlYIEwZC9NQF8rPbHw=
Date: Thu, 19 Jun 2025 18:20:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: Lee Jones <lee@kernel.org>, linus.walleij@linaro.org, brgl@bgdev.pl,
	andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <2025061910-skies-outgoing-89cc@gregkh>
References: <20250612140041.GF381401@google.com>
 <CAOoeyxVvZiD18qbGd5oUnqLNETKw50fJBjJO3vR50kon_a5_kA@mail.gmail.com>
 <20250612152313.GP381401@google.com>
 <CAOoeyxV-E_HQOBu0Pzfy0b0yJ2qbrW_C8pATCTWE4+PXqvHL6g@mail.gmail.com>
 <20250613131133.GR381401@google.com>
 <CAOoeyxXftk9QX_REgeQhuXSc9rEguzXkKVKDQdawU=NzGbo9oA@mail.gmail.com>
 <20250619115345.GL587864@google.com>
 <CAOoeyxXSTeypv2qQjcK1cSPtjch=gJGYzqoMsLQ-LJZ8Kwgd=w@mail.gmail.com>
 <20250619152814.GK795775@google.com>
 <CAOoeyxU7eQneBuxbBqepta29q_OHPzrkN4SKmj6RX72L3Euw5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOoeyxU7eQneBuxbBqepta29q_OHPzrkN4SKmj6RX72L3Euw5A@mail.gmail.com>

On Fri, Jun 20, 2025 at 12:03:01AM +0800, Ming Yu wrote:
> Lee Jones <lee@kernel.org> 於 2025年6月19日 週四 下午11:28寫道：
> >
> > On Thu, 19 Jun 2025, Ming Yu wrote:
> >
> > > Lee Jones <lee@kernel.org> 於 2025年6月19日 週四 下午7:53寫道：
> > > >
> > > > On Fri, 13 Jun 2025, Ming Yu wrote:
> > > >
> > > > > Lee Jones <lee@kernel.org> 於 2025年6月13日 週五 下午9:11寫道：
> > > > > >
> > > > > > On Fri, 13 Jun 2025, Ming Yu wrote:
> > > > > >
> > > > > > > Lee Jones <lee@kernel.org> 於 2025年6月12日 週四 下午11:23寫道：
> > > > > > > >
> > > > > > > > On Thu, 12 Jun 2025, Ming Yu wrote:
> > > > > > > >
> > > > > > > > > Dear Lee,
> > > > > > > > >
> > > > > > > > > Thank you for reviewing,
> > > > > > > > >
> > > > > > > > > Lee Jones <lee@kernel.org> 於 2025年6月12日 週四 下午10:00寫道：
> > > > > > > > > >
> > > > > > > > > ...
> > > > > > > > > > > +static const struct mfd_cell nct6694_devs[] = {
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
> > > > > > > > > > > +
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
> > > > > > > > > >
> > > > > > > > > > Why have we gone back to this silly numbering scheme?
> > > > > > > > > >
> > > > > > > > > > What happened to using IDA in the child driver?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > In a previous version, I tried to maintain a static IDA in each
> > > > > > > > > sub-driver. However, I didn’t consider the case where multiple NCT6694
> > > > > > > > > devices are bound to the same driver — in that case, the IDs are not
> > > > > > > > > fixed and become unusable for my purpose.
> > > > > > > >
> > > > > > > > Not sure I understand.
> > > > > > > >
> > > > > > >
> > > > > > > As far as I know, if I maintain the IDA in the sub-drivers and use
> > > > > > > multiple MFD_CELL_NAME("nct6694-gpio") entries in the MFD, the first
> > > > > > > NCT6694 device bound to the GPIO driver will receive IDs 0~15.
> > > > > > > However, when a second NCT6694 device is connected to the system, it
> > > > > > > will receive IDs 16~31.
> > > > > > > Because of this behavior, I switched back to using platform_device->id.
> > > > > >
> > > > > > Each of the devices will probe once.
> > > > > >
> > > > > > The first one will be given 0, the second will be given 1, etc.
> > > > > >
> > > > > > Why would you give multiple IDs to a single device bound to a driver?
> > > > > >
> > > > >
> > > > > The device exposes multiple peripherals — 16 GPIO controllers, 6 I2C
> > > > > adapters, 2 CAN FD controllers, and 2 watchdog timers. Each peripheral
> > > > > is independently addressable, has its own register region, and can
> > > > > operate in isolation. The IDs are used to distinguish between these
> > > > > instances.
> > > > > For example, the GPIO driver will be probed 16 times, allocating 16
> > > > > separate gpio_chip instances to control 8 GPIO lines each.
> > > > >
> > > > > If another device binds to this driver, it is expected to expose
> > > > > peripherals with the same structure and behavior.
> > > >
> > > > I still don't see why having a per-device IDA wouldn't render each
> > > > probed device with its own ID.  Just as you have above.
> > > >
> > >
> > > For example, when the MFD driver and the I2C sub-driver are loaded,
> > > connecting the first NCT6694 USB device to the system results in 6
> > > nct6694-i2c platform devices being created and bound to the
> > > i2c-nct6694 driver. These devices receive IDs 0 through 5 via the IDA.
> > >
> > > However, when a second NCT6694 USB device is connected, its
> > > corresponding nct6694-i2c platform devices receive IDs 6 through 11 —
> > > instead of 0 through 5 as I originally expected.
> > >
> > > If I've misunderstood something, please feel free to correct me. Thank you!
> >
> > In the code above you register 6 I2C devices.  Each device will be
> > assigned a platform ID 0 through 5. The .probe() function in the I2C
> > driver will be executed 6 times.  In each of those calls to .probe(),
> > instead of pre-allocating a contiguous assignment of IDs here, you
> > should be able to use IDA in .probe() to allocate those same device IDs
> > 0 through 5.
> >
> > What am I missing here?
> >
> 
> You're absolutely right in the scenario where a single NCT6694 device
> is present. However, I’m wondering how we should handle the case where
> a second or even third NCT6694 device is bound to the same MFD driver.
> In that situation, the sub-drivers using a static IDA will continue
> allocating increasing IDs, rather than restarting from 0 for each
> device. How should this be handled?

What is wrong with increasing ids?  The id value means nothing, they
just have to be unique.

thanks,

greg k-h

