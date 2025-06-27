Return-Path: <linux-i2c+bounces-11646-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BE8AEB492
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 12:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17B691C247F8
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 10:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB532989B1;
	Fri, 27 Jun 2025 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiXu/qqz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279ED296152;
	Fri, 27 Jun 2025 10:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020065; cv=none; b=F8HEMQGZUprGtgV7g5OKrlUQpm3Q5F8+S2mmkfbIqNwSU1RJZJdzHCnQb5Nc78xTx3p9qbSaaAu94bloTm7J2I3fTPTOjOq9OvCNzw11IZgTwOpL+5gY8ULwptLbzs5C6BS1cDfLtRF3g54xeRBiY+Uqb2geDPGU/hJodX6zsMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020065; c=relaxed/simple;
	bh=ilLYuWYgNvRme+vA8UIbLITDjndxSMNX17BRpkXRAyY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DVvStGtIx/keefXHrdPVmvSSQ193K9PfYjQStkLxWPbSktl+Sqsb0kbJ/wLOmy5yJTJVcoit2XIK5TP7wnMzuqfhD/lUvO9+jROgHW52nVffit1r2EzlofmEaEmwuwOfu1OPX8wsBDd1ZR43nm6vXqwEU2iyRiIAssBDg1sqctQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiXu/qqz; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234fcadde3eso29446215ad.0;
        Fri, 27 Jun 2025 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751020061; x=1751624861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ml+sJ3t+hrzE6M4hEh2cclrzvCQA7k6IfhA9JVfhJ04=;
        b=kiXu/qqzOhcgA8XzYjf9adQah79lq2pPktCs69mGZYvSyJdpKD6yEDPPsxJuLTpTY9
         Ls6Izr8GAV6qx/HB86kGvBOeHnmmWPQFDvQWmiVeYMwhuDP6gqMW8MCVuxG3DjfNi2Fx
         rnqw068vIsofKhqupWbQdoENZAe09x+ixJ6QeIdCpkjWVdsLYHWbjeCQCWuYUyp6WA/D
         Wt8q0sLswC4L8r4ECIntCfmTYrW2RRX8l5l2Dbsv7g4d6DPub6hBFd+xGlDfGxQa1D9+
         trixTP6GQ86LR3ThjwO2KyZaXah/LBKI8830mInOim9+F/f8asrITDyIWGiFqhJ+euca
         GLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751020061; x=1751624861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ml+sJ3t+hrzE6M4hEh2cclrzvCQA7k6IfhA9JVfhJ04=;
        b=RK36Nx20C0jmyzW3mNxjtpOTqFjpwUpeqTH3xfKiGIwWYPXAcgMWCqQEH0Kt+enjW/
         j3+Yb7dfSbOXyBXaonBarZjqpF7ooZZEJCWe1A7CzSQgzxfkkS4nmrri9ORWE4AGpb3e
         RGX9BMQSOSNGZVVqhCC81hpiyY6OCdD5rT3IQOdsLzeamlPk+QfyETn7Hyusb1JHrM3F
         eCQXUgbNwxqesFSg+YAEMehEkHZiGf8QEeNheORYJr1COGegXvU473afUM9X0k36RVKQ
         F/mlZWfj/n2cNn1aBKBH+qu3/0aPbtUXagmsptsmNGnfuLhtGJZ/9gc+T2wkBawnZpO9
         Rghw==
X-Forwarded-Encrypted: i=1; AJvYcCUQyen8OXWje+aBOU483e15rwMHDN6Ie3VUF9cbxPKfZRPWUpxahRp65ZvZ2mCSsfdkRYaHm6s/fq3V+cA=@vger.kernel.org, AJvYcCUX3QTY8ZdImbd9PGNmurymTlqPrfE2yw1uWVBnEy2r0rHaNqvJxumEytxxzpNz+KpyTTj84Mq19u7G@vger.kernel.org, AJvYcCUYQdWgZJr8Aske7Z/dP7jbp3WxjESyjnVIAt8RYN4j/HKjaRDIwCb0opjCYBKZiEV4zjHfFW4ttA/y@vger.kernel.org, AJvYcCUvTVf4tCCQ2UxyLmU4aqvMuaM+L6EebHgzJetkCZvwFDdNNW6VabrkonfxCS9NbPQB6HLXatFRDmuo3Csc8ns=@vger.kernel.org, AJvYcCUzbJAW2yOzI5BkxOOVmfuMFqGv9B12Y2nDDaPE2omslrDl1WyyCH1FOeM1jHHCAh78jM6D8jPr3XFx@vger.kernel.org, AJvYcCVes8YvA42J/iS2baVne7dy9Pu5D3mlYJyOCx3C6XIsnrcLGV8P5ym2IizEcRNqmtDexFo3Bgfl5eGsMA==@vger.kernel.org, AJvYcCWAT7pq+Gtw5bHdO5QEvIzBJ4C5upcp114eoBIzyUcq6+6BKXosYFDXYJK49HboU/sYbZ4oassCSwY=@vger.kernel.org, AJvYcCWgwT8GBm4us7CunjU6554MzzyKaryc9Q817j1c9EuhBInUmq3p++Fy+h83RKL63xagbhgofnEP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2+TF3agbkQ2ezPG+R30GGCMjz+gsQY8kvtsXZSp3x7PGRNSIG
	kJ1T3EWrqS8pAeXNrdtxscJovqhv7tgiBKIhFUmxDG+rpOgiMURxlPSt
X-Gm-Gg: ASbGncuq6rzaUo80kNoeP4JG3dqNO/70okmk4NLwjfpI1iLTfGzMicd/ZvanHb9r7mD
	hL+UlqWpXjmg+0H4+x+ZH1Fh6MWmVP4hnxxUuuitXM7Ib/Y7VwyVmyb4DxiB8QLV8Xh1FfUJ79D
	nqTS+m2J4i6DB8Hdq83MayOaQ5l6SvVWilZuNJvNK56K1ki/E69rbmbCqMQNWzhs5eS1T1wkAiF
	/or2eYrLVRGleOUVl2/bz6T6HYpDFhniY1ocljz+h578PECUGaVMOnDAUP+9nMUdBY6+J8Zpl5h
	wrk0zietrvOGerx1Yh8RL0TkR7s2O5zfYB097qoARXxvo3uVnAnXyX/OZopDTsbCua/7p+mi9Vb
	Bc2xn+63myPjPf3k3QODvnOfpS1YLAA==
X-Google-Smtp-Source: AGHT+IEomNjpXipk2KD1fASP51+aM/Dp/3Q0RAuuc8il7L/rL7CjfwVnEnvP0FECYvzH0KBUv2WfhQ==
X-Received: by 2002:a17:903:2d0:b0:235:f45f:ed55 with SMTP id d9443c01a7336-23ac3bffa49mr41579185ad.1.1751020061308;
        Fri, 27 Jun 2025 03:27:41 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3bc495sm13845155ad.201.2025.06.27.03.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:27:40 -0700 (PDT)
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
Subject: [PATCH v13 0/7] Add Nuvoton NCT6694 MFD drivers
Date: Fri, 27 Jun 2025 18:27:23 +0800
Message-Id: <20250627102730.71222-1-a0282524688@gmail.com>
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
 drivers/i2c/busses/i2c-nct6694.c    | 192 ++++++
 drivers/mfd/Kconfig                 |  15 +
 drivers/mfd/Makefile                |   2 +
 drivers/mfd/nct6694.c               | 390 ++++++++++++
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
 23 files changed, 3667 insertions(+)
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


