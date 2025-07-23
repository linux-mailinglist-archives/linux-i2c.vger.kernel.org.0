Return-Path: <linux-i2c+bounces-12005-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E790B0EF00
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 11:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E2FC16AAD0
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 09:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF4A28B7DE;
	Wed, 23 Jul 2025 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCsvzskT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01BE280325;
	Wed, 23 Jul 2025 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753264744; cv=none; b=e8Li3cpxCznEs1TPapWtDvKkz176xCVJfmC34S9NG9+S9X1JS0Hyrr/TYn3qbhPkCfH2m/c7Vhs2HkjIm3lKkPZYf1pKR4qhde5Pjgr71FXLpUNXnulK0/0fPHn4bkZ4kbhaBQbR44jpL8aLbLH4/YdOchpAEWaW9V5hpGLvjho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753264744; c=relaxed/simple;
	bh=yzX7va2srxpQsEnQrCqzNSATBc4ZgUiYAKZ5VunBZIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nA3CmAEuu5Ibf9h1x67b7O/5WiYW7FiDCp9ELXP5Bep3zChqm/UtDJuyxgUTZ3RuGq/InxHo6F8/zEVIlClsn4dmVXExRO8XZBtPge5rjJf3oMA2EMhWoJ8DB1UZ3ApjdF/NAl/Y1aPGP9Asr7dVcAotB60o/hT18yMCxGqeudM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCsvzskT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0008C4CEE7;
	Wed, 23 Jul 2025 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753264743;
	bh=yzX7va2srxpQsEnQrCqzNSATBc4ZgUiYAKZ5VunBZIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCsvzskTIiUISMxcu3iQM4Mfm3ktUPUQqQFseLTYboda08WkEP3zRtfrg7joDVUka
	 uvkd+F0St/5hNrzlG6oLHsGtTErA1r82vjNuu7cCbCYLabFfJjPJTPZfNijtXL7Y40
	 9KWR90q5fYU9f6Z0Ajws0gD8n3urDLp4zn/r30AkGidlSE0aMtIdtgWcm7rjRfBGkl
	 U37hX6bmqcHXcIbFp7lvRSOhPbFKHdQC4mzVsPecdfQer7drjEAEBtnmoV6+dNbuGh
	 GYC689eGG45h6W8216ZdckWnBSlC0euXCL3NVZGIrqi6fyRHzICQjKp6RJgngvymvC
	 ZhC3wk7Q5SAwg==
Date: Wed, 23 Jul 2025 10:58:56 +0100
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
Message-ID: <20250723095856.GT11056@google.com>
References: <20250715025626.968466-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250715025626.968466-1-a0282524688@gmail.com>

On Tue, 15 Jul 2025, a0282524688@gmail.com wrote:

> From: Ming Yu <a0282524688@gmail.com>
> 
> This patch series introduces support for Nuvoton NCT6694, a peripheral
> expander based on USB interface. It models the chip as an MFD driver
> (1/7), GPIO driver(2/7), I2C Adapter driver(3/7), CANfd driver(4/7),
> WDT driver(5/7), HWMON driver(6/7), and RTC driver(7/7).
> 
> The MFD driver implements USB device functionality to issue
> custom-define USB bulk pipe packets for NCT6694. Each child device can
> use the USB functions nct6694_read_msg() and nct6694_write_msg() to issue
> a command. They can also request interrupt that will be called when the
> USB device receives its interrupt pipe.
> 
> The following introduces the custom-define USB transactions:
> 	nct6694_read_msg - Send bulk-out pipe to write request packet
> 			   Receive bulk-in pipe to read response packet
> 			   Receive bulk-in pipe to read data packet
> 
> 	nct6694_write_msg - Send bulk-out pipe to write request packet
> 			    Send bulk-out pipe to write data packet
> 			    Receive bulk-in pipe to read response packet

[...]

> Ming Yu (7):
>   mfd: Add core driver for Nuvoton NCT6694
>   gpio: Add Nuvoton NCT6694 GPIO support
>   i2c: Add Nuvoton NCT6694 I2C support
>   can: Add Nuvoton NCT6694 CANFD support
>   watchdog: Add Nuvoton NCT6694 WDT support
>   hwmon: Add Nuvoton NCT6694 HWMON support
>   rtc: Add Nuvoton NCT6694 RTC support
> 
>  MAINTAINERS                         |  12 +
>  drivers/gpio/Kconfig                |  12 +
>  drivers/gpio/Makefile               |   1 +
>  drivers/gpio/gpio-nct6694.c         | 499 +++++++++++++++
>  drivers/hwmon/Kconfig               |  10 +
>  drivers/hwmon/Makefile              |   1 +
>  drivers/hwmon/nct6694-hwmon.c       | 949 ++++++++++++++++++++++++++++
>  drivers/i2c/busses/Kconfig          |  10 +
>  drivers/i2c/busses/Makefile         |   1 +
>  drivers/i2c/busses/i2c-nct6694.c    | 196 ++++++
>  drivers/mfd/Kconfig                 |  15 +
>  drivers/mfd/Makefile                |   2 +
>  drivers/mfd/nct6694.c               | 388 ++++++++++++
>  drivers/net/can/usb/Kconfig         |  11 +
>  drivers/net/can/usb/Makefile        |   1 +
>  drivers/net/can/usb/nct6694_canfd.c | 832 ++++++++++++++++++++++++
>  drivers/rtc/Kconfig                 |  10 +
>  drivers/rtc/Makefile                |   1 +
>  drivers/rtc/rtc-nct6694.c           | 297 +++++++++
>  drivers/watchdog/Kconfig            |  11 +
>  drivers/watchdog/Makefile           |   1 +
>  drivers/watchdog/nct6694_wdt.c      | 307 +++++++++
>  include/linux/mfd/nct6694.h         | 102 +++
>  23 files changed, 3669 insertions(+)
>  create mode 100644 drivers/gpio/gpio-nct6694.c
>  create mode 100644 drivers/hwmon/nct6694-hwmon.c
>  create mode 100644 drivers/i2c/busses/i2c-nct6694.c
>  create mode 100644 drivers/mfd/nct6694.c
>  create mode 100644 drivers/net/can/usb/nct6694_canfd.c
>  create mode 100644 drivers/rtc/rtc-nct6694.c
>  create mode 100644 drivers/watchdog/nct6694_wdt.c
>  create mode 100644 include/linux/mfd/nct6694.h

I will apply this the other side of the pending merge-window.

-- 
Lee Jones [李琼斯]

