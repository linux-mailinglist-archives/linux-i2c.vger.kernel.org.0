Return-Path: <linux-i2c+bounces-9334-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B602FA2BC9D
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 08:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0787C188AF60
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 07:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAA31DE2AE;
	Fri,  7 Feb 2025 07:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aArF3xsj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F82A187325;
	Fri,  7 Feb 2025 07:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914319; cv=none; b=icy95fscP+oJrBCrv/oBuJNajiRgUzh0Gy2PT0CrEgBRXYP8SOHjeg8PFwGrswtxZvbv9jDYpxrYbYfYwy3Yz0KBblxCOOISkt/Qynx+VQ95LUmE7cSS7pnxikw7uQnIlji2J3GKOz9aiZDUguEIRTWaUD5bs88FF3roCQdi2ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914319; c=relaxed/simple;
	bh=7yewH+Ph/fKik20DIhNiMQildp/ywL3DXzfmCb0HCh8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AQTLvIxo43T1/LZLsK6nATSVbTQQB39tClAJwzzg/hGthZRYfG+p2UImNltC+hOAVl9CYe2EWrQoMHyr3EUhk1of7bgpk3toTzLg1EKalBAAoBjw1zRHaJm3g3PHAuVE4Xak25dLafUJVNkOP0sG9qAgfy1r3eHOx/d2nunZubU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aArF3xsj; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f42992f608so2727660a91.0;
        Thu, 06 Feb 2025 23:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738914317; x=1739519117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IXq7bA9nrEM8sFBBA4j2i1q1vyFikCSKnfdeGxzVAnQ=;
        b=aArF3xsjtfEJBXPcfmgW7AVJIwdnpHYJh76am0+Y3NY7XHUBcHSJbqxT6FjncCNmLG
         FMYOU0bKFkSueFtpLdIxSHlfC3LRm5iottD4QwM7nlHLfX69UpQb7To2H8DfowW7h7Y1
         IL87eAyXQmkXkxGmCzdpnsAHDMgkERKuNYN3ZQpAS88VbV6ZDyAqMlOqRJmnqlosNttD
         vQjG5q3g8R4rMZ18nL5NJFndN/Sc7p1lIbPTZzDfERjkEViUqe7sFXUQCoqq2sxFIlVI
         MIcABjtRdzsZ4DczpHPx9Y8NZ63grhBm5ZXmQlpNEh+/4F6rEgBLnmiJVfZuqinvqERg
         11Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738914317; x=1739519117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXq7bA9nrEM8sFBBA4j2i1q1vyFikCSKnfdeGxzVAnQ=;
        b=r5xbIdc33y0dqvW9eErDAQ8kddrIlZwZ7lWX2rtvdv/FgwvmCXLUO2EHKH2/G3N/n1
         1MPBkxhe15C2uUw2Wdlwedz8kMKiLescwYgRl4ODkIit6GnqsrlVJzlfLu22sr4Nw3vq
         ssZU6hZ59Jgf0QjDMv57acg0tThp7Awq7l7REOFb+qyHuy4TUUm2MmioMnjWewzSjcZP
         uoudQWhMQElgTYOhauQV9vagL+z6OI6xYZmtNujKsrBLU4uRyODQHfDbh0KzdeZV1dRB
         GMK4SEDtpyjLR0/D7NnInilujtIVqZMESefXj+bFt5V6aRkKJxRvb3IFedFM5HJOot07
         6k5A==
X-Forwarded-Encrypted: i=1; AJvYcCUHdQ25BYo6hMIOAEyLmRqNaxZheHMOo991GeuxEoJfnAEwDD1W41E3MMDLJTZGbqaI1HqKUuuxgYglzw==@vger.kernel.org, AJvYcCUQF6RBJZJOIVbr0ezPBPtxZcWEsBybkr8Y/4528BmDlLJI0n3q5LubLozPXiPIwSq/eUdu23UqYbmN@vger.kernel.org, AJvYcCWD6Bgh6xCCZ1reoJjW87GqLfZ90c8lapE/mm2zvnjjCqADfFTvScbGI43PMTd8pmeBHUYhTXi9l0j3KiJOzXo=@vger.kernel.org, AJvYcCWe/q7Y8sQsM4tqT6XnCu8mLXRqYfW471Uv9xzFEHI6UthOs70nv2TplD7OLMntutUoe+2hJutQTj7+@vger.kernel.org, AJvYcCWfQSwYdyaL3E/j9K7lEdTVBwtbDQhSdvbqHzPhbaMs+iD/5uomUh61CS5ZHq+sbM7oc2j4v1jV@vger.kernel.org, AJvYcCX5sByiPD0pcmDF2rT8Tiv2ijcwhveBMpQDaD9DjjwwzjkbKoxzZEJclfgES0ibYPFl/1rlFUyu83w=@vger.kernel.org, AJvYcCXb+38whYyy8i0RiRDwGNMpidWszM+8gwAIWOxdpqueVQ4gX0xCm1q7JODvCO/w7g+O+Utl02w4pA+7@vger.kernel.org, AJvYcCXbJejI83axt7Pp/SNUqA8tHXkFYbOahGzWoKpci5MMSqMJZFWAXUMPEXXYizOit5RO+w2CwlNPx9/UHWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOqrXbCw6ByJcKE+ctRjbxbtFxFgRMfCdBxpSmWO5HO/DJxWUY
	99qCiPwhQLJ72NAdad2Focxuuhc5N/V89zm3hCAfq71lo/P8gg2/
X-Gm-Gg: ASbGncsKSWJn06cnDHHApgNe+yfrHVjL91lRW/VwP01w+moW7c4aQcEHU7UYF6J3UKT
	8Epn+A7hinwKUTADCI/poJAKK3uv3nHd6ay96lJTVStSX2fJY8z53WZt+bZgpFXKGImR+nphMkX
	W3EHynLOFzej8gsxx4h8rqnLR7bs4DQW4GOQHu3GT5YWO7NiBVdBDlclqznHjv2mZ6xBqtLqw/X
	nkpkzObrFqRI2QXsCwjudKnUKbQRcyePlTDuun4nq0whcnDq5f9kqCuoEAXBA72ftwmeicVePqF
	038RgNpTP+CZxgNcmHILpLll7dFG8FQICSjJjnj3brU3bGiWMIKiYjx/0LI=
X-Google-Smtp-Source: AGHT+IFK0+kXoUFknP6ajJTI4xAI0At7EZc7EQLGoWqqZdyS9jCQs1X2/UIvyGGwu8rSGyAdsci4GA==
X-Received: by 2002:a17:90b:4cd1:b0:2f9:d9fe:e72e with SMTP id 98e67ed59e1d1-2fa24166e90mr3900570a91.16.1738914316585;
        Thu, 06 Feb 2025 23:45:16 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1d5f8d6sm4967367a91.7.2025.02.06.23.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:45:16 -0800 (PST)
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
Subject: [PATCH v7 0/7] Add Nuvoton NCT6694 MFD drivers
Date: Fri,  7 Feb 2025 15:44:55 +0800
Message-Id: <20250207074502.1055111-1-a0282524688@gmail.com>
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

 MAINTAINERS                         |  13 +
 drivers/gpio/Kconfig                |  12 +
 drivers/gpio/Makefile               |   1 +
 drivers/gpio/gpio-nct6694.c         | 458 ++++++++++++++
 drivers/hwmon/Kconfig               |  10 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/nct6694-hwmon.c       | 947 ++++++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig          |  10 +
 drivers/i2c/busses/Makefile         |   1 +
 drivers/i2c/busses/i2c-nct6694.c    | 152 +++++
 drivers/mfd/Kconfig                 |  18 +
 drivers/mfd/Makefile                |   2 +
 drivers/mfd/nct6694.c               | 373 +++++++++++
 drivers/net/can/usb/Kconfig         |  11 +
 drivers/net/can/usb/Makefile        |   1 +
 drivers/net/can/usb/nct6694_canfd.c | 809 ++++++++++++++++++++++++
 drivers/rtc/Kconfig                 |  10 +
 drivers/rtc/Makefile                |   1 +
 drivers/rtc/rtc-nct6694.c           | 286 +++++++++
 drivers/watchdog/Kconfig            |  11 +
 drivers/watchdog/Makefile           |   1 +
 drivers/watchdog/nct6694_wdt.c      | 295 +++++++++
 include/linux/mfd/nct6694.h         | 102 +++
 23 files changed, 3525 insertions(+)
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


