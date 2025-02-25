Return-Path: <linux-i2c+bounces-9553-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FEEA43725
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 09:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73D2F16FCF5
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 08:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592EC260A20;
	Tue, 25 Feb 2025 08:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjPO8MY4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADCC25E473;
	Tue, 25 Feb 2025 08:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740471424; cv=none; b=fUNWX5PTd2TKH3GToBIgi6GK/XRcin6D+d6KBre2fpPvglrgqExWamQwSBCmbOhbifW9QEBZK8l4Nw5lwaNd5yZTICF0AAWLGgbfLckBFcjVJt3ztTAw9BYCC8WzBchxCwEUX+ixzELUgQEdqAi4AUHxSIRoYhAsktkbw+DSrjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740471424; c=relaxed/simple;
	bh=BfekZDsUNdvKtB9OBR1tH04nEjz7Dci5U+bZ0eYDUZY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=og5CB6jZX/gPuYfkv0geUTV6jICJwiu2SDfk9iOkuWNn/qpIGeauqXvnwYzTvNvdkjd/Q3fD/bijwbr5Nn9y/sFXD05GrkYCPT7RNeZl4LGqyFFkkw702wf4pEjS414vPn18JxLLULFY8mTdSBjqFWBufulf4gLGJ5ELEuQpgdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjPO8MY4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22128b7d587so101888345ad.3;
        Tue, 25 Feb 2025 00:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740471421; x=1741076221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ4pVbM1DCtU59HnFcpqSu0S4laqWHZt11qRCqs8PiE=;
        b=UjPO8MY42cq4NW7ZVBdjFhfJbpumqAEMa4s+8NdFoZbtp9e6mEzx+m905l5VjxTVtM
         s/zllCbz6z8V5iGz6kQLs7aW3OGq3VGwOq08f3JGH4POH1Zq81VeSgSEvxlZYuRaJXrk
         lMxuNosuXGDtYSTWzAyB49iZhxrCasjyRs2QbyUY5L1PcxPM1HvGGgNXIJp9H0FUS8/4
         EhI8BM6SEmjrcvt12eTkWfhhGGXIPvWmPCnv7SFnVjLvk8F7oE9oEZXQ2NZnDQqBDn87
         7n3kEPHW/2zkH7l8/18aBLY0w9PqDhYbDrn7SVU2PEnlLG7s2wVHA5Kri/iRzWEe/+aP
         OZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740471421; x=1741076221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZ4pVbM1DCtU59HnFcpqSu0S4laqWHZt11qRCqs8PiE=;
        b=ctaTEhuXKJCIC/hLZ36YoEpQ0ZI+2z5c9J7A06XaJ1+ghROqG5Kyrza/g5rQgUE956
         ELTYePZ9MFQ68/rJJb2vrUr0xZRsSb6rYdICzdAIYrcXjXEqrw5L4cOGoOOXtzcHE5qb
         WOJ1Vq6aS9pSl2rxgxId5eTvJXYgxhdkJf+f3gAKxuZyNHE+BaMhN0vxRdAbCMjUQope
         HGzrS1ynj0fuDfg2Np13vdIlcVIpj3UnphYXECBgLzxPBQfxYP2TvtPgYbSeqXBlXgym
         PATQWqCHErqcWFwLdNtF7NESwM1PeKWasVysuhYakHirhGmfbNFOaswqu1BigcEzzxIJ
         Oghg==
X-Forwarded-Encrypted: i=1; AJvYcCVaxSdCbsPeG7xnr7BoE7trAAPJv4yLE4LhCiDn3SkuwW3eDKqYMbGRdlj6KcXLJH2csCGRunPC7qzW@vger.kernel.org, AJvYcCVbn5f9O82T+gs5VpgDj38ttQpf/nI70WtVwpuwYCpemk2vdBwulAsvaXIesKJMfMgMlqIBtBkBaqdX@vger.kernel.org, AJvYcCVsfbLpw0MFHYjR6dqfEDXCIcB7HhXnjn2Zn8SPucE43VsSgueDD3uCoMAFrBrCQSVmJey3zskX+ic86A==@vger.kernel.org, AJvYcCWfkbOZqFhcX3AWAegPgaGF3UCVy9ZB2g4Ts7X/0D9hpqMkPYMtUu2t63u8erqGRK9SEdNHXGgB1ege@vger.kernel.org, AJvYcCWgo0oJSg0xKamEE3S5Gc6/Zm+XvBoLkvcEFDwMcq2OK78iDoORhhP83A3bXLF0epXt5qKq0DP6nTs=@vger.kernel.org, AJvYcCWvFqGFGdI6UjXM/d9S32NCU5OoieHtM03/rF1W5KzGrZzWOi/QHxl7jbU/09UYODHDzt3AQYuSaaSb4QA=@vger.kernel.org, AJvYcCXYJiApuCg7t6maZk4xpvR/KvdMgnvl3LbBz+3H9lWrciuCE+6RcWwdse45CNZIXlkJIcA5b7O1Ar9uO91Kltk=@vger.kernel.org, AJvYcCXziHYubD1/v6rgTrMouNBHPUyA5YMpdr8FrcTQINqX19BZzaJGAxIaZ+csyerSTWdcOcC+R0qn@vger.kernel.org
X-Gm-Message-State: AOJu0YzW84iEVVj9yFYR1WHT/IFJQNuBdB6m9WMbMIbrCmu/2AmtZmFL
	l4DzUzP1OzGkBy4fgFnML7egfjwfoSOkZETQUGtW6D9ZpiyE3/1v
X-Gm-Gg: ASbGncs4wQwLhrgDJsyeD9zqYLWAV0J+cUq0QFxLlYz1ZoKijGDSIpowQx6+uwK79WR
	7ZWBZPhbJ28H94Ab4nvfqgKrxdAfBdLOr1YxvfsFIpVrJGZ4Qm2h3goBtpbkYAZkpiV5/onROJA
	y4nZ522xikwF0G87moXs6FwSnB31aDxNM6xReON8M/PxLkRO/wAvP2e3Q+QvkiKD/41rBdTyCyV
	Y1KtB80YKzzMnFU6dRgO4gYFRTsmn8vEZzQWjud0YLJk8foqmwxWPIix22CWkpcRpkffFi96iK0
	SN6CXWV9Q5ZCHcZWrX6cGOgc2+g+SnNaOwOF9OwBt0x7fF25INK7Kg9CiLnD3+QcFjzr8w==
X-Google-Smtp-Source: AGHT+IGJqhnWMpFd5AzrwtLP6iOv45ubCmVHfs7719Fi8vUpiDSkoN0uet8AEms++4EMHN3X5ehjoQ==
X-Received: by 2002:a05:6a21:69b:b0:1e1:aef4:9ce8 with SMTP id adf61e73a8af0-1eef3d87138mr32217027637.28.1740471421179;
        Tue, 25 Feb 2025 00:17:01 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6abaddsm902178b3a.20.2025.02.25.00.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 00:17:00 -0800 (PST)
From: Ming Yu <a0282524688@gmail.com>
To: tmyu0@nuvoton.com,
	lee@kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andi.shyti@kernel.org,
	mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v8 0/7] Add Nuvoton NCT6694 MFD drivers
Date: Tue, 25 Feb 2025 16:16:37 +0800
Message-Id: <20250225081644.3524915-1-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces support for Nuvoton NCT6694, a peripheral
expander based on USB interface. It models the chip as an MFD driver
(1/7), GPIO driver(2/7), I2C Adapter driver(3/7), CANfd driver(4/7),
WDT driver(5/7), HWMON driver(6/7), and RTC driver(7/7).

The MFD driver implements USB device functionality to issue
custom-define USB bulk pipe packets for NCT6694. Each child device can
use the USB functions nct6694_read_msg() and nct6694_write_msg() to issue
a command. They can also request interrupt that will be called when the
USB device receives its interrupt pipe.

The following introduces the custom-define USB transactions:
	nct6694_read_msg - Send bulk-out pipe to write request packet
			   Receive bulk-in pipe to read response packet
			   Receive bulk-in pipe to read data packet

	nct6694_write_msg - Send bulk-out pipe to write request packet
			    Send bulk-out pipe to write data packet
			    Receive bulk-in pipe to read response packet
			    Receive bulk-in pipe to read data packet

Changes since version 7:
- Add error handling for devm_mutex_init()
- Modify the name of the child devices CAN1 and CAN2 to CAN0 and CAN1.
- Fix multiline comments to net-dev style in nct6694_canfd.c

Changes since version 6:
- Fix nct6694_can_handle_state_change() in nct6694_canfd.c
- Fix warnings in nct6694_canfd.c
- Move the nct6694_can_priv's bec to the end in nct6694_canfd.c
- Fix warning in nct6694_wdt.c
- Fix temp_hyst's data type to signed variable in nct6694-hwmon.c

Changes since version 5:
- Modify the module name and the driver name consistently
- Fix mfd_cell to MFD_CELL_NAME() and MFD_CELL_BASIC()
- Drop unnecessary macros in nct6694.c
- Update private data and drop mutex in nct6694_canfd.c
- Fix nct6694_can_handle_state_change() in nct6694_canfd.c

Changes since version 4:
- Modify arguments in read/write function to a pointer to cmd_header
- Modify all callers that call the read/write function
- Move the nct6694_canfd.c to drivers/net/can/usb/
- Fix the missing rx offload function in nct6694_canfd.c
- Fix warngings in nct6694-hwmon.c

Changes since version 3:
- Modify array buffer to structure for each drivers
- Fix defines and comments for each drivers
- Add header <linux/bits.h> and use BIT macro in nct6694.c and
  gpio-nct6694.c
- Modify mutex_init() to devm_mutex_init()
- Add rx-offload helper in nct6694_canfd.c
- Drop watchdog_init_timeout() in nct6694_wdt.c
- Modify the division method to DIV_ROUND_CLOSEST() in nct6694-hwmon.c
- Drop private mutex and use rtc core lock in rtc-nct6694.c
- Modify device_set_wakeup_capable() to device_init_wakeup() in
  rtc-nct6694.c

Changes since version 2:
- Add MODULE_ALIAS() for each child driver
- Modify gpio line names be a local variable in gpio-nct6694.c
- Drop unnecessary platform_get_drvdata() in gpio-nct6694.c
- Rename each command in nct6694_canfd.c
- Modify each function name consistently in nct6694_canfd.c
- Modify the pretimeout validation procedure in nct6694_wdt.c
- Fix warnings in nct6694-hwmon.c

Changes since version 1:
- Implement IRQ domain to handle IRQ demux in nct6694.c
- Modify USB_DEVICE to USB_DEVICE_AND_INTERFACE_INFO API in nct6694.c
- Add each driver's command structure
- Fix USB functions in nct6694.c
- Fix platform driver registration in each child driver
- Sort each driver's header files alphabetically
- Drop unnecessary header in gpio-nct6694.c
- Add gpio line names in gpio-nct6694.c
- Fix errors and warnings in nct6694_canfd.c
- Fix TX-flow control in nct6694_canfd.c
- Fix warnings in nct6694_wdt.c
- Drop unnecessary logs in nct6694_wdt.c
- Modify start() function to setup device in nct6694_wdt.c
- Add voltage sensors functionality in nct6694-hwmon.c
- Add temperature sensors functionality in nct6694-hwmon.c
- Fix overwrite error return values in nct6694-hwmon.c
- Add write value limitation for each write() function in nct6694-hwmon.c
- Drop unnecessary logs in rtc-nct6694.c
- Fix overwrite error return values in rtc-nct6694.c
- Modify to use dev_err_probe API in rtc-nct6694.c


Ming Yu (7):
  mfd: Add core driver for Nuvoton NCT6694
  gpio: Add Nuvoton NCT6694 GPIO support
  i2c: Add Nuvoton NCT6694 I2C support
  can: Add Nuvoton NCT6694 CANFD support
  watchdog: Add Nuvoton NCT6694 WDT support
  hwmon: Add Nuvoton NCT6694 HWMON support
  rtc: Add Nuvoton NCT6694 RTC support

 MAINTAINERS                         |  13 +
 drivers/gpio/Kconfig                |  12 +
 drivers/gpio/Makefile               |   1 +
 drivers/gpio/gpio-nct6694.c         | 463 ++++++++++++++
 drivers/hwmon/Kconfig               |  10 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/nct6694-hwmon.c       | 949 ++++++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig          |  10 +
 drivers/i2c/busses/Makefile         |   1 +
 drivers/i2c/busses/i2c-nct6694.c    | 152 +++++
 drivers/mfd/Kconfig                 |  18 +
 drivers/mfd/Makefile                |   2 +
 drivers/mfd/nct6694.c               | 378 +++++++++++
 drivers/net/can/usb/Kconfig         |  11 +
 drivers/net/can/usb/Makefile        |   1 +
 drivers/net/can/usb/nct6694_canfd.c | 799 +++++++++++++++++++++++
 drivers/rtc/Kconfig                 |  10 +
 drivers/rtc/Makefile                |   1 +
 drivers/rtc/rtc-nct6694.c           | 286 +++++++++
 drivers/watchdog/Kconfig            |  11 +
 drivers/watchdog/Makefile           |   1 +
 drivers/watchdog/nct6694_wdt.c      | 298 +++++++++
 include/linux/mfd/nct6694.h         | 102 +++
 23 files changed, 3530 insertions(+)
 create mode 100644 drivers/gpio/gpio-nct6694.c
 create mode 100644 drivers/hwmon/nct6694-hwmon.c
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 drivers/net/can/usb/nct6694_canfd.c
 create mode 100644 drivers/rtc/rtc-nct6694.c
 create mode 100644 drivers/watchdog/nct6694_wdt.c
 create mode 100644 include/linux/mfd/nct6694.h

-- 
2.34.1


