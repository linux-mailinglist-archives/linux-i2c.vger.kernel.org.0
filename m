Return-Path: <linux-i2c+bounces-12981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1F1B59A8F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 16:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86D253B8B83
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 14:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F2B3375B2;
	Tue, 16 Sep 2025 14:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+Q8lbQv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE63081AE;
	Tue, 16 Sep 2025 14:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758033535; cv=none; b=D0Mt/XvXX+2jopZcqBFeFPIbojy87gDczqNeipNMsHT0uar/ovY7Zy2hgwp9dXJTn2VT7w9MWHaNLqaiwCyyagrBWdLXD+hOp2OtRLaLdbx6njpoTf06i6M5tMhNqnZ4pUNEmDdi5/1+3QBAlP/9Zz85L3jxGbjyWoUJBECjZCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758033535; c=relaxed/simple;
	bh=Ph/hIiO+tXjORKxzfu06YoivQsZaFkxYB4pQsUq4gpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sf9FxGW+yWha84yJlVqeAhNaPs7M0f6OXTtfKHKvX9DOPNJL+DmRR7S3KKm4belqof8AIQi35NAbL/shV+373M7j72bDqqOi+6VnDt9zJ/TjT4xe1UphDNeIhBLZkqLGPM5V751tn9x+i1j5EmqKse+z3Q9W7ePvRCpM/yherv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+Q8lbQv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2FAC4CEEB;
	Tue, 16 Sep 2025 14:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758033535;
	bh=Ph/hIiO+tXjORKxzfu06YoivQsZaFkxYB4pQsUq4gpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k+Q8lbQvzfiLPscbR5ZPBPkpIbgIzkAK2T0BtjPuBHrfNmtyNZj/YF2ioJPAu+aqT
	 k0Fj5O2OQ1MMzl3YYquE394xUYf9bbOTEbgwFoppUmMbqRQKQbQmxJ/af6CuOV+Ct2
	 sKjZxOjK/W5NMn3Z1o+rQ0FB78oookqGpHcoucoZ1FOPU8LXl8KgBkD25Txo9bfdhL
	 hkwet2ivAS5IRwptEjYJl735BJoSktrlFCsOILzOWHB/GWz+YtSaHdmKkxx24a9q1e
	 eT0tDZHSOp3d0yvhUYi3GttGy7WSLJgG1HXn8jer+jI+O1V+vV6aGKuYr5nRGCxCUd
	 SSSsnYJSBNujA==
Date: Tue, 16 Sep 2025 15:38:47 +0100
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
Message-ID: <20250916143847.GF3585920@google.com>
References: <20250912091952.1169369-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912091952.1169369-1-a0282524688@gmail.com>

Enjoy!

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-gpio-hwmon-i2c-can-rtc-watchdog-v6.18

for you to fetch changes up to d463bb140583609f78f61d48c3dfb6f46c5cb062:

  rtc: Add Nuvoton NCT6694 RTC support (2025-09-16 14:41:58 +0100)

----------------------------------------------------------------
Immutable branch between MFD, GPIO, HWMON, I2C, CAN, RTC and Watchdog due for the v6.18 merge window

----------------------------------------------------------------
Ming Yu (7):
      mfd: Add core driver for Nuvoton NCT6694
      gpio: Add Nuvoton NCT6694 GPIO support
      i2c: Add Nuvoton NCT6694 I2C support
      can: Add Nuvoton NCT6694 CANFD support
      watchdog: Add Nuvoton NCT6694 WDT support
      hwmon: Add Nuvoton NCT6694 HWMON support
      rtc: Add Nuvoton NCT6694 RTC support

 MAINTAINERS                         |  12 +
 drivers/gpio/Kconfig                |  12 +
 drivers/gpio/Makefile               |   1 +
 drivers/gpio/gpio-nct6694.c         | 499 +++++++++++++++++++
 drivers/hwmon/Kconfig               |  10 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/nct6694-hwmon.c       | 949 ++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig          |  10 +
 drivers/i2c/busses/Makefile         |   1 +
 drivers/i2c/busses/i2c-nct6694.c    | 196 ++++++++
 drivers/mfd/Kconfig                 |  15 +
 drivers/mfd/Makefile                |   2 +
 drivers/mfd/nct6694.c               | 388 +++++++++++++++
 drivers/net/can/usb/Kconfig         |  11 +
 drivers/net/can/usb/Makefile        |   1 +
 drivers/net/can/usb/nct6694_canfd.c | 832 +++++++++++++++++++++++++++++++
 drivers/rtc/Kconfig                 |  10 +
 drivers/rtc/Makefile                |   1 +
 drivers/rtc/rtc-nct6694.c           | 297 +++++++++++
 drivers/watchdog/Kconfig            |  11 +
 drivers/watchdog/Makefile           |   1 +
 drivers/watchdog/nct6694_wdt.c      | 307 ++++++++++++
 include/linux/mfd/nct6694.h         | 102 ++++
 23 files changed, 3669 insertions(+)
 create mode 100644 drivers/gpio/gpio-nct6694.c
 create mode 100644 drivers/hwmon/nct6694-hwmon.c
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 drivers/net/can/usb/nct6694_canfd.c
 create mode 100644 drivers/rtc/rtc-nct6694.c
 create mode 100644 drivers/watchdog/nct6694_wdt.c
 create mode 100644 include/linux/mfd/nct6694.h

-- 
Lee Jones [李琼斯]

