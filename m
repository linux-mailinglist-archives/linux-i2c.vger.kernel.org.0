Return-Path: <linux-i2c+bounces-8402-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0069EAE39
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 11:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C6A71888DB4
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 10:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82192080F3;
	Tue, 10 Dec 2024 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVzPp19d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A1D2080C6;
	Tue, 10 Dec 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827557; cv=none; b=rf7jcc+rnoE6cUSDb78SQ8aPyOkw/Bpl3x02aq6mlgjdyWb4ZHj7lNNsfKmYJFbNCOvjFE6QVgmTN/gQwKd3mo3prTbA+mwAz5VXWvU/6RzfJ5uFkT1EqcqOWUeeadMO1SFkNAS6m1eoyGxobGS96gWVfbbtsqitZSG2Xdb3sWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827557; c=relaxed/simple;
	bh=6rrJ22IPsBICHtUGS2ghlceztCQZhhj102JscVE5gFk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kz+VEykJGVjljSxxwIW3Rmoz1lSXDrZv9hDuBoYLVc+IcCuP447cGdvInI0t0gxs6ywvnFm8H81vnEpzce4xn2yiJzVbJy55dyN9t64hUhkCsiXwTrj/+3ML0CJBqAPQ7ODL71PjLBAVWYvdw5KGwOWegGbohyCrZJxd4JazbCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVzPp19d; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-725ea1e19f0so1756964b3a.3;
        Tue, 10 Dec 2024 02:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733827555; x=1734432355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MZPS3sz1h1NY7x+ZuPcomD1toVgLpMB0EgOOSwsSOTQ=;
        b=GVzPp19dE+6S1IKLBAJ/dIoDdILVyrXNhDZtaUpw2JKfCHy3YoE/0pBr5b+INWJYQn
         seorZ7tMTV/c9/Vf2B3kXtokPGcQhTJnozewkBXsxb91mZYJJp44mDXint4vl73VMv9Z
         c9Gj44TPywu3oH5QTq5/45b/R9orruT+ZLWjUD+gRTMHeDbCJlztnB5mkeiLbTJxPCbr
         9VG6JDHLVNDULDCEImNhinjTxJ9Aok3cW2cD/ptpg4DJIO7dB7FxfAu5CiOFG2eyCBwI
         1JHs+nUTbTmy0vDQoNErHWEEzLvS52bEDb10iFDTSJa9Ss4yoEIteh5W38iC8D1S3wFp
         tmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827555; x=1734432355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZPS3sz1h1NY7x+ZuPcomD1toVgLpMB0EgOOSwsSOTQ=;
        b=p+VNCBXxmcT5qsITdif9kEfsxHerUO7BeFUKqStytrwDLpTfzWJRGn1xczq89jqERS
         QHTbcfaA3r+F5bPyGPSDNpFcFpb7nRWX2XvwsQQIuy8fJLAMakAcOmusR68Eu5Ua10PR
         sPLDD8XmckP0swxUOmS7iGRQqWJVLwhs4uH3pN461XbWHYO7jS8e+EH7ZceryMVYV2Mq
         dPzpwzvhe5LN64TnZukIeTfNnQFF0NKLxO2b9h4dfP3ile0KCGiMxNcA2OFg6vxECA1/
         7xxajE7R0STlL07SYEgou+gmCNUCcey2HZ+2NiSOE4X2XB13tc4D/9twmeWeDNwtp/k+
         HTzw==
X-Forwarded-Encrypted: i=1; AJvYcCUvw5HjOiKHNAbJXwxijxr2bEFW/fJr8ewiNAUZ50qBGZpS61nLuZwI1JdUw4FiOqoynfvOZqeI/qeK@vger.kernel.org, AJvYcCVF1k6cEgVpnKacMluPHdW2pqE3S0Jgaw3r95aD2Nh6cKVWuQ5Fx5XW5q1g/Axh4QGCnWP9uJcR/lF2Qg==@vger.kernel.org, AJvYcCVoe2fPSAhOQWhjR6cXI6qkEvM6ldSa7FStaY3k2ac8RH1WVRRkClyQ9dJzgqz4+O+EXRT5NhqdOl4=@vger.kernel.org, AJvYcCWX8aRIGkTrWCec4gAHDTihEG6uasGk7nC1ep+PYya7kIURdEHLzHxdafKcigUgWyhPXzRrRnMxsFzgvbO6/jQ=@vger.kernel.org, AJvYcCWvEAPyxzYILcfMSvB1a66ti8uzpmEBY4iIg0n4Di3fZq3faIuF4RX2qIBzCH5dZ6cZLJjnD2F6pw9b@vger.kernel.org, AJvYcCX71I2SFDetsBKGFZAcFPezVI+HVj4QrqSUugl5eo10WkRL+ppqX8Qygxb1fS+WpsarACw2yQ6/odwKdBI=@vger.kernel.org, AJvYcCXQPujlAlIIhKDuLCnpPGv1YfxtElCvsSw58gOy3RNxBKDMiDa9HfSqCkCpy2GrD3eFlh0k1p7e@vger.kernel.org
X-Gm-Message-State: AOJu0YyRkgKANIwv7Zeg+vdnzE5KPc88v1K/fY49zbw6maJRprz+eIfI
	ncC6ikfkFpWnaquitz/cdy62egCjEbItuxdfO/7+hm12lepe9/Uf
X-Gm-Gg: ASbGnctjYWewVhbGJUrICgkkH031bOhBobcqBgvnjfvWBQVWRSIMQTceSKWECageZo5
	Xsxf4bNLZu7ytmpxE015Fwn8K3pynjjBAZwA9bxnsi6pkwo+45JV+2299ftfkHoW+MaP6ByF9ep
	SrZLscgJYUqdb40LOViVGofj7hp0EzkJxujqmNMo8jvZK2UVDYz2eVHlaGiSDLupy1VFtBUJgYe
	l2/JqWpP/5lUXzjkePaVD4gdONFFyaOHW1UhoYynB0YseuoCjCIaTpQPkkLMUS3XEw4WrmVXSUX
	8ZMTiVxY5d9rKaeq
X-Google-Smtp-Source: AGHT+IHBjakPH5nY4nu4PJi5Mq84VbF929JSamOKTnym1FcM/qfrJduP9rx85cWfqN1Zvac92DnI/A==
X-Received: by 2002:a05:6a21:7897:b0:1e0:d5f3:f3ed with SMTP id adf61e73a8af0-1e1b1ac3738mr6375975637.19.1733827555181;
        Tue, 10 Dec 2024 02:45:55 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156dfe2fsm8905748a12.31.2024.12.10.02.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:45:54 -0800 (PST)
From: Ming Yu <a0282524688@gmail.com>
X-Google-Original-From: Ming Yu <tmyu0@nuvoton.com>
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
	linux-rtc@vger.kernel.org
Subject: [PATCH v3 0/7] Add Nuvoton NCT6694 MFD drivers
Date: Tue, 10 Dec 2024 18:45:17 +0800
Message-Id: <20241210104524.2466586-1-tmyu0@nuvoton.com>
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
  can: Add Nuvoton NCT6694 CAN support
  watchdog: Add Nuvoton NCT6694 WDT support
  hwmon: Add Nuvoton NCT6694 HWMON support
  rtc: Add Nuvoton NCT6694 RTC support

 MAINTAINERS                      |  13 +
 drivers/gpio/Kconfig             |  12 +
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-nct6694.c      | 438 +++++++++++++++
 drivers/hwmon/Kconfig            |  10 +
 drivers/hwmon/Makefile           |   1 +
 drivers/hwmon/nct6694-hwmon.c    | 768 ++++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig       |  10 +
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-nct6694.c | 153 +++++
 drivers/mfd/Kconfig              |  10 +
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/nct6694.c            | 382 +++++++++++++
 drivers/net/can/Kconfig          |  10 +
 drivers/net/can/Makefile         |   1 +
 drivers/net/can/nct6694_canfd.c  | 920 +++++++++++++++++++++++++++++++
 drivers/rtc/Kconfig              |  10 +
 drivers/rtc/Makefile             |   1 +
 drivers/rtc/rtc-nct6694.c        | 264 +++++++++
 drivers/watchdog/Kconfig         |  11 +
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/nct6694_wdt.c   | 277 ++++++++++
 include/linux/mfd/nct6694.h      | 139 +++++
 23 files changed, 3435 insertions(+)
 create mode 100644 drivers/gpio/gpio-nct6694.c
 create mode 100644 drivers/hwmon/nct6694-hwmon.c
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 drivers/net/can/nct6694_canfd.c
 create mode 100644 drivers/rtc/rtc-nct6694.c
 create mode 100644 drivers/watchdog/nct6694_wdt.c
 create mode 100644 include/linux/mfd/nct6694.h

-- 
2.34.1


