Return-Path: <linux-i2c+bounces-11535-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4B6AE12C1
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 07:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD4727AC814
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 05:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32472036F3;
	Fri, 20 Jun 2025 05:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ksO9gZ48"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0BC2A8C1;
	Fri, 20 Jun 2025 05:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750395743; cv=none; b=DyesaGLr/Ez9YIUFBcfeUD85CA2Jd7vFaHdOpoVkfr2J4kkKms3UxfA1GFj3knTbqWtvEd+xBoEP7X+RSsQ3h6x0CDuUYkppc2FzpBCV55jjwy6KbQHcwwe2AzUSTkxFcZH7Whk1ufEupGkT/ek2NnNsR9yBy33HLg/OkaSO0DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750395743; c=relaxed/simple;
	bh=D9l67I4gVQ1Zk7K1SD18ucSocCnCM8EvcaI1dWXIpis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaW0+kzoOYjVgRZYXmMHg3PNtKOyD0BCTfK8W/axF4fnCXsGESdOZpDehg/RiaFLL7cvPngKe1kCt/6VU0F6exXmYqflRTwVaS3e9o63Nx7k4suvyEYfJngy1Q0VcPi3mJDGqsS+dYKr11qP+8qixXnE5MvS0jfgS3i59bG/c80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ksO9gZ48; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56176C4CEE3;
	Fri, 20 Jun 2025 05:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750395742;
	bh=D9l67I4gVQ1Zk7K1SD18ucSocCnCM8EvcaI1dWXIpis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ksO9gZ48Ucnptc+udebuWMyQsSgJYaVlDw5nZFSowhmwnScVLR5NgleScED/xgcxF
	 9Z/IElzQpDNcCyROEv3mvyaJ35Yfrx0vUGNvvt5nup+yMJoTPJkmjf9VJ6+5pQ1EQI
	 aICfckMyyWxRGjyoquAYOq6Ny7u8KwzfCMQ2hUac=
Date: Fri, 20 Jun 2025 07:02:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>,
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
	jdelvare@suse.com, alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <2025062058-caddie-rendering-3bf1@gregkh>
References: <20250613131133.GR381401@google.com>
 <CAOoeyxXftk9QX_REgeQhuXSc9rEguzXkKVKDQdawU=NzGbo9oA@mail.gmail.com>
 <20250619115345.GL587864@google.com>
 <CAOoeyxXSTeypv2qQjcK1cSPtjch=gJGYzqoMsLQ-LJZ8Kwgd=w@mail.gmail.com>
 <20250619152814.GK795775@google.com>
 <CAOoeyxU7eQneBuxbBqepta29q_OHPzrkN4SKmj6RX72L3Euw5A@mail.gmail.com>
 <2025061910-skies-outgoing-89cc@gregkh>
 <644dfd66-ad30-47cb-9ec4-50d9a003433b@roeck-us.net>
 <2025061914-sternum-factoid-4269@gregkh>
 <CAOoeyxUcB1xc_kMBADWoV8RnnFJ+uCYa_kJ7_BdyR8W_WZfsAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOoeyxUcB1xc_kMBADWoV8RnnFJ+uCYa_kJ7_BdyR8W_WZfsAg@mail.gmail.com>

On Fri, Jun 20, 2025 at 10:54:44AM +0800, Ming Yu wrote:
> Dear Guenter and Greg,
> 
> Thank you for reviewing,
> 
> Greg KH <gregkh@linuxfoundation.org> 於 2025年6月20日 週五 上午1:18寫道：
> >
> > On Thu, Jun 19, 2025 at 09:58:04AM -0700, Guenter Roeck wrote:
> > > On 6/19/25 09:20, Greg KH wrote:
> > > > On Fri, Jun 20, 2025 at 12:03:01AM +0800, Ming Yu wrote:
> > > > > Lee Jones <lee@kernel.org> 於 2025年6月19日 週四 下午11:28寫道：
> > > > > >
> > > > > > On Thu, 19 Jun 2025, Ming Yu wrote:
> > > > > >
> > > > > > > Lee Jones <lee@kernel.org> 於 2025年6月19日 週四 下午7:53寫道：
> > > > > > > >
> > > > > > > > On Fri, 13 Jun 2025, Ming Yu wrote:
> > > > > > > >
> > > > > > > > > Lee Jones <lee@kernel.org> 於 2025年6月13日 週五 下午9:11寫道：
> > > > > > > > > >
> > > > > > > > > > On Fri, 13 Jun 2025, Ming Yu wrote:
> > > > > > > > > >
> > > > > > > > > > > Lee Jones <lee@kernel.org> 於 2025年6月12日 週四 下午11:23寫道：
> > > > > > > > > > > >
> > > > > > > > > > > > On Thu, 12 Jun 2025, Ming Yu wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > > Dear Lee,
> > > > > > > > > > > > >
> > > > > > > > > > > > > Thank you for reviewing,
> > > > > > > > > > > > >
> > > > > > > > > > > > > Lee Jones <lee@kernel.org> 於 2025年6月12日 週四 下午10:00寫道：
> > > > > > > > > > > > > >
> > > > > > > > > > > > > ...
> > > > > > > > > > > > > > > +static const struct mfd_cell nct6694_devs[] = {
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> > > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Why have we gone back to this silly numbering scheme?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > What happened to using IDA in the child driver?
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > In a previous version, I tried to maintain a static IDA in each
> > > > > > > > > > > > > sub-driver. However, I didn’t consider the case where multiple NCT6694
> > > > > > > > > > > > > devices are bound to the same driver — in that case, the IDs are not
> > > > > > > > > > > > > fixed and become unusable for my purpose.
> > > > > > > > > > > >
> > > > > > > > > > > > Not sure I understand.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > As far as I know, if I maintain the IDA in the sub-drivers and use
> > > > > > > > > > > multiple MFD_CELL_NAME("nct6694-gpio") entries in the MFD, the first
> > > > > > > > > > > NCT6694 device bound to the GPIO driver will receive IDs 0~15.
> > > > > > > > > > > However, when a second NCT6694 device is connected to the system, it
> > > > > > > > > > > will receive IDs 16~31.
> > > > > > > > > > > Because of this behavior, I switched back to using platform_device->id.
> > > > > > > > > >
> > > > > > > > > > Each of the devices will probe once.
> > > > > > > > > >
> > > > > > > > > > The first one will be given 0, the second will be given 1, etc.
> > > > > > > > > >
> > > > > > > > > > Why would you give multiple IDs to a single device bound to a driver?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > The device exposes multiple peripherals — 16 GPIO controllers, 6 I2C
> > > > > > > > > adapters, 2 CAN FD controllers, and 2 watchdog timers. Each peripheral
> > > > > > > > > is independently addressable, has its own register region, and can
> > > > > > > > > operate in isolation. The IDs are used to distinguish between these
> > > > > > > > > instances.
> > > > > > > > > For example, the GPIO driver will be probed 16 times, allocating 16
> > > > > > > > > separate gpio_chip instances to control 8 GPIO lines each.
> > > > > > > > >
> > > > > > > > > If another device binds to this driver, it is expected to expose
> > > > > > > > > peripherals with the same structure and behavior.
> > > > > > > >
> > > > > > > > I still don't see why having a per-device IDA wouldn't render each
> > > > > > > > probed device with its own ID.  Just as you have above.
> > > > > > > >
> > > > > > >
> > > > > > > For example, when the MFD driver and the I2C sub-driver are loaded,
> > > > > > > connecting the first NCT6694 USB device to the system results in 6
> > > > > > > nct6694-i2c platform devices being created and bound to the
> > > > > > > i2c-nct6694 driver. These devices receive IDs 0 through 5 via the IDA.
> > > > > > >
> > > > > > > However, when a second NCT6694 USB device is connected, its
> > > > > > > corresponding nct6694-i2c platform devices receive IDs 6 through 11 —
> > > > > > > instead of 0 through 5 as I originally expected.
> > > > > > >
> > > > > > > If I've misunderstood something, please feel free to correct me. Thank you!
> > > > > >
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
> > > > What is wrong with increasing ids?  The id value means nothing, they
> > > > just have to be unique.
> > > >
> > >
> > > Unless they are used in the client driver as index into an array, as in
> > > "this is the Nth instance of this device for this chip". There has to be
> > > _some_ means to pass N to the client driver.
> >
> > Ick, that should just be walking the list of child devices instead, as
> > obviously no one is hard coding array sizes for devices these days,
> > right?  :)
> >
> > Anyway, sure, if you _have_ to have a specific id, then use a specific
> > id, but really, it should not matter.
> >
> 
> I need fixed IDs in order to communicate with the sub-devices
> correctly. For instance, the I2C driver registers 6 devices, and the
> userspace interface needs to know which specific I2C controller (e.g.,
> index 0 ~ 5) to target with custom commands. Using fixed IDs allow the
> driver to maintain a consistent mapping between device instances and
> register sets.
> 
> I'm open to better alternatives, but so far, using fixed
> platform_device->id has been the most straightforward way to achieve
> this.

The kernel is not responsible for numbering devices in a determinisitic
way like this, so be very careful.  Userspace can implement whatever
policy it wants to figure out what device id is what actual device, by
using tools like udev and the like.  See how it does this today by
looking at your /dev/disks/ directory on your system at the symlinks.

So good luck with this, but again, it's not the kernel's job to keep
device numbering static across boots, that is not something we guarantee
at all.

Perhaps you should not be using mfd for this?  Perhaps something like
the auxbus would work better?

thanks,

greg k-h

