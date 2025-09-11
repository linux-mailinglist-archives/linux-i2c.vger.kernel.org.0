Return-Path: <linux-i2c+bounces-12854-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CEDB52DE0
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 12:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D98C8562603
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 10:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B019A30E84F;
	Thu, 11 Sep 2025 10:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NCP1yhSL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F0E30E0CE;
	Thu, 11 Sep 2025 10:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757584851; cv=none; b=LUqjagAXVwHgSS4tSDLEnM4gHH49u6kPQZtkOLH7tBlx0EK3QhLBB1ngsK8HH4kiEB1O7ogd36H2NL0Z5gGHdFDHxlHoQ9kg6A2D+4byUysKUublFzDDxwM0syETKf4zAvOKEU5P6IEuAZ2KX9QUdF333pc9Az8yyQvJUHGGiDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757584851; c=relaxed/simple;
	bh=26ef/AWDr6iPql13XdUNHtcG4FfN13JknCbbcMnKvjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sj+TgBRVQRWoIxU5U+M0auo1+yRpapYVh89NEZAbS9ysmNqPn5vX4p4/+hx6CEvGJ6HgwPXuyCteJzt5uIVzQJ4ZLVsVpz3wtCcDu64PR8AFJRR+J/kpA5soYRgYYQw1JL2jzsL40/bl9AULiNX9XCqpMfXTl/eB4diO4zTUHJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NCP1yhSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49386C4CEF1;
	Thu, 11 Sep 2025 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757584850;
	bh=26ef/AWDr6iPql13XdUNHtcG4FfN13JknCbbcMnKvjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NCP1yhSLNMvNznM42Tdg6Lt6sWqmT8tMeD6ADk8zRD2WLjrAEsAKgGhiY/zuwS3ya
	 8j+hNc9K5dh6SmpsEcpPZETAIvyLEojL+064pdWi8Ci2nNu5bSPimco+gjTIzn36Cv
	 RtJoM5ODWvQsg5K6MY3OPJy9tVrWmmrhadoApDj/f3BwmVXyEBo2mTSGmklPtJUT7l
	 scSwtBNQctN/iBNm5Vlb2MBsMcWrbH5TvWyz56AOJ5bvfXDWeLVrT7C89LQofvl+9i
	 E+Q3LIJwkRPWU1p/1gpBfePpCySFufkixlhk1ofk4gznzoOYWwCeupSgD7jAKqtGdO
	 h4mkgl0Z9tXLQ==
Date: Thu, 11 Sep 2025 11:00:43 +0100
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
Subject: Re: [PATCH RESEND v14 0/7] Add Nuvoton NCT6694 MFD drivers
Message-ID: <20250911100043.GH9224@google.com>
References: <20250904015048.1801451-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250904015048.1801451-1-a0282524688@gmail.com>

On Thu, 04 Sep 2025, a0282524688@gmail.com wrote:

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
>         nct6694_read_msg - Send bulk-out pipe to write request packet
>                            Receive bulk-in pipe to read response packet
>                            Receive bulk-in pipe to read data packet
> 
>         nct6694_write_msg - Send bulk-out pipe to write request packet
>                             Send bulk-out pipe to write data packet
>                             Receive bulk-in pipe to read response packet
>                             Receive bulk-in pipe to read data packet
> 
> Changes since version 13:
> - Update to guard(spinlock_irqsave)() in nct6694.c
> - Add struct i2c_adapter_quirks in i2c-nct6694.c
> - Rebased on top of v6.17-rc1 as requested

I thought you were going to rebase this onto v6.17-rc1?

It still does not apply.

> Changes since version 12:
> - Implement IDA in MFD driver to handle per-device IDs
> - Use spinlock to replace irq mutex lock
> - Use same email address in the signature
> 
> Changes since version 11:
> - Use platform_device's id to replace IDA
> - Modify the irq_domain_add_simple() to irq_domain_create_simple() in
>   nct6694.c
> - Update struct data_bittiming_params related part in nct6694_canfd.c
> - Fix the typo in the header in nct6694-hwmon.c
> 
> Changes since version 10:
> - Add change log for each patch
> - Fix mfd_cell to MFD_CELL_NAME() in nct6694.c
> - Implement IDA to allocate id in gpio-nct6694.c, i2c-nct6694.c,
>   nct6694_canfd.c and nct6694_wdt.c
> - Add header <linux/bitfield.h> in nct6694_canfd.c
> - Add support to config tdc in nct6694_canfd.c
> - Add module parameters to configure WDT's timeout and pretimeout value
>   in nct6694_wdt.c
> 
> Changes since version 9:
> - Add devm_add_action_or_reset() to dispose irq mapping
> - Add KernelDoc to exported functions in nct6694.c
> 
> Changes since version 8:
> - Modify the signed-off-by with my work address
> - Rename all MFD cell names to "nct6694-xxx"
> - Add irq_dispose_mapping() in the error handling path and in the remove
>   function
> - Fix some comments in nct6694.c and in nct6694.h
> - Add module parameters to configure I2C's baudrate in i2c-nct6694.c
> - Rename all function names nct6694_can_xxx to nct6694_canfd_xxx in
>   nct6694_canfd.c
> - Fix nct6694_canfd_handle_state_change() in nct6694_canfd.c
> - Fix nct6694_canfd_start() to configure NBTP and DBTP in nct6694_canfd.c
> - Add can_set_static_ctrlmode() in nct6694_canfd.c
> 
> Changes since version 7:
> - Add error handling for devm_mutex_init()
> - Modify the name of the child devices CAN1 and CAN2 to CAN0 and CAN1.
> - Fix multiline comments to net-dev style in nct6694_canfd.c
> 
> Changes since version 6:
> - Fix nct6694_can_handle_state_change() in nct6694_canfd.c
> - Fix warnings in nct6694_canfd.c
> - Move the nct6694_can_priv's bec to the end in nct6694_canfd.c
> - Fix warning in nct6694_wdt.c
> - Fix temp_hyst's data type to signed variable in nct6694-hwmon.c
> 
> Changes since version 5:
> - Modify the module name and the driver name consistently
> - Fix mfd_cell to MFD_CELL_NAME() and MFD_CELL_BASIC()
> - Drop unnecessary macros in nct6694.c
> - Update private data and drop mutex in nct6694_canfd.c
> - Fix nct6694_can_handle_state_change() in nct6694_canfd.c
> 
> Changes since version 4:
> - Modify arguments in read/write function to a pointer to cmd_header
> - Modify all callers that call the read/write function
> - Move the nct6694_canfd.c to drivers/net/can/usb/
> - Fix the missing rx offload function in nct6694_canfd.c
> - Fix warngings in nct6694-hwmon.c
> 
> Changes since version 3:
> - Modify array buffer to structure for each drivers
> - Fix defines and comments for each drivers
> - Add header <linux/bits.h> and use BIT macro in nct6694.c and
>   gpio-nct6694.c
> - Modify mutex_init() to devm_mutex_init()
> - Add rx-offload helper in nct6694_canfd.c
> - Drop watchdog_init_timeout() in nct6694_wdt.c
> - Modify the division method to DIV_ROUND_CLOSEST() in nct6694-hwmon.c
> - Drop private mutex and use rtc core lock in rtc-nct6694.c
> - Modify device_set_wakeup_capable() to device_init_wakeup() in
>   rtc-nct6694.c
> 
> Changes since version 2:
> - Add MODULE_ALIAS() for each child driver
> - Modify gpio line names be a local variable in gpio-nct6694.c
> - Drop unnecessary platform_get_drvdata() in gpio-nct6694.c
> - Rename each command in nct6694_canfd.c
> - Modify each function name consistently in nct6694_canfd.c
> - Modify the pretimeout validation procedure in nct6694_wdt.c
> - Fix warnings in nct6694-hwmon.c
> 
> Changes since version 1:
> - Implement IRQ domain to handle IRQ demux in nct6694.c
> - Modify USB_DEVICE to USB_DEVICE_AND_INTERFACE_INFO API in nct6694.c
> - Add each driver's command structure
> - Fix USB functions in nct6694.c
> - Fix platform driver registration in each child driver
> - Sort each driver's header files alphabetically
> - Drop unnecessary header in gpio-nct6694.c
> - Add gpio line names in gpio-nct6694.c
> - Fix errors and warnings in nct6694_canfd.c
> - Fix TX-flow control in nct6694_canfd.c
> - Fix warnings in nct6694_wdt.c
> - Drop unnecessary logs in nct6694_wdt.c
> - Modify start() function to setup device in nct6694_wdt.c
> - Add voltage sensors functionality in nct6694-hwmon.c
> - Add temperature sensors functionality in nct6694-hwmon.c
> - Fix overwrite error return values in nct6694-hwmon.c
> - Add write value limitation for each write() function in nct6694-hwmon.c
> - Drop unnecessary logs in rtc-nct6694.c
> - Fix overwrite error return values in rtc-nct6694.c
> - Modify to use dev_err_probe API in rtc-nct6694.c
> 
> 
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
> 
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]

