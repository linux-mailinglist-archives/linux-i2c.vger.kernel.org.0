Return-Path: <linux-i2c+bounces-12337-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2792B2C450
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 14:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FB391760F9
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 12:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B62F33A030;
	Tue, 19 Aug 2025 12:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spVV9/Af"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EAE322DCF;
	Tue, 19 Aug 2025 12:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607990; cv=none; b=nMSD8pIYTjvGWw3eRlIAXsFOQ9MfzvN2/necniu1kVsxW4bhnmmemCBXMr5Fpj7UkY+BgfDHvP6y3/oTgEvXmb2NhvK2fZiFn0JW/THHUWedot0UfyS+R/HugCmaPBkWr4ZXbpYk3y70dRlIAF+jCot/r1A8oWCmHgEO59GE6jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607990; c=relaxed/simple;
	bh=13a7n6Pb3jFNNT/Scy0A653um0mNmwq9IdUUvB5tTjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+J3BTg3lHNBpgxDP5HGd+Y6dDXJDkpv5cAGVr3fK8AayR0VdPYIDdvVvuWFt6OWU3UnXtXoxhUza5IRSaf2xt2WIqyP7bKFO2Ap3R/6fGYKEXOvfe2beTppwQtWSBzCS1wMR9GzLifeV5/qR6uDHP8bA/QdWmFu5VCv1krfY+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spVV9/Af; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FBAFC4CEF1;
	Tue, 19 Aug 2025 12:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755607989;
	bh=13a7n6Pb3jFNNT/Scy0A653um0mNmwq9IdUUvB5tTjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spVV9/Af14lsdKsEZzbIRCmuw1himyJY4e7hGmujx6tF/7/m5++G9iGLOygy4mLKK
	 S3J0KyX5OveutjN6wX9q+olCFVfEW+RtiFd90uA2fBALfHpIoO2gvh1X7xJmn11zPS
	 cHbkb3kVoE7YsPG9I3nHOXmYlSNgyHu8ps6sjLOxTwTiS2vLuVvDIPR9x/OmYT7UZj
	 Ie+zJQHk1Cuu7QYMDBH4Q5bGdHH0Hl3nILAiihBXXc6LghGbcjKtDV9MF5jWrfGU3y
	 WEpk42jqv8EdikF6bgDuKfqpBwvz+8UyHAlvKxs+Cb41i9692F/9qkZJGnwJ1yq5Qf
	 u8aKBTIzufhmQ==
Date: Tue, 19 Aug 2025 13:53:02 +0100
From: Lee Jones <lee@kernel.org>
To: a0282524688@gmail.com
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
Subject: Re: [PATCH v14 0/7] Add Nuvoton NCT6694 MFD drivers
Message-ID: <20250819125302.GE7508@google.com>
References: <20250715025626.968466-1-a0282524688@gmail.com>
 <20250723095856.GT11056@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250723095856.GT11056@google.com>

On Wed, 23 Jul 2025, Lee Jones wrote:

> On Tue, 15 Jul 2025, a0282524688@gmail.com wrote:
> 
> > From: Ming Yu <a0282524688@gmail.com>
> > 
> > This patch series introduces support for Nuvoton NCT6694, a peripheral
> > expander based on USB interface. It models the chip as an MFD driver
> > (1/7), GPIO driver(2/7), I2C Adapter driver(3/7), CANfd driver(4/7),
> > WDT driver(5/7), HWMON driver(6/7), and RTC driver(7/7).
> > 
> > The MFD driver implements USB device functionality to issue
> > custom-define USB bulk pipe packets for NCT6694. Each child device can
> > use the USB functions nct6694_read_msg() and nct6694_write_msg() to issue
> > a command. They can also request interrupt that will be called when the
> > USB device receives its interrupt pipe.
> > 
> > The following introduces the custom-define USB transactions:
> > 	nct6694_read_msg - Send bulk-out pipe to write request packet
> > 			   Receive bulk-in pipe to read response packet
> > 			   Receive bulk-in pipe to read data packet
> > 
> > 	nct6694_write_msg - Send bulk-out pipe to write request packet
> > 			    Send bulk-out pipe to write data packet
> > 			    Receive bulk-in pipe to read response packet
> 
> [...]
> 
> > Ming Yu (7):
> >   mfd: Add core driver for Nuvoton NCT6694
> >   gpio: Add Nuvoton NCT6694 GPIO support
> >   i2c: Add Nuvoton NCT6694 I2C support
> >   can: Add Nuvoton NCT6694 CANFD support
> >   watchdog: Add Nuvoton NCT6694 WDT support
> >   hwmon: Add Nuvoton NCT6694 HWMON support
> >   rtc: Add Nuvoton NCT6694 RTC support
> > 
> >  MAINTAINERS                         |  12 +
> >  drivers/gpio/Kconfig                |  12 +
> >  drivers/gpio/Makefile               |   1 +
> >  drivers/gpio/gpio-nct6694.c         | 499 +++++++++++++++
> >  drivers/hwmon/Kconfig               |  10 +
> >  drivers/hwmon/Makefile              |   1 +
> >  drivers/hwmon/nct6694-hwmon.c       | 949 ++++++++++++++++++++++++++++
> >  drivers/i2c/busses/Kconfig          |  10 +
> >  drivers/i2c/busses/Makefile         |   1 +
> >  drivers/i2c/busses/i2c-nct6694.c    | 196 ++++++
> >  drivers/mfd/Kconfig                 |  15 +
> >  drivers/mfd/Makefile                |   2 +
> >  drivers/mfd/nct6694.c               | 388 ++++++++++++
> >  drivers/net/can/usb/Kconfig         |  11 +
> >  drivers/net/can/usb/Makefile        |   1 +
> >  drivers/net/can/usb/nct6694_canfd.c | 832 ++++++++++++++++++++++++
> >  drivers/rtc/Kconfig                 |  10 +
> >  drivers/rtc/Makefile                |   1 +
> >  drivers/rtc/rtc-nct6694.c           | 297 +++++++++
> >  drivers/watchdog/Kconfig            |  11 +
> >  drivers/watchdog/Makefile           |   1 +
> >  drivers/watchdog/nct6694_wdt.c      | 307 +++++++++
> >  include/linux/mfd/nct6694.h         | 102 +++
> >  23 files changed, 3669 insertions(+)
> >  create mode 100644 drivers/gpio/gpio-nct6694.c
> >  create mode 100644 drivers/hwmon/nct6694-hwmon.c
> >  create mode 100644 drivers/i2c/busses/i2c-nct6694.c
> >  create mode 100644 drivers/mfd/nct6694.c
> >  create mode 100644 drivers/net/can/usb/nct6694_canfd.c
> >  create mode 100644 drivers/rtc/rtc-nct6694.c
> >  create mode 100644 drivers/watchdog/nct6694_wdt.c
> >  create mode 100644 include/linux/mfd/nct6694.h
> 
> I will apply this the other side of the pending merge-window.

Doesn't apply.  Please rebase on top of v6.17-rc1.

When you resubmit do so as a [RESEND].

-- 
Lee Jones [李琼斯]

