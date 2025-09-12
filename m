Return-Path: <linux-i2c+bounces-12905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614FAB54721
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 11:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D237585AF7
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 09:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80452848BA;
	Fri, 12 Sep 2025 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkYFEvJX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C289627EFEF
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757668818; cv=none; b=KZfa2VL4w3S3lxytgcW0OnWbMFvvEDaLwN35gB3hfqpAzvO6ESDR7QZMr1pgjppugI+55hpI7yb5EOUjwZzpIp+rTHfvUXNFQZiFujvI05LmSYfJa0NFESy6qNa2U62ioC7QhJMxHBhT7TLQB4B69GvopLq6ZDPsSKEEO0+jJMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757668818; c=relaxed/simple;
	bh=T9Aoki8buNhkCRqRhF37UmUg9IM5tQBBbRoGaGLxHaY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qmsQZohLkLoan/+egf4BW0IvWk9puNXFYoWDdufWOJE+Lq6W+MHGiaLWGaVXvWUXpdIVcPjhhcgkTMOSsffC1O9hX3mvohmrFPyd7bR2KMxAlaYEXoMK9ANvk4nc5T/fMDsG+WT+QmJ+k/QrfSsel9OiY6J7w4+ueRG6ynjdJns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkYFEvJX; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-323266d6f57so1795102a91.0
        for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 02:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757668814; x=1758273614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HitU3DennYrxhEKvZM+vyEsQqgVOioNwRkolcuuThlw=;
        b=kkYFEvJX8HLhNIY3Dz3DiuE7utjNwsztXhDNz6EpqOhWt/qFSu8csrB0Irpx8YNebz
         4uadDxCsUyooDcE+GUoKxZ8yKtOXG9XUwSAuIAenvQOMQV4/fPwQdYkog6D5LwkByVt7
         XWdcc/5a59r673Gi9X+lt5a978krYTInRf21HMcNKL7n8QFwAhpTWhBchpglm++ervK/
         XtCZJu+ReRM066nXC1cZcPVnQOf0cZGeR2qUkkufBc02JdH5DqPqyEwhDoSfjAZq7Lgi
         p+YJ+ptLBmiUFEMM58/iOgUjFqnscEQAtppAQtfn9m+0vL21i+wbCBsMQ1TpNj69bX33
         OrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668814; x=1758273614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HitU3DennYrxhEKvZM+vyEsQqgVOioNwRkolcuuThlw=;
        b=k4GEseZO/FVipaIHnqTLKd44FaAoCerXvF8LNm0YkACwM4+YQjig3BYU7Fy9BUvgIj
         VVJQJjkdiwYNUTD8nasvv2rB9Jz9JqYqczDE0B0dthfM+SQc2onIn2UucqHKq/mN7KAg
         Lkxx+p/9BiH6Z72AZsDpAKqKCRqElRUXQCQAHB9pYrLofFEGrvRIVSx5Mt4pX97a1cqt
         Tt/m4scxfS8P8TR4RLdfWFpwVyaPtHHeT0D0P9jkTI3J8gZfIduRL8rWOonnAg1/jryc
         BiKPFsT2Nu9a7pPgpc/qR2qgBdCIjBMEltSc0OUKiYcDWmChPEfPIbiaNvM322dLjQWK
         hCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/WViwvfObq+EqlFSNFYj+OojG8887URSV1czuT/x0md4TAkZ3XZFAFivsQb8gR3xBkMV8XCV9sH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyiyzt418fWLUZ8y0H3I0F/demJiuUgtxGn3Lwkae51Uok/iCa
	xR5FNFh5fICpkAn24axYXFQ6nG3C0ou0Pig+I7x+K9Bph0GAwp0UJMBo
X-Gm-Gg: ASbGncsfdOwe012pixVFJA1NG3fTEr+cXFPO9F+kUhrwDRzSsjZq+uRdm+mWmW90svN
	QrmIvXJh0tUQsQlAXD3k2R3drgmRX4ii6Jr5m0akfTQqXZsir3O41oxzRqXqAMc/rkUQeZfdZIK
	Ll2WQbOueibvh8mOE5UYxm9a2zeYjLpuMRZTJW8poL+9v7bDy4m6IAFy+XJcvolMd7uEBB0m5Kr
	zRRmRrw/pq+1vYOImCNWp1FQUKrYOPu7FUcL79mkTvVSay9Ocqgsu309mnqMKnE8z07YeC5p67v
	zpLZWIYclDBMRDeRcVt3DGOqrNQVpvq8u6pM2gzcq/Pid7C6LRmC38oQUIyLQDFPu27VCKQXtJH
	qRFd5IF0syzGvEgUcGhF9KhRFI6dt7SivGz/z0g267Stir/Ah5hBWahlD5BJSKGHF9I+mNEsB4U
	6P
X-Google-Smtp-Source: AGHT+IF4/c+xTPJtNbFlPK5aD3fyhCJMxeEJ56g6T130kwwoCKx/W8YNGNbvJFVgYXViqFnc/Ri6ow==
X-Received: by 2002:a17:90b:3c8c:b0:321:6e1a:1b70 with SMTP id 98e67ed59e1d1-32de4d4b240mr2540833a91.0.1757668814111;
        Fri, 12 Sep 2025 02:20:14 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a36dc461sm4066564a12.23.2025.09.12.02.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:20:13 -0700 (PDT)
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
Date: Fri, 12 Sep 2025 17:19:45 +0800
Message-Id: <20250912091952.1169369-1-a0282524688@gmail.com>
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
- Rebased on top of v6.17-rc3 as requested

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

base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.34.1


