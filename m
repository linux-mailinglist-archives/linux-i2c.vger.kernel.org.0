Return-Path: <linux-i2c+bounces-8102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1519D47AF
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 07:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EDFB282500
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 06:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF70C1C4A24;
	Thu, 21 Nov 2024 06:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hB6Nkohm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1309E4207A;
	Thu, 21 Nov 2024 06:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732171264; cv=none; b=fHvW3oORcs3rCzLFH7DCUpTHnZu8l3gYZmDvRX3lJOdwZ6FBwbaNpn2GK6xhyJVilLA5SLXB/2E6Jx/2+guFgIUrUqFsb/NUYTNNyAoXtS1M6yFonotCvT/vRU8iBf6hety5OZ2FmO7eBqaFG1fk1DF0BnJmBeoDIDPeKtWlCrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732171264; c=relaxed/simple;
	bh=FINqjynRckCPdREA15LQd+d/wJ58MH+XzrwNRb4sGD0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oVEnNIBYf9DopeF5r++heH0A+5PgtMBFjcH6yQNY2Fi6qmD2Is379xuq1YFkR+tPdP/wnaWM3JuYLu94z2WXj+VYtJC/iDR11Sl4AoN5nLszcy36Uc4wyCcobG2YfW2OetzN6ayoVI4+7ZUN+ZawEo8f0rHMJJQEOuQOgSFZdu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hB6Nkohm; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7f46d5d1ad5so482264a12.3;
        Wed, 20 Nov 2024 22:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732171262; x=1732776062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VGWHthOdkm6Gt06IJVjO799GK6ZHCX/yfS2o21G73Jg=;
        b=hB6Nkohmkd8c9Ym/lYDp4ljAAy4GrYhRGj4/7F1HvCBYQV0Bpz6jNixqiUPkxoEqdX
         Bhnbu/7CrM/bmlSNauOmyefR1o+aXWJ3Kbcd+kegjQSka7ISTfWyp0CpNOFcQr2xQqBU
         zX12RK0fXWKZFbeZ7xYpfB6NZaESFn0N11CCoOa9h38WM9k+qRZgjNyHABjUVsGbgk4L
         7+ElDjAXoBFXWonpr6GRq/F9mqXRY1DmT/Vicxeq5HGgluat+EUS3YuGIjorL3ojHefT
         msyvs1ONBSomsZ0cC+LSESMuczV5b4rzftUl/dLcHSYjbSWB1tGJkYY/LOn1xg4VuUOO
         g7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732171262; x=1732776062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGWHthOdkm6Gt06IJVjO799GK6ZHCX/yfS2o21G73Jg=;
        b=shqyhC61a2e6DdnKmse/hpVdefC3e5RGWg/6bJ0xDUNTaah1vygFrh0EKXEigGA5eE
         zrnysRzAW3nTeIq7neoZ1CvS7Vj1D3sRfjmuTDahG5Vf/dt/OmwS09f+JPYD0MzCArGu
         9lmb7BnAcZpA+aUCcHdEKeP+pKjtptgO51AE31CnfLsNq123ilnHdA5VvPdTcY0WPiCI
         52jGYpnOR/aLwSkP0JOwi6+i+u354O3jlKlLtdLC22xLaonlKoOVTb5pQwKVuVbNQDHd
         E+3LBxXaNHXHWIB43kVo+9xJNIj7iqaeY/7furTcVXhopRAOHTdyBxe/u4W8lwyK/bcL
         sllg==
X-Forwarded-Encrypted: i=1; AJvYcCUA2RJLmFqv33S6EBA6ViLdBXcGpCxJMuE1+w2AXR15+/inxZ3NexWsHO1ag2Mqcgz33yhxlEVhSAwR@vger.kernel.org, AJvYcCUnAGXjPyW20LWWmuTdEK9xXQG8MrwmdjMsWfwiIVmEIdbuYPtg2VzPtzIEui0OpN+7Pj7MqCD2w/iV@vger.kernel.org, AJvYcCUwuMUUS5u4HshgbqZ3feX1h0orR5NNVIp6z7QKK1Ikaomcr1N6+eWgMheYR9M/t78yO5w+n6fHjD6OA7lRCCY=@vger.kernel.org, AJvYcCWLFFmgNje1S7unLKhaEzIldYLhmzeGCGa3YHnofYo8XB/PhP4bO3EayMfvpj8HzVPP+sMoDaSP@vger.kernel.org, AJvYcCWgGQR0XGaIHPgSOtwxDM7K9DpTbCKuJ90E9VllrFQimUbUNzfMWEkMMklvz5ruoSKd/cPdwrFTclI=@vger.kernel.org, AJvYcCWp1hktI2mzRcbwskIAshN35nUyCvncfdRq2QBWp8Df6wLUr2ZmUWaijmo/GGmGEcFzyePrKSVy45ibBA==@vger.kernel.org, AJvYcCXLaVG6qi7i2L96sokAMIWPMdyi6WPTpIns2a8L6Pd81QqaljxJeEu6Tw11AB5F7DtdhK4mAol5T83ajGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxHouaq78TKjK3ouNli1wXadKUO0Za0k4pMsbay4w8xDmiTnz6
	3Qvq/zzE4meb3YnKt2GdRALeeYQjbagqT9u7gd34H60Bal1XwLCh
X-Gm-Gg: ASbGnctFLZvWDvaPv31S46m14Lb0MetQz54+QiwzbEpUf68jYDc53IHOwI4rOMDI5gi
	Zr689dZzGZXEjol3Ysan0Ae6kZDDwro/gW6/3er7hgKYY4L1oavLHX/XohtEM7qj/AAhURWSj2C
	t6LMEaoGKCIAsDGdeh/2j1csDonwCEpX6fqm8rx2KProZRSSyL801qj8o4PYSifN7DzR1FNDLYI
	fwbsOUYk4yp7UPVB1H+Vio8LZ4jjI51ugY2cNYJhuGrkn9FzMOcdhl4xeTL1yj3L1ZIA5RlHyTA
	KFUZFfHQMoCG
X-Google-Smtp-Source: AGHT+IGpnymgSDU5esqrFpiME6WfRsGDqK+fak4YLAOVub093rVM6M8RmgJK2D1J5DliCzpHz7ksUQ==
X-Received: by 2002:a05:6a20:a110:b0:1db:f02d:dd49 with SMTP id adf61e73a8af0-1ddb10dfb56mr8061282637.40.1732171262113;
        Wed, 20 Nov 2024 22:41:02 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beeb83d4sm2812530b3a.40.2024.11.20.22.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 22:41:01 -0800 (PST)
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
Subject: [PATCH v2 0/7] Add Nuvoton NCT6694 MFD drivers
Date: Thu, 21 Nov 2024 14:40:39 +0800
Message-Id: <20241121064046.3724726-1-tmyu0@nuvoton.com>
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
 drivers/gpio/gpio-nct6694.c      | 441 +++++++++++++++
 drivers/hwmon/Kconfig            |  10 +
 drivers/hwmon/Makefile           |   1 +
 drivers/hwmon/nct6694-hwmon.c    | 771 +++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig       |  10 +
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-nct6694.c | 152 +++++
 drivers/mfd/Kconfig              |  10 +
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/nct6694.c            | 382 +++++++++++++
 drivers/net/can/Kconfig          |  10 +
 drivers/net/can/Makefile         |   1 +
 drivers/net/can/nct6694_canfd.c  | 926 +++++++++++++++++++++++++++++++
 drivers/rtc/Kconfig              |  10 +
 drivers/rtc/Makefile             |   1 +
 drivers/rtc/rtc-nct6694.c        | 263 +++++++++
 drivers/watchdog/Kconfig         |  11 +
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/nct6694_wdt.c   | 277 +++++++++
 include/linux/mfd/nct6694.h      | 139 +++++
 23 files changed, 3445 insertions(+)
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


