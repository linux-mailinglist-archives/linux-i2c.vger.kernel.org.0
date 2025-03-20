Return-Path: <linux-i2c+bounces-9952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC87A6A936
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 15:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56F9E1885BE4
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 14:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6BA1E1308;
	Thu, 20 Mar 2025 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRPpkYlD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA01876;
	Thu, 20 Mar 2025 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742482250; cv=none; b=up2lDjrIAJCtLBoWZ8e0GjNAfPgFQCQ4m+q4jitmx3YciWFDai+tyqZAlhq2EX2IOG1kLMB9I9JTkjFxV2Ria+gc34VMxfF/QYxvFeOymYsw90T/XJoHdAT1Zcypt8gCRZyyer1MsQkcW/JUi/JWWvRQSgpf8e6G8z5sMISixqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742482250; c=relaxed/simple;
	bh=VgHP2YZFJFqQDq6X1Enrko29eUy4PpuSIOCuvJw0JKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JU23vf56yCSeynELKQGf7YpeU/z+eYk3tketxRSKHr/rVPQhhaaOyr5KVUbQpdEzCyu1PJDjdBs2QwpO8pEKOxmRlNvq4F7CffqBwP6Ib8lB3SFVBxktwzv0dQ444X/CS7n+3M00yR4ais1xB5Hm0dBmxLaMNZK0+nc0Ov51FKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRPpkYlD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE15C4CEDD;
	Thu, 20 Mar 2025 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742482250;
	bh=VgHP2YZFJFqQDq6X1Enrko29eUy4PpuSIOCuvJw0JKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRPpkYlDUBw1gjGtXjQDSei78Js5SiMhGUtyttvW9CgAqns2tTOPY8/wNVO3igUrp
	 d9zHAHmBrA+CESjTE8Vd+xoH+NF8JxkVjkUXZY2rGxmW3pfhS8VkKdGG8xyARuj0FL
	 gQHgAnh715xQCL8AM6m35smLKWm66L881RKbWs2YrcLzTdo+SZBv0gIAnBp529LrWk
	 2TpFQUzC/HZ9ygyk+1qefsxhF1q9kjA4qEWPS0OL1ov41GqjdVgXiAkgQNedHqDO0I
	 4AydkziQDb1uW2b3VKIQ3E28ix5DltoIbnT+ryX4BT5beobsVaihxlLPX0QJow5foT
	 821ydGI3nYYkQ==
Date: Thu, 20 Mar 2025 14:50:42 +0000
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
Message-ID: <20250320145042.GS3890718@google.com>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-2-a0282524688@gmail.com>
 <20250307011542.GE8350@google.com>
 <CAOoeyxUgiTqtSksfHopEDhZHwNkUq9+d-ojo8ma3PX2dosuwyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOoeyxUgiTqtSksfHopEDhZHwNkUq9+d-ojo8ma3PX2dosuwyQ@mail.gmail.com>

On Mon, 17 Mar 2025, Ming Yu wrote:

> Dear Lee,
> 
> Thank you for reviewing,
> 
> Lee Jones <lee@kernel.org> 於 2025年3月7日 週五 上午9:15寫道：
> >
> > On Tue, 25 Feb 2025, Ming Yu wrote:
> >
> > > The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> > > 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> > > PWM, and RTC.
> >
> > This needs to go into the Kconfig help passage.
> >
> 
> Okay, I will move these to Kconfig in the next patch.
> 
> > > This driver implements USB device functionality and shares the
> > > chip's peripherals as a child device.
> >
> > This driver doesn't implement USB functionality.
> >
> 
> Fix it in v9.
> 
> > > Each child device can use the USB functions nct6694_read_msg()
> > > and nct6694_write_msg() to issue a command. They can also request
> > > interrupt that will be called when the USB device receives its
> > > interrupt pipe.
> > >
> > > Signed-off-by: Ming Yu <a0282524688@gmail.com>
> >
> > Why aren't you signing off with your work address?
> >
> 
> Fix it in v9.
> 
> > > ---
> > >  MAINTAINERS                 |   7 +
> > >  drivers/mfd/Kconfig         |  18 ++
> > >  drivers/mfd/Makefile        |   2 +
> > >  drivers/mfd/nct6694.c       | 378 ++++++++++++++++++++++++++++++++++++
> > >  include/linux/mfd/nct6694.h | 102 ++++++++++
> > >  5 files changed, 507 insertions(+)
> > >  create mode 100644 drivers/mfd/nct6694.c
> > >  create mode 100644 include/linux/mfd/nct6694.h
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 873aa2cce4d7..c700a0b96960 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -16918,6 +16918,13 @@ F:   drivers/nubus/
> > >  F:   include/linux/nubus.h
> > >  F:   include/uapi/linux/nubus.h
> > >
> > > +NUVOTON NCT6694 MFD DRIVER
> > > +M:   Ming Yu <tmyu0@nuvoton.com>
> > > +L:   linux-kernel@vger.kernel.org
> >
> > This is the default list.  You shouldn't need to add that here.
> 
> Remove it in v9.

Please snip everything that you agree with.

> > > +S:   Supported
> > > +F:   drivers/mfd/nct6694.c
> > > +F:   include/linux/mfd/nct6694.h
> > > +
> > >  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> > >  M:   Antonino Daplas <adaplas@gmail.com>
> > >  L:   linux-fbdev@vger.kernel.org

[...]

> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x1),
> >
> > IDs are usually given in base-10.
> >
> 
> Fix it in v9.
> 
> > Why are you manually adding the device IDs?
> >
> > PLATFORM_DEVID_AUTO doesn't work for you?
> >
> 
> I need to manage these IDs to ensure that child devices can be
> properly utilized within their respective modules.

How?  Please explain.

This numbering looks sequential and arbitrary.

What does PLATFORM_DEVID_AUTO do differently such that it is not useful?

> 
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x2),
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x3),
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x4),
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x5),
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x6),
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x7),
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x8),
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x9),
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xA),
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xB),
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xC),
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xD),
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xE),
> > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xF),

> > > +
> > > +     MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x0),
> > > +     MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x1),
> > > +     MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x2),
> > > +     MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x3),
> > > +     MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x4),
> > > +     MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x5),
> > > +
> > > +     MFD_CELL_BASIC("nct6694_canfd", NULL, NULL, 0, 0x0),
> >
> > Why has the naming convention changed here?
> >
> 
> I originally expected the child devices name to directly match its
> driver name. Do you think it would be better to standardize the naming
> as "nct6694-xxx" ?

Yes, that is the usual procedure.

> > > +     MFD_CELL_BASIC("nct6694_canfd", NULL, NULL, 0, 0x1),
> > > +
> > > +     MFD_CELL_BASIC("nct6694_wdt", NULL, NULL, 0, 0x0),
> > > +     MFD_CELL_BASIC("nct6694_wdt", NULL, NULL, 0, 0x1),
> > > +
> > > +     MFD_CELL_NAME("nct6694-hwmon"),
> > > +     MFD_CELL_NAME("rtc-nct6694"),
> >
> > There doesn't seem to be any consistency here.
> >
> 
> Do you think these two should be changed to use MFD_CELL_BASIC()?

No.  I mean with the device nomenclature.

[...]

> > > +static void usb_int_callback(struct urb *urb)
> > > +{
> > > +     struct nct6694 *nct6694 = urb->context;
> > > +     unsigned int *int_status = urb->transfer_buffer;
> > > +     int ret;
> > > +
> > > +     switch (urb->status) {
> > > +     case 0:
> > > +             break;
> > > +     case -ECONNRESET:
> > > +     case -ENOENT:
> > > +     case -ESHUTDOWN:
> > > +             return;
> > > +     default:
> > > +             generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
> > > +             *int_status &= ~BIT(irq);
> > > +     }
> > > +
> > > +resubmit:
> > > +     ret = usb_submit_urb(urb, GFP_ATOMIC);
> > > +     if (ret)
> > > +             dev_dbg(nct6694->dev, "%s: Failed to resubmit urb, status %pe",
> >
> > Why debug?
> >
> 
> Excuse me, do you think it should change to dev_err()?

Probably a dev_warn() since you are not propagating the error.

Is this okay by the way?  Is it okay to fail?

-- 
Lee Jones [李琼斯]

