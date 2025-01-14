Return-Path: <linux-i2c+bounces-9065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8FBA0FF3D
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 04:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF4D5188808A
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 03:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7015E233552;
	Tue, 14 Jan 2025 03:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3bJwUrK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC87233537;
	Tue, 14 Jan 2025 03:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736825427; cv=none; b=TFm1E0bdttFYdXkjyG4SZrjI1CP55lPGGWseY1Xa5hKZ/k16orrrtLwgiVeD5gjdvpepT3rxgdHRw58eBK8/HRXzYLD2ZSTIwGm4sNjBGgIgpXal6zeretQ++8uSJ3NZLcrqrPk1OmNppe9SE4UrwUBTT1hFUCQBwkTDQXi5sv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736825427; c=relaxed/simple;
	bh=Ef35RqrMk4muXxQ5u0byNehgJOEAcpGRQhaYOwCGwfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Oq/GtlUUVvyssSxEZjtm0XQRHs2iGPNg2sHsm/pgwZkfW7vbjsIn8ogsFLhHZALQoNDCbNr78gTBVzVaYbEQCh8Nob5HENFtfnSywymoFiGUxvkfjzldfwe47XLfai94WqhRo2qYIOQKD2LIIQDMSS+etwEEs195y+V3GYwNniA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3bJwUrK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-215770613dbso60256235ad.2;
        Mon, 13 Jan 2025 19:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736825425; x=1737430225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMpGT/l+/EFBoJd+JG0JgyTN5GRFrvAL5apyVj++7q4=;
        b=Q3bJwUrKR8UsF2oHozfrl+haE3y+EADAC7DH+4FcErEnd1O+x4hpnBYzO3y/OEQiq1
         WD4LUg6TK0Cj03S1oYgigInLFtQVjn6zJ/qlF7GVKhKVUd0FPm/aj1uVAKKU8uYQVhrH
         URCgVKf7khrNpSKs000cNBMRrYC50krlUSK5a5gnp9UlST6YBtfHERDA5YC1kU4cOOAy
         CX41yjl7Qw9npqaiK7oHT4XJtcsulYlwLaUr4Tdec9vt2AUdH2VIxs58zCz2glNZktTY
         2PwI9RwIjRR5RCECk5fMH4XuusfVQyVex/W9H4nJXuzV0m4mKMIw5IOl2DXJ3k0QgD9Q
         QQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736825425; x=1737430225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMpGT/l+/EFBoJd+JG0JgyTN5GRFrvAL5apyVj++7q4=;
        b=HGRGehcUbkMcHByz/jCBCwMnGVU9QBJwjv2tKol8RsGKMy5yNNfBpMSYyE7dsfiIEC
         HVb5MRZ6W3i19DiECLM8g7p5564FntEnR43tubX1Z0Q1DUo/wul6sqOD1zaFjNElFi7K
         LaA640iu64SX0yCW4iH5KTgxSXCp3dH18Sjheemc2SetYZWGyLEsmEe06RC5r8UULF2y
         QkBRTjEjI/3y4iHyiVGxpWhpsDwtu89/g13FtP5yI983RMq0Acmrklzxm8hboxzg9Imh
         eh0dHF9DEbEAcdJvZeH09svGnnSasDXAgb6qlnqiwmIyoAh5xNmvSWNBt6TBdrA3qxpQ
         ChOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8GkVRArHBJNj/jchVtnf8Z4jHW0fra7dfmz6chr/V0rEyO5aAJUQFhoCr7zY8IubFN64XdD957kj58Q==@vger.kernel.org, AJvYcCUF+WyxmCkdQjFjdbAOuOPqn92dZM1PGIEG8suVUBbeyPQtEmsb5k1w9pnG5vr2K7Da44X8CnMgeoDr@vger.kernel.org, AJvYcCUV56IAEncjbthCaaYD9QTpNCY2GUUJuizdWGywwKlOVPVawdqwPdzSt1kFvElhmEHBbjFua2o1S2uk@vger.kernel.org, AJvYcCWEVYtelgYyd4K0sFRq1Gs/UTBbfG0V24msWATD1kkTjeg0IhYjjVIls7klj9TuNdrrIjo4O7E2@vger.kernel.org, AJvYcCXOq/SJHtJlPXc9vf9qQxAybUmROOKoG9HgLrAmWNeYVaP6d2Q6v3Aq/m1njzwGe8f9Wjvb49E9lYA=@vger.kernel.org, AJvYcCXnnM6IF6wDWrHwn9crLvVOwDijkqY8aNCXUO4nZiMC5JKXbz5AW/ikt0sYBbPU6gUc+Z7frIAnW7Pc/wX3V6A=@vger.kernel.org, AJvYcCXxeFVBCkGV4BpPF6SiqhDGDx7Bx8EfzxiZkYiwfGP/Ae9b7/r9UTDUyDuvSj2tbpIMgxphhL72kl09@vger.kernel.org, AJvYcCXyQhn7ZsisZJyh+Rn1kRUKAdTP2inWNWLtQa5tWB3uWANLnDTKnXnJ5wBFU5DUbRqZyf/bn6JDKVXRwu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3KAIIJ00NF+Yu8YTDMkrcYO/5LOCuPVustGboyhfewODBhVe
	L5XLfhDvApZ6T4fmaQnrhOA7fMQmAUB1vclGeNP24ZsXuE2Tj40W
X-Gm-Gg: ASbGncurxKjOo20df72PC9EWcowY7jJHnQmE5uMls1tSgaZgHfUdjTfN2jWeydpJQKs
	UCE3wKRFA7zEYBAW+4E3mCFIqJY2nodP1ThigAefnHqh3k3xhoOnsCIzkig1smlI9TDGrRuPnyq
	jvQBQeVcOflpX6hSSkL5a2AJ9WOYXSUkLMbOWQtfF5E30ld4lRQm/pK8OeAZEm7ZnsZ0mWwd+oD
	c0+dK4sfDhSbADflkrMVKWlntuLvS0GlwjW81g9RwLkF00jrJm5ENSsWzKaEpmqOt2WkywST8Lb
	6SrdIqV7rcLmvwG0r4k9h2+x
X-Google-Smtp-Source: AGHT+IHymbK8ftuug40W3gDlkalOaJKWqQ0iYlh9ybRQrL1/7XhIH4sUclKPww3UNhiL0Qjcyy0V3Q==
X-Received: by 2002:aa7:9a87:0:b0:725:ead7:fcae with SMTP id d2e1a72fcca58-72d21fb1d57mr33227559b3a.18.1736825424531;
        Mon, 13 Jan 2025 19:30:24 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658b71sm6595400b3a.85.2025.01.13.19.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 19:30:24 -0800 (PST)
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
Subject: [PATCH v5 0/7] Add Nuvoton NCT6694 MFD drivers
Date: Tue, 14 Jan 2025 11:30:03 +0800
Message-Id: <20250114033010.2445925-1-a0282524688@gmail.com>
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
  can: Add Nuvoton NCT6694 CAN support
  watchdog: Add Nuvoton NCT6694 WDT support
  hwmon: Add Nuvoton NCT6694 HWMON support
  rtc: Add Nuvoton NCT6694 RTC support

 MAINTAINERS                         |  13 +
 drivers/gpio/Kconfig                |  12 +
 drivers/gpio/Makefile               |   1 +
 drivers/gpio/gpio-nct6694.c         | 458 ++++++++++++++
 drivers/hwmon/Kconfig               |  10 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/nct6694-hwmon.c       | 947 ++++++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig          |  10 +
 drivers/i2c/busses/Makefile         |   1 +
 drivers/i2c/busses/i2c-nct6694.c    | 157 +++++
 drivers/mfd/Kconfig                 |  10 +
 drivers/mfd/Makefile                |   2 +
 drivers/mfd/nct6694.c               | 388 ++++++++++++
 drivers/net/can/usb/Kconfig         |  10 +
 drivers/net/can/usb/Makefile        |   1 +
 drivers/net/can/usb/nct6694_canfd.c | 856 +++++++++++++++++++++++++
 drivers/rtc/Kconfig                 |  10 +
 drivers/rtc/Makefile                |   1 +
 drivers/rtc/rtc-nct6694.c           | 286 +++++++++
 drivers/watchdog/Kconfig            |  11 +
 drivers/watchdog/Makefile           |   1 +
 drivers/watchdog/nct6694_wdt.c      | 295 +++++++++
 include/linux/mfd/nct6694.h         | 109 ++++
 23 files changed, 3590 insertions(+)
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


