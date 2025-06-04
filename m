Return-Path: <linux-i2c+bounces-11239-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 403ACACD6D8
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 06:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB171189024F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 04:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63052620CA;
	Wed,  4 Jun 2025 04:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4PbTDGn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88551876;
	Wed,  4 Jun 2025 04:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749010480; cv=none; b=ggjYwg5Mv8LtruUXHCuyqJIX/HjCdhM1rnrj/Gstnb0e7qAvdWAaxVWJIUg9YiKL1YKAP4LpOuel+dLS3Umagx45jFO1VDFSo26dkttUeyBKR00ZPMFAnpREFjm+ihm0qdN4IXjOyHsNNYH8RQb4oMoPTNd6n3vqmgs/ebE1VZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749010480; c=relaxed/simple;
	bh=Ooc4rwgOmVTDBYoJuDOLjlichD6bq6i6WP/iNrY6I+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lU0Y0MJd2/z+kKkOXcz7cnPWuHJv5PxwhKmJPv7rjoZIOkTidyJoNkTgziXO2awwtLgbl9ztQkqDwfFuqw3s/WHSfMzpfdD73gIAU6ZKoQl17VH0eFofak1+Mzz3mhbLpPlWpY6WNjh2AVZ/1fY3jTZBND1XTPN30mCCdnOVd74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4PbTDGn; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-747c2cc3419so3611303b3a.2;
        Tue, 03 Jun 2025 21:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749010478; x=1749615278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Re6lT76sWJRhrAsHMS8iwF2V7EMeEh3m0ySCqASUFZE=;
        b=S4PbTDGnqztYVvdVWO6HMqn2qVJAiOFceQ5qMGJ1iPHtmVJ9sCsGIWx3BwvxPirMCa
         ajLaYA7Fu7CrW0HaBIB7HQtuMRsmPpfTkGhgp9OObx/sL6KoSeB9DYPd6v4C4Kq4audX
         +Z4084l/1Dql0/GNefV9qe5PsCWAQivKEg+HR5uYAQGarjc6HcSH99elWrRpNged1Onv
         lWVWyxHNmIDgpSHA9GpRgQu8JjsN+V1uFEO778UV+GvRCuYjM6W1dLtJ4LsU9cHlN7l9
         k0XtJwJdcm6xNPhJxsGd7yjiRNHKsRam3+4VdMzu9qP0upcqHZRcTgiqjqfgYYlsb/dS
         WRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749010478; x=1749615278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Re6lT76sWJRhrAsHMS8iwF2V7EMeEh3m0ySCqASUFZE=;
        b=w+GENjVrpCYBY42+eP2N0RAFuvYpmpLVSg4itH5CeKEDN2zbmxSQbFoz9E0XoJ/Rnw
         CsRBcAIN7Zl7x1vC8Rxpqlso7LmfJmGbrDIga8uizySAOXmdMEtHmcNknoEeS4fHhihW
         pLFFs0fcSomSph/g7XtuYBG+tNPPQ3zjMIKGrTIseWoiSgLzqn9odLI1Gbe7DflMdjLi
         Kd5CUdztuf9YHLiK40yPi3Q0DU5wNQwlSkFxCaw92grbuKTC7wLyXo7Hx+kbod4g/yYP
         zIwLLXDo8RWZbryTtU+9YQSN/6tgoQQQz6egZ7iZIfdCvKA2PQu++wrh59E0q3SXh8cg
         zsoA==
X-Forwarded-Encrypted: i=1; AJvYcCUaEDBG3YXZUfe8UE9NB0EVGuCS/zdtEl2rsAtR4adVKIBFFwuEQSPj4O0UsbLwe6+vpJDtmKQb5quC@vger.kernel.org, AJvYcCUu4j6jq+AmxUPt1Pvrh+ZZ6kdGBs7VGJJn3RwD/2y0e//Fl355NM4ftbmtMzjQvMpGB5JzTNcPUHT4@vger.kernel.org, AJvYcCVBGYpa48G+o8rYl8sUPMzyQ2UeqRCHGESaRdsTooYig4zpW/jus0rCqoyomdhtJQdOYO3NEv+2B0wHQvM=@vger.kernel.org, AJvYcCVb6EB+ik7qGk7P97MtyROw2cc9jnoZMFE4ByMnjQ5HNA80SH2T5yyMFx1rc8DIqrjTrJSC10KR@vger.kernel.org, AJvYcCVfv2o7EstlY63i2CGRgjFgbI+rpp41zHqfGQIzLWTNzfEC9QuWcj4JSaq02uI8rEoboEl8Q6XifxJKXSAyD2o=@vger.kernel.org, AJvYcCWBzyvlIpcRMtZFHzxtOVJTycRObLlXdczX5gu+4JK/PVZU6xIJu3xxHFRvm24gOWCcQKnasfau/w2m@vger.kernel.org, AJvYcCWEfvigujY2BjvstQHVG3TSWMMHImg2N561fcQrgWoERv2p5qPCykzhUEsEJCjHF3VWCgDS6kerO3S6UQ==@vger.kernel.org, AJvYcCWdKvJYAAYK0tKjt1hhN9iutFK0++sImKW97WXK5PuL+Ck5M/bwUB/jWzzM9MJaBhX1/Fh81111kaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXxJZLuhl7ROSmR+Ib2NMnW86liczynwHyniyY2xcwfj9YWPvb
	h1lWBGCaUnp88anAEMVXDSQWrIw6iT6Ksbbs6c7S9XxcwMfx3/mA4RukFK50kA==
X-Gm-Gg: ASbGncs3b2c91KZc7vJKTbA4DCt6YRBsz+NwcOe5HaTpEigvJdQWe5gl9CC98G8k5tq
	2x8lk4ZdZu78aPUEsYF1/aZ/8C/b2wOKuEZMR791VH1EFLq5OIG2WZFu5XtPdsqYVJWxxii8Dqv
	AqqcQeWmCvhVeqEy0w2LG0xmFDt+fNIU08hyHgv5pYtmZURYmtU16UvPk8TnNY8+JICDpNKzKfq
	qeiDrnl37cyGLKB3meTBA9i1Jf+AUGRRsdRG2uJfn7yjxAfNT+1JRwPjM2NEiRT/eNIPz1SzEK6
	B+WHPhzV/mq+4diZGe0IfmC5KdVd0KkvEN2GuSbn5PsyiWY2El29vcBAv+QnDmkq/I0gF2Erx3B
	AOOlmAIBSSaf2Ow==
X-Google-Smtp-Source: AGHT+IGifg/pS/ZS1sqlaZZ8vkXGObbubcKsP52DwMiQOH5lHDepvI08orbmJwJuJ3JzlZPkQmzCPg==
X-Received: by 2002:a05:6a21:9208:b0:215:dc32:ffac with SMTP id adf61e73a8af0-21d22b41c1emr1747628637.26.1749010478053;
        Tue, 03 Jun 2025 21:14:38 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff755bsm10526057b3a.179.2025.06.03.21.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 21:14:37 -0700 (PDT)
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
Subject: [PATCH v12 0/7] Add Nuvoton NCT6694 MFD drivers
Date: Wed,  4 Jun 2025 12:14:11 +0800
Message-Id: <20250604041418.1188792-1-tmyu0@nuvoton.com>
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
 drivers/gpio/gpio-nct6694.c         | 479 ++++++++++++++
 drivers/hwmon/Kconfig               |  10 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/nct6694-hwmon.c       | 949 ++++++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig          |  10 +
 drivers/i2c/busses/Makefile         |   1 +
 drivers/i2c/busses/i2c-nct6694.c    | 174 +++++
 drivers/mfd/Kconfig                 |  15 +
 drivers/mfd/Makefile                |   2 +
 drivers/mfd/nct6694.c               | 386 +++++++++++
 drivers/net/can/usb/Kconfig         |  11 +
 drivers/net/can/usb/Makefile        |   1 +
 drivers/net/can/usb/nct6694_canfd.c | 820 ++++++++++++++++++++++++
 drivers/rtc/Kconfig                 |  10 +
 drivers/rtc/Makefile                |   1 +
 drivers/rtc/rtc-nct6694.c           | 297 +++++++++
 drivers/watchdog/Kconfig            |  11 +
 drivers/watchdog/Makefile           |   1 +
 drivers/watchdog/nct6694_wdt.c      | 291 +++++++++
 include/linux/mfd/nct6694.h         |  98 +++
 23 files changed, 3593 insertions(+)
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


