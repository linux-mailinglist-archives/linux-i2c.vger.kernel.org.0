Return-Path: <linux-i2c+bounces-9153-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0216A1A065
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2025 10:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58BD4188DEF8
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2025 09:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20F320CCD0;
	Thu, 23 Jan 2025 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHj4H4cf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBA415AF6;
	Thu, 23 Jan 2025 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737623505; cv=none; b=NgsXzBu+bvpCA7GU7DpvQxfJzH6KoojylVYmU1MW0ZD4zScrjjUc+4U4UCU366Phws4xnIcCQfibA5sbv5YLofu70f2BrM82yC07IzyWrgap2oL+I38LImTO7IrReiK5zBY4IKYEglibTaJrHVCaJfM+Rk+kiOm3+yZNwjtipvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737623505; c=relaxed/simple;
	bh=C4/gkseYCHFUnrpTuEcYwbjJfhLTgduIxSPhTi4VqL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bxAJsHS9F8Rh8KoyyCsDBesF6qfhKbRmVQi4yFUGZgFq8/+8jg7a70MeBzQQYpXNk8WsZvQ65zF6B8mZfkRG8fAvkLKRdfsXIl+zL9HgiUz24VBRA61BW6F6Yl4/0an5lLCHHIMo5/Aa0sxktRMkJA3l7H+wt1/WHRUYfA/HCA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHj4H4cf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216395e151bso9053445ad.0;
        Thu, 23 Jan 2025 01:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737623502; x=1738228302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpnalNMAcB0X5bxsG0IkO4Lsa0UkqzmKINth8bDRb0M=;
        b=OHj4H4cfBK5zJYbkZblYEQv0b+ap0SQ3LooiYZa+eSTJbJixHR+pqrNMNy5ANr1uY8
         2UU5lXh/8NFEMmelzbPcmICNndQvVqQUnGdjOaUqFHBunTsrY2jw6gORFzqTjED2HRLB
         PpI534a/JPavc7eg5VBynCzGhRbBnIAluRhZTwEdwaNI4h8tmDBM9ekgRw2E8UgUpjkk
         uAIPPMGDV+3kRzh3/1lvxMxLAwxrCxMn8tPuXe6wCCDLJw0bnXL99RfG809nZQHJ338F
         +u/ka6weNH5XKpRNgk0vh4Flxefyt9vQlAq1j8gf9Z3Dn8QPa9rqCBTHCMBVaSSiK7KW
         wTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737623502; x=1738228302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpnalNMAcB0X5bxsG0IkO4Lsa0UkqzmKINth8bDRb0M=;
        b=Y2syQkszJj7o02QBRXlI5eZj4VddJBXk99ohRfDszBQ/AeZ9j5urIKnDs9pFrkQc5T
         B42htMSQfcH7A19v8EpsmZ/FeLyVpYEMDC+ewCKwwkVM/OEcR4pHTsSlW5YCNisDwLqg
         s8NyzDKjIvQ9j+sK8hEhMV/7EwSukyOXWlA/XHekWehN/zCb4HQK7HNHPXT9lcjTEoXb
         odXjXWsv2FpwuzL6UIvSANjx7crQGNqO6BAsl1uRxwTMEUO6O8HS3VolpCTNzUwJGF9M
         ECsgt3RqMERRGymjI2GkijlluIO8JDogu4Jl+5et6erqDZYAF1Q/1PtR6Q/MaOR+cEFY
         nz8A==
X-Forwarded-Encrypted: i=1; AJvYcCUH0QBL+BlcoevEZFr4mrq7QBTgBGLATtPl9suMPXo2vFyJBGTLVhjzScztoljqtsPx6r9sJI6XjhonxrwfJpQ=@vger.kernel.org, AJvYcCUgdehZuVI4NjjmbxgItnCQ/N9dHdTLWPjczVK70iuxkg3e6DXX5IYv3ZvXpQUTH5M+Or6aEUN4ogFImMk=@vger.kernel.org, AJvYcCV6MtnEbrw/y+f4d0MRiLcWLGmSyzJp0IHUgnSrG1z9OSpMKtO17caSRDIy7TWEeQmYZo30kQkvMsNo@vger.kernel.org, AJvYcCVTcZEL1JUjYkqIMf93mXkP4woNeaCLLuAddB8YaRlQoFA/aVp+wGvwzfz7DmipgIEQ9W5p3DjvRddn@vger.kernel.org, AJvYcCVreXUvO6tZedlo46B0icmLMxK54GMUjgYw7852xnDnU230FChoxjK+LrCErCB1ApJS5LxHboukQtcTsg==@vger.kernel.org, AJvYcCW0wO4pfC9TjB5Ox2cbdtxz5Yg+hiBJdEM8Gv+2vC+06787krvU9wsylRRV0ppFHj9X/eqx0W3P@vger.kernel.org, AJvYcCWgIAqkOzvIFyuDKL6odjKIPyJrhke9Iak1y3WYGOjsB8VrnHh2cKjT0fnURmrPnkL+Htjy+8L/Bbk=@vger.kernel.org, AJvYcCXb4ItcQBhJPTClkk612rTv1zaLsp2zg7UgI9BrO5S0wVkwDNNamJdy0IOwa60UwQ66CU6qGMDrYQtT@vger.kernel.org
X-Gm-Message-State: AOJu0YyAai/ZISlrYHSGoI9WSG0S8vForzn4KpJg2/KiMbSomEm5vk/n
	kauUxftrBSzvUEgQxlWLWox+8Ws8tjuN0iTNZJlXF9tydgp52JOF
X-Gm-Gg: ASbGncuHbdjQJxObvvr0aXJnpw9pyG9X6ZSTCZc3/0xKm65hl4HAVBzV9hvnzV2wRAc
	qDWuVmyqInIsdRqjtomzitO/QNTwieahIktHe5pNDrlz9eEyiGmWio75lkIFXmvgzCdGo+LZ4kD
	RsgezRRgeM6OkgnMyt/9lNdKiz11WyBg1D21bwyRYq2lUbAScktnqBh9WxwDeWICnTPhk4XxQzL
	KHt7dgoMbeADy9qfxuOJaY8vYB8Y0LASQK7cP35pEE++vD0hsucrJPjKA5fQb2HBFONloc+rYVn
	NuQu8Kggp/sb2Xm/eQq8+7+hhV5RmHNBnHKzzBhACK5FQBqnixAmMJY8vYo=
X-Google-Smtp-Source: AGHT+IE39pzaBCumNDr6xqj4biR1pmBXlgpwj4Dha4qjrQEuLNxAAlGgTymkd3CYYourpAruE5yynQ==
X-Received: by 2002:a17:902:d54a:b0:215:758c:52e8 with SMTP id d9443c01a7336-21d9934b5d4mr48677125ad.12.1737623502283;
        Thu, 23 Jan 2025 01:11:42 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb735esm109365365ad.64.2025.01.23.01.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 01:11:41 -0800 (PST)
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
Subject: [PATCH v6 0/7] Add Nuvoton NCT6694 MFD drivers
Date: Thu, 23 Jan 2025 17:11:08 +0800
Message-Id: <20250123091115.2079802-1-a0282524688@gmail.com>
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
 drivers/gpio/gpio-nct6694.c         | 457 ++++++++++++++
 drivers/hwmon/Kconfig               |  10 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/nct6694-hwmon.c       | 948 ++++++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig          |  10 +
 drivers/i2c/busses/Makefile         |   1 +
 drivers/i2c/busses/i2c-nct6694.c    | 157 +++++
 drivers/mfd/Kconfig                 |  18 +
 drivers/mfd/Makefile                |   2 +
 drivers/mfd/nct6694.c               | 373 +++++++++++
 drivers/net/can/usb/Kconfig         |  11 +
 drivers/net/can/usb/Makefile        |   1 +
 drivers/net/can/usb/nct6694_canfd.c | 813 ++++++++++++++++++++++++
 drivers/rtc/Kconfig                 |  10 +
 drivers/rtc/Makefile                |   1 +
 drivers/rtc/rtc-nct6694.c           | 286 +++++++++
 drivers/watchdog/Kconfig            |  11 +
 drivers/watchdog/Makefile           |   1 +
 drivers/watchdog/nct6694_wdt.c      | 296 +++++++++
 include/linux/mfd/nct6694.h         | 105 +++
 23 files changed, 3538 insertions(+)
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


