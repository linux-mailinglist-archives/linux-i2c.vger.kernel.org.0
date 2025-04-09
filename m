Return-Path: <linux-i2c+bounces-10230-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 452A6A81FC4
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 10:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B375D4C32DB
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 08:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00F125C6F0;
	Wed,  9 Apr 2025 08:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcSSTyH6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB651D7E5C;
	Wed,  9 Apr 2025 08:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187290; cv=none; b=dsfsJW1sJzg1TSp55n961cbTNBtoDk++mk7aiEacLAERGSjJrR5IlWD7Vp1VdDaOH+k2EF8xackmWtCaiRn3SC/Q7Qe7uU/4kEdAH72O+sYha7g5iGuSU4/1BJQLQEQZSoYVIWlQt3OUfEfGFsUTTTfVr2G9dq9Wm2sGy4q0ue8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187290; c=relaxed/simple;
	bh=XjZPuGkyzZ3ZsxR1CYydlgtWfyJMYdlW9PLID91sIjM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FHauHAHZXpDP4VGXUN0rV6prO/n47/NnPmtpqdl72xpQ4HxBMC+yTx+CgyX1BnxSjfutF8tw9QL7EIYOcZikEwqjuEbyygI3++OqCdromxaFHgqLfAIraT/jTfgNSdljhstJM1tcNh8JHdUYC5EKLd4vNSmiNcWmVn1VI5oHqvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcSSTyH6; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7394945d37eso5473647b3a.3;
        Wed, 09 Apr 2025 01:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744187288; x=1744792088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JtjDf2NQhGHHNRHvjCl7HSRvlpv2773loFx0UKVrEeE=;
        b=TcSSTyH61qO8wDrm9lQZ0O2IJN4sikaVa4Jy/2FjxyErnx6Pm5pZ6sn6Jdcosqon2e
         kCBRC/fzuINsQvaWFttpCDq+JYG5TSx7AKzPTtOckzCKdgrt0+6rCoUzuMZ9WXFp6KWT
         /rf09J4cKeBeijtz/zTlG2NM1ErOyPwxvC2P13i4t8fTLK8+cAVX60ipKUzuZKgapS3D
         A3io1DR7wPZa+920DqhcT2/zWqhIm1YMEsS8d6tJ1x3RnPYzlXOIIEwqkN43QRpfQPgS
         p9tnBW5vCytAmOdVieEdSZs8kl0M0dTcvKc+wgDJoABaIwzv6NDtQA/qLBsKRKfw4ycn
         XiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187288; x=1744792088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtjDf2NQhGHHNRHvjCl7HSRvlpv2773loFx0UKVrEeE=;
        b=loEPsH/+3ecniWKdgvQ+EWRG5Z8yMLlCQHxwQCngGxkYLAKTUt6NbsTKiVtaAWnmAA
         WrPS2GaOyb1U9poFAODyfzHmJTEBX97emoGufJbDbn6WxZHx6jng8xlGDTN+jHg3mbb1
         /PWbgRDXZkj+gvJALJAMGnahwFvNJXNvQ4iex5HpTnwbDt10QrIhXdBA0wm0WsSwupl7
         wIUE0vzdGABlNBd/eNT5azNgnCCWReo0g9QRAsjctT0U/GunCmSuoNybXTQPliSImpHp
         qUikc6VLmOHA7WYYnl8320tG2UsK1jtKA7Zzc8I9KnKfm9Z1eEyKzoar3QwYkjArlGja
         h34Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCpBoz8xaUU2D9QuB0r6QchbcKoKw1VwlUFIM4oFqFbVDUIvLMgXMZ7W1FN6JV7EmM3hOwkyQV@vger.kernel.org, AJvYcCUe+F4u5wrLVvyXNt91NFBAO1SF0/1vhGqlWWnjktKE4FbYgdrrl00EZ/IUferYdtqWK0a3ximqoHGCoA==@vger.kernel.org, AJvYcCUqX2CgEGO3JEtXsjMe8MU0Pu9AVHadnvIk67sZsOlB+299a1AZID9D3TpaSDmj4ZpCVZdR9YI4CLtE@vger.kernel.org, AJvYcCVKyuuUiPR1EeYQBPpgoGi083dcaP8+vZsxrCjDUjpwG8CKPGskDHNHc0fAHVkIeXj6vIHah/d8eWJzCDY=@vger.kernel.org, AJvYcCVwircLtZuDIkKnm3xdWpVqoyyQvQHYy+bNZN3NlbrycEMzlrXY1z9iT+7dzDfQKQNJm4jmDv1Y0diq@vger.kernel.org, AJvYcCX6K4l2K4ma/TcfqOKpH3LVqdaCYv4rcei7lWBgjF+bA1qABVKcbqVv3Wk5p+/9VenMmkbsmpo1wao=@vger.kernel.org, AJvYcCXosFLVMG2S3UB4oJR1rjrdRpiX2Nfwnpi7YufC6s8SJkcNr0AesYkJijVdPjZ9WpUnFJnqdxuM4WtCdtzQ6C0=@vger.kernel.org, AJvYcCXpo1IjM8piF/Frik79qcDez5qtW5u+Y0gsGU4J6X3CSrlo+yqtdCGUDMkCLsXMNsddRTBUgUk7LA9E@vger.kernel.org
X-Gm-Message-State: AOJu0YzxNWx+vIS5eFL38o8LAErapzr2g4oaw4grOVBJmK2rBlNSRk8l
	xAnxuzvBEWxYSuy2vuTnN23nx+bj3IddshflZJwPRfeC9iEUJuY/
X-Gm-Gg: ASbGncuQQ0M1XOVOBwJaRrBs8qMjnfTXGsHw2R7VzadLzBnWLwgvKkNLNngd65aAlB8
	okiPxai3F62SQt0iWD31FEMXdgGLmQMnWDHzBpLMDNMxuxUPYayY+c0yTxf5iZDacdsp1yYPp3/
	sodMnfhTYKzMj5wIUzN5bLUSIueeo+5yIdMTPSJUQsM3t+EKE1T5nfASu6GHDj+Vi0L147GlHhf
	/LntOyJ6usL5iw6rlpeGyxhlyniEw4Eu82YyyhXKcAKTTl7bA4SZkdMaG0ZO3HWUyL5ZSWo2E8g
	N0D6kontKm6OxW8AHFR+ByCePJoLPQxLQ3oW8okjo8UdJx0Tm28zvpYO5a7aDruPUJU/B19E5vv
	5B0w=
X-Google-Smtp-Source: AGHT+IFBx2B28vRPeJOkne+pOpjHCYBblDOl2gEMtjI5RfQ0Ye7G2dbVhSljEOlQ3pkopR1vuShfTw==
X-Received: by 2002:a05:6a00:1144:b0:734:b136:9c39 with SMTP id d2e1a72fcca58-73bafd31777mr1855221b3a.19.1744187287900;
        Wed, 09 Apr 2025 01:28:07 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d46509sm740772b3a.57.2025.04.09.01.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:28:07 -0700 (PDT)
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
Subject: [PATCH v9 0/7] Add Nuvoton NCT6694 MFD drivers
Date: Wed,  9 Apr 2025 16:27:45 +0800
Message-Id: <20250409082752.3697532-1-tmyu0@nuvoton.com>
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
 drivers/gpio/gpio-nct6694.c         | 494 +++++++++++++++
 drivers/hwmon/Kconfig               |  10 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/nct6694-hwmon.c       | 949 ++++++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig          |  10 +
 drivers/i2c/busses/Makefile         |   1 +
 drivers/i2c/busses/i2c-nct6694.c    | 184 ++++++
 drivers/mfd/Kconfig                 |  15 +
 drivers/mfd/Makefile                |   2 +
 drivers/mfd/nct6694.c               | 367 +++++++++++
 drivers/net/can/usb/Kconfig         |  11 +
 drivers/net/can/usb/Makefile        |   1 +
 drivers/net/can/usb/nct6694_canfd.c | 815 ++++++++++++++++++++++++
 drivers/rtc/Kconfig                 |  10 +
 drivers/rtc/Makefile                |   1 +
 drivers/rtc/rtc-nct6694.c           | 309 +++++++++
 drivers/watchdog/Kconfig            |  11 +
 drivers/watchdog/Makefile           |   1 +
 drivers/watchdog/nct6694_wdt.c      | 298 +++++++++
 include/linux/mfd/nct6694.h         | 101 +++
 23 files changed, 3616 insertions(+)
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


