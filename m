Return-Path: <linux-i2c+bounces-12982-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4E1B59AAB
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 16:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31B1F46460F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 14:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFFC3375CD;
	Tue, 16 Sep 2025 14:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mL2ctDOg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31CC30C357;
	Tue, 16 Sep 2025 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758033592; cv=none; b=jijTMJvdKffBUY2YhjiT1AeO7sTXZ9h3E/iFzbcPK4Y2OFHm+TLE10SYxJJRU+K0qiLpS7ziQobpxoa2YRrAFKyVDDVThYNI5F8s/GQjROZOnMaY98PYUo9IiVd6boGbiPVcS1ocO9h2yewm6CdvExEdw8X6YA1ZcK6KcjcfE5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758033592; c=relaxed/simple;
	bh=EDfRX0RIkPJUTOzyTgi+O83Ih7FSf4+t7TnGTIzv5YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/33kfJolMkdU6A3P0qQmtB0tV0ZbXMb9PslMtStFtskhhPgPXcqueepuc0PneGweOkVL6TLN9o9bhj2LI7L9Imvf8/s/PDoWEd0WCtNtSTEkxmFIhPMlBf0rCLYQeE0VHuPEElLNlQrqFHzZvf63rOjXqASiHDK+1b8YSvg+uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mL2ctDOg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4495C4CEEB;
	Tue, 16 Sep 2025 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758033591;
	bh=EDfRX0RIkPJUTOzyTgi+O83Ih7FSf4+t7TnGTIzv5YY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mL2ctDOgNiUrtib5Onat+P6I+mOGVVODkCpHQQYsGq98p2Yv+8VmQRrnw7PKghuWy
	 N938OCWn3kYfO2X0JmKhWohOjBvAoYP5k2oH4Q/5Xwsl0TWQIsLs4TnO7/A8ocIHLn
	 r444P8KtJASp2xl4+ZhYXRlqNT+EeYV7MC4wQc+m9WnLMCN+skLBEwl3vzB7ykxERE
	 oCYgzPNR7BQnJfyA2/UMW0juU4iKyKH1eZD/sIwahhSeIkhCeZH8ycgyM4NReAvoUH
	 CUQya1qaY/ZXD1n5oXZGHdw38FWd21saHMt+hG/NKpKQMjO5sCz9qfXxLPuvhspFnq
	 TfeRsjdJS5F7Q==
Date: Tue, 16 Sep 2025 15:39:44 +0100
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
Subject: [GIT PULL] Immutable branch between MFD, GPIO, HWMON, I2C, CAN, RTC
 and Watchdog due for the v6.18 merge window
Message-ID: <20250916143944.GG3585920@google.com>
References: <20250912091952.1169369-1-a0282524688@gmail.com>
 <20250916143847.GF3585920@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250916143847.GF3585920@google.com>

Sorry, fingers faster than brain!  With the corrected subject this time.

> Enjoy!
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-gpio-hwmon-i2c-can-rtc-watchdog-v6.18
> 
> for you to fetch changes up to d463bb140583609f78f61d48c3dfb6f46c5cb062:
> 
>   rtc: Add Nuvoton NCT6694 RTC support (2025-09-16 14:41:58 +0100)
> 
> ----------------------------------------------------------------
> Immutable branch between MFD, GPIO, HWMON, I2C, CAN, RTC and Watchdog due for the v6.18 merge window
> 
> ----------------------------------------------------------------
> Ming Yu (7):
>       mfd: Add core driver for Nuvoton NCT6694
>       gpio: Add Nuvoton NCT6694 GPIO support
>       i2c: Add Nuvoton NCT6694 I2C support
>       can: Add Nuvoton NCT6694 CANFD support
>       watchdog: Add Nuvoton NCT6694 WDT support
>       hwmon: Add Nuvoton NCT6694 HWMON support
>       rtc: Add Nuvoton NCT6694 RTC support
> 
>  MAINTAINERS                         |  12 +
>  drivers/gpio/Kconfig                |  12 +
>  drivers/gpio/Makefile               |   1 +
>  drivers/gpio/gpio-nct6694.c         | 499 +++++++++++++++++++
>  drivers/hwmon/Kconfig               |  10 +
>  drivers/hwmon/Makefile              |   1 +
>  drivers/hwmon/nct6694-hwmon.c       | 949 ++++++++++++++++++++++++++++++++++++
>  drivers/i2c/busses/Kconfig          |  10 +
>  drivers/i2c/busses/Makefile         |   1 +
>  drivers/i2c/busses/i2c-nct6694.c    | 196 ++++++++
>  drivers/mfd/Kconfig                 |  15 +
>  drivers/mfd/Makefile                |   2 +
>  drivers/mfd/nct6694.c               | 388 +++++++++++++++
>  drivers/net/can/usb/Kconfig         |  11 +
>  drivers/net/can/usb/Makefile        |   1 +
>  drivers/net/can/usb/nct6694_canfd.c | 832 +++++++++++++++++++++++++++++++
>  drivers/rtc/Kconfig                 |  10 +
>  drivers/rtc/Makefile                |   1 +
>  drivers/rtc/rtc-nct6694.c           | 297 +++++++++++
>  drivers/watchdog/Kconfig            |  11 +
>  drivers/watchdog/Makefile           |   1 +
>  drivers/watchdog/nct6694_wdt.c      | 307 ++++++++++++
>  include/linux/mfd/nct6694.h         | 102 ++++
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
> Lee Jones [李琼斯]

-- 
Lee Jones [李琼斯]

