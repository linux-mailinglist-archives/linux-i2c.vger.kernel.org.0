Return-Path: <linux-i2c+bounces-12597-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFC6B42EF9
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 03:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FB6E5638E0
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 01:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1371CEAB2;
	Thu,  4 Sep 2025 01:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0KGOLhS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7D84A3C;
	Thu,  4 Sep 2025 01:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756950663; cv=none; b=nMNLatsmFNoW5/Vv4f3cAJpjZHmhHfPg4nlNeHqY20gdpfL5ig+8++TMmuBys1uI7mYci3p3iUeGxREmwHELEfOP0PSX7EZXVS6LqGY6czL1gM3dscFP3XrQqAY3CnyJeXD+GhyW0qZIZgjkpMeA9vi6zZpVPJRNzHtBoGgWkTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756950663; c=relaxed/simple;
	bh=U4pFcnwOm3C7NzwCZfwoJsN7ESNLFiaU7497H95VrDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fx8yVQB8w9lABnTUEFAorvzxWrbPy2J6X0MIexHwGMlfz3wny4gfrwlbEL0dClGm20MkKqVwALozOJOcHafM56xJ66N0OxE7fzclY6YpCT/uXG5lG7ph25vbCVQpsjVm7AyW9A7W8DvvszhWTHfS6B0xRuEDe7CRUb32aTmd57U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0KGOLhS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-248ff4403b9so5165205ad.0;
        Wed, 03 Sep 2025 18:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756950661; x=1757555461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6CXV3Fh1xcCSiMyKIF1uC4exOouwxsiJ1Ansd6pWvc=;
        b=R0KGOLhSvX52O+ZXET+0rEedvzzdfA5f7kRoseX0pjKqeJwBaqzJ6M+rpMwRKu/i9Y
         E6PYzptojqYw5x35HMPNEI7qFE7bX9EriwvdUAc380wqpT/05lXFfTOngOPBghwinNVw
         6dtYj7ZZcXa4ZEPhNOXtVWloumKK21Lgjo95zpEz/LNhoutYnuhGEewqXrraOepk84DG
         jVubHzmk1qBYabNgCamHboX4AfxAlDIn2FIKG+a9KS4jSIu49vASwwbRwWgPPcrYXqmg
         LWwZCvP1ESXJkc6v+xI3KITRZ0NsU9QYiIhBC7627QD5t43vGs0aE9fViuvhfqhP+O+X
         GMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756950661; x=1757555461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6CXV3Fh1xcCSiMyKIF1uC4exOouwxsiJ1Ansd6pWvc=;
        b=pafiH9Nc6FDxLL5y/Ew5UWpAVPkKCUQyjFgA9OUEwjQY2sRFluHHpY88HuPPv54l9i
         8/cduX1Qgv3C2EK2jiHmHEL6cv59UEmK2GLzQDyMUJCsHr/nAUsLLtdC7SX/thm79aBt
         xiv/PvlCq3XINcK58YE62akWrnzoSY833H1fI994rf4v7GELGkonVBy3tgs9Lq2WMruY
         ahIMgKKs0S+QBMO9bMqJjaiPd+BwENpL6m1jVZddc7E3Wmnxk2psjyYETKPu2Ix6B7mb
         uLa5awha8bN1BgHgW/F5CihM7mktgS+I67nyRYRyvmOj63IwrQxIgjjLbkzkKOfewP7r
         x8YQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/T4OCA8+Jx215SN9j6X2pBW/qtWNFhwuFih3pxn/TD28QKAKbxh4VLgp++StwM0mDd/bAC/4B@vger.kernel.org, AJvYcCUgmgakz8tLfPf4XhBVZ+z9reEOqYIu9SIvfqZBgDCXUv4w22u/gBrRZzNFfJjI0ZeCpd43iWz0I/tZ@vger.kernel.org, AJvYcCVqqydHLdQGMKCdPLOtbcVC2MnLvwed3MskKYhGqXDGRwoCnVjozSOdvI1Hnth3HqSTOWuP4FDw9nB8kSzTrpI=@vger.kernel.org, AJvYcCWbQKmjKY8EPFKIdDHuiu0Ygk+z4IgMq+NXQ+MTtS9z/Yv4KoN/lkGzqsDS+1huMh14jCITi3iIkAg=@vger.kernel.org, AJvYcCX0I9864DOETn8WsKK2n+f7RnCLwaJmv+ANJXV7tYsoChomPN2Miwzvt85yNpiyUa/0nDUjAhVN/z/SDQ==@vger.kernel.org, AJvYcCXOGVcCYY9lhGsIdJlRfWws/OGh3/7JiB49Bb+0CVgJmnK6l/gDGqfeY7HHi9H3c1oNaKWTbch/r6a+E/A=@vger.kernel.org, AJvYcCXi79kgbJFmGeUsxCDPuBWFJM5kyJxbAzZPyiQOeprfNSwumPWdUYBQtersoE5K3yUhstFhwAlc6Nwi@vger.kernel.org, AJvYcCXt58H/sRVqTpYmW+ZLqY9pEOcteUtv4E8JhADcaN1iAY4doDxcYVb4STdnNUZhaLhjfUj50UADYwbY@vger.kernel.org
X-Gm-Message-State: AOJu0YwTGGS30yKm+FxCYATyzS/g86SRdtsprx2UG08eKSOPsBhRnhqj
	tm6bDAtAnACpYSE7paTXZOlCyQjd/1s0T1kQbkPb4ExUVh4p6L66WHw5
X-Gm-Gg: ASbGncuHOrGYeCbklt7rE8gEOKSEiFYx8E2L3dy5Idx4nHVeGveJ2HZa4gRHvEDRN5W
	smM9a/uOq5QV7umt270HfsoNkWsReFEItQLJvgcOxjSYE0jTKAh0tr9xjHqVXLjrYn0T6aNoQuv
	vw3FCORjf7yVe+dGmT7j6c9dNfuRz5IXfBOQkRDpzSH34dnRm5L3c+W7EFb8TZkmSlfRHU+9SmG
	ZPq63X2tJKkp/5d4uSK7ZbvwNfHUCVo6wWv1bzt/IXKSWb1EUG/2s27JnB18Uj5wHOlkwy3A2ji
	nO6v9rX2r5enGcFmHv3Zb9EyXK3lSVhoSWIKzQtWauskgHqHdGA01XMF8tKFkzkUX5DORp4Xrs2
	UtFwrSNRrlKR00UEbgShB3Vei0pEWfHtEtHpaGz3sjzH/XwW5QJYNvqARdgcelUkgYl/AjctEqA
	bXhJPGk4xSx+A=
X-Google-Smtp-Source: AGHT+IEAWvXeI+ypTWFE3COaaG/m2I3z5ewQcw/3MFTmgsXsVlgCrZumetFwq7lfhkQsWaueidHcZg==
X-Received: by 2002:a17:902:d482:b0:24b:640:ab6d with SMTP id d9443c01a7336-24b0640ba6dmr138225865ad.49.1756950660583;
        Wed, 03 Sep 2025 18:51:00 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329dcc0af56sm7080205a91.24.2025.09.03.18.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:50:59 -0700 (PDT)
From: a0282524688@gmail.com
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
Subject: [PATCH RESEND v14 0/7] Add Nuvoton NCT6694 MFD drivers
Date: Thu,  4 Sep 2025 09:50:41 +0800
Message-Id: <20250904015048.1801451-1-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

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

Changes since version 13:
- Update to guard(spinlock_irqsave)() in nct6694.c
- Add struct i2c_adapter_quirks in i2c-nct6694.c
- Rebased on top of v6.17-rc1 as requested

Changes since version 12:
- Implement IDA in MFD driver to handle per-device IDs
- Use spinlock to replace irq mutex lock
- Use same email address in the signature

Changes since version 11:
- Use platform_device's id to replace IDA
- Modify the irq_domain_add_simple() to irq_domain_create_simple() in
  nct6694.c
- Update struct data_bittiming_params related part in nct6694_canfd.c
- Fix the typo in the header in nct6694-hwmon.c

Changes since version 10:
- Add change log for each patch
- Fix mfd_cell to MFD_CELL_NAME() in nct6694.c
- Implement IDA to allocate id in gpio-nct6694.c, i2c-nct6694.c,
  nct6694_canfd.c and nct6694_wdt.c
- Add header <linux/bitfield.h> in nct6694_canfd.c
- Add support to config tdc in nct6694_canfd.c
- Add module parameters to configure WDT's timeout and pretimeout value
  in nct6694_wdt.c

Changes since version 9:
- Add devm_add_action_or_reset() to dispose irq mapping
- Add KernelDoc to exported functions in nct6694.c

Changes since version 8:
- Modify the signed-off-by with my work address
- Rename all MFD cell names to "nct6694-xxx"
- Add irq_dispose_mapping() in the error handling path and in the remove
  function
- Fix some comments in nct6694.c and in nct6694.h
- Add module parameters to configure I2C's baudrate in i2c-nct6694.c
- Rename all function names nct6694_can_xxx to nct6694_canfd_xxx in
  nct6694_canfd.c
- Fix nct6694_canfd_handle_state_change() in nct6694_canfd.c
- Fix nct6694_canfd_start() to configure NBTP and DBTP in nct6694_canfd.c
- Add can_set_static_ctrlmode() in nct6694_canfd.c

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

 MAINTAINERS                         |  12 +
 drivers/gpio/Kconfig                |  12 +
 drivers/gpio/Makefile               |   1 +
 drivers/gpio/gpio-nct6694.c         | 499 +++++++++++++++
 drivers/hwmon/Kconfig               |  10 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/nct6694-hwmon.c       | 949 ++++++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig          |  10 +
 drivers/i2c/busses/Makefile         |   1 +
 drivers/i2c/busses/i2c-nct6694.c    | 196 ++++++
 drivers/mfd/Kconfig                 |  15 +
 drivers/mfd/Makefile                |   2 +
 drivers/mfd/nct6694.c               | 388 ++++++++++++
 drivers/net/can/usb/Kconfig         |  11 +
 drivers/net/can/usb/Makefile        |   1 +
 drivers/net/can/usb/nct6694_canfd.c | 832 ++++++++++++++++++++++++
 drivers/rtc/Kconfig                 |  10 +
 drivers/rtc/Makefile                |   1 +
 drivers/rtc/rtc-nct6694.c           | 297 +++++++++
 drivers/watchdog/Kconfig            |  11 +
 drivers/watchdog/Makefile           |   1 +
 drivers/watchdog/nct6694_wdt.c      | 307 +++++++++
 include/linux/mfd/nct6694.h         | 102 +++
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
2.34.1


