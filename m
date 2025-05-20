Return-Path: <linux-i2c+bounces-11054-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD88BABCC97
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 04:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 777A07A49B1
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 02:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2282561CC;
	Tue, 20 May 2025 02:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YH/fteTS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DF41DC9A3;
	Tue, 20 May 2025 02:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747706653; cv=none; b=MRkvMPoaEBuJ7L6EYoQ7pdIma7USInxdxt5c+Tmho9EL3IUGrEasUkfDOCYUr/4VuT8/iRvRRl/MqWUzkYAzXrxjZskNkshCJBE5q9rBZLWNOuuIomU53SR5dhE3ftSIX689GA6WQklZwrnhWa8dB1dlDCQzjy8TIpbpGHfUrBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747706653; c=relaxed/simple;
	bh=eZevjrBJDQd84ux4Hn0Tssg/hRPdrOsP77nOURTRkoo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eMmh9FaOsKDQdx63P3OAOXYN5EiYsTARX7hg0u9NeDNdKoH6alPCrMAU/gQJwYc8oAEtrT3kGzuutfF2lnqDjquxlx+V4btDCxhlVxUDL1d3aMzrGJRtSbkqshhf8E/etQlfndjesqdQllvyPc4COceTa0TSJjzZxQeDxVrjTAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YH/fteTS; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b26f01c638fso3481784a12.1;
        Mon, 19 May 2025 19:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747706650; x=1748311450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHhCVuI9jfUfhhUD36lWqRN5JsHeOM1NCpeDQ6ZpDpQ=;
        b=YH/fteTSJD/2LIVshKu/BOibn8pC/aPFm9QR+xx7SUrVw3OV5hcYni8N3lAp46rTmO
         73KnbILWPlPtsxextpRrGyoWgXEiwof63dmdhx3aC1wxQtBVHarE31ryAIbS+3nIk44r
         O4gyk1qrOUxExcpjF6qXgpF6LYZ5xBqYXSJzslGtqlbN1ukM6IyhZkqVRAGfGK1RKf2j
         z3h6o8nU/RHwQ72QLWyoZWqu86rvXgGKfE9fJ5xp7Ic288oRYvoXCD81hUvY51Lt6g5e
         XDXixAp2nPahK/5pEgJuBwsB58Q+5D3RUkYa3e1+ja5P2IEK+eUtHDxrribAnquFxi2j
         PYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747706650; x=1748311450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHhCVuI9jfUfhhUD36lWqRN5JsHeOM1NCpeDQ6ZpDpQ=;
        b=LqZIYaAzQZIHm1kqmldJt7OIIJwsxm4nInggkIugz2MzTZbb0SWfH1g5X9aRuVXuHO
         CtcTFwYU2t/bTIvzFkNsFUVeq1uZUXS9bLSWeessO4paKp3xFbQlrW49MWLULbOf5mTw
         1UqyY/xnI+/WucrNJdnEclvfuOCgd5dOmN5mSAjdygt1jHL9e5y0hWzenyFCeoDJIvkq
         +YTHkPLuE8j6dyAx/KibYPGrQ+wGvywjCQ4ulZ+yA3v2d4xVLlNdtFLPcvZFmtj3PikC
         W7uyB+dIExhlqkwecSqnioWEEuByoB06RXmbR9rml7pioRFKKt5Pzl9XdBHiQay1fraX
         RFsA==
X-Forwarded-Encrypted: i=1; AJvYcCUbKi8hTwJ/OR86vU3xv2zhcAYlOVfKsogpyrIvRV1yT/ebU24lFSMVjM+5YDvL02oqb88u6DfI+oQ=@vger.kernel.org, AJvYcCUbwkhL2BIm5pm9mferv+dPVvUY+Nz1N+9zBmN0Zq4jzMSJQbYhUSfeFUMHXADJztH+mrq5fYbh@vger.kernel.org, AJvYcCUfjRUFS653UbPnfc2eKiCWtJoztWcWjEs5Kd/pDtAoOf42NgFEj8o+LNPCVSWjIHG7Km0QkeXXlUaQ@vger.kernel.org, AJvYcCV1rqFnCk+tPsDrIpiP/qFc8VUyLepKLyI945IS+LoHmBiQrnswOkvxnUAHv6hCeWBw2WxRcXjdnsSPyg==@vger.kernel.org, AJvYcCVQ9GeA63u+VsoEGfuqFKgZ/mtRWA42SEdr4R8W+jcAM5NGSnHNGi/XvvGOUU59y8zrVLdI/KgBXsRJq9o=@vger.kernel.org, AJvYcCVXzJaX37Sv0Qws4VSALOhWLyzyy/5nk/wsnaamYPfJ5pZzbet4CsK0/yso42Jq8rUGb87+9nm8F2Sc@vger.kernel.org, AJvYcCVkOIyy8lcURSJVIOy17w3pYyeXTWLd3dhE83CubjZ3/TrUPiX6GMUgDLHXdPWxZCLbBOFFeg5Ffsq7@vger.kernel.org, AJvYcCWFlVw6Ofrcr4DmqOMtgjKhXMU67bcLSolu1/Eiu5RUKWufg0CTG29ujlNtZ+5b4Gb5o1bs9ZP+uC7ThzLlNDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXqtzE2PsxdA3VJzQ1f8JqEb9W9sJDjvUkgOBfaVGWdC1YlrTQ
	EmTeIrtZvAT1Lgu7j2mHwz0VkD+Yt8os8wKLnNK+OEYLBcpW0CI8uKj5
X-Gm-Gg: ASbGncsQp4zh9CZD0g2Ike0VjuYTiq2qL/z/NAaCGBxD3+4gaY0e8S76H5pPd9A5z1W
	Jl4y3V0cIH6072MFCpIIBXOs9UdWIRZ1ks0IdBc7XvNVCfhN7FDk/5dz6OAvG3nboOaqLdsSj0N
	yRyNa2SFVJL1cPl1sh0nIGIYIl+XrTdmktAhN+DFqn70xqTzu2MqESbboXKS0A38W0p9+fnjJkI
	Jw3KTrE8j1qroSCC36FzF/I5zG/2G9CH2a5Ob7OUvifgXbfO3NJVga+0GRf0JJSQgO7XltB6bTg
	EYzjH0daadrrqy6RWQNSwGhPTjbu5PktPPVPUy7Y6V2fttR8PT3BXuAyoTwDYRzx0S6cmbvw1Oa
	hbqnVXhdRagNqJebn6kjgCFUV
X-Google-Smtp-Source: AGHT+IHmvL20VOsrYUkJJnx0emX68OO0uubs/euN6jS0aBRwShJx/pvE5WZTxmq6zBIHRTSrcJQstA==
X-Received: by 2002:a17:903:acb:b0:21d:dfae:300c with SMTP id d9443c01a7336-231d438b4cfmr192393265ad.3.1747706650362;
        Mon, 19 May 2025 19:04:10 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9fc8sm66543855ad.27.2025.05.19.19.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 19:04:09 -0700 (PDT)
From: a0282524688@gmail.com
X-Google-Original-From: tmyu0@nuvoton.com
To: lee@kernel.org,
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
	Ming Yu <tmyu0@nuvoton.com>
Subject: [PATCH v11 0/7] Add Nuvoton NCT6694 MFD drivers
Date: Tue, 20 May 2025 10:03:48 +0800
Message-Id: <20250520020355.3885597-1-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <tmyu0@nuvoton.com>

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
 drivers/gpio/gpio-nct6694.c         | 496 +++++++++++++++
 drivers/hwmon/Kconfig               |  10 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/nct6694-hwmon.c       | 949 ++++++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig          |  10 +
 drivers/i2c/busses/Makefile         |   1 +
 drivers/i2c/busses/i2c-nct6694.c    | 193 ++++++
 drivers/mfd/Kconfig                 |  15 +
 drivers/mfd/Makefile                |   2 +
 drivers/mfd/nct6694.c               | 387 ++++++++++++
 drivers/net/can/usb/Kconfig         |  11 +
 drivers/net/can/usb/Makefile        |   1 +
 drivers/net/can/usb/nct6694_canfd.c | 837 ++++++++++++++++++++++++
 drivers/rtc/Kconfig                 |  10 +
 drivers/rtc/Makefile                |   1 +
 drivers/rtc/rtc-nct6694.c           | 297 +++++++++
 drivers/watchdog/Kconfig            |  11 +
 drivers/watchdog/Makefile           |   1 +
 drivers/watchdog/nct6694_wdt.c      | 320 ++++++++++
 include/linux/mfd/nct6694.h         |  98 +++
 23 files changed, 3676 insertions(+)
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


