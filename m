Return-Path: <linux-i2c+bounces-8742-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0029FD2AC
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 10:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DB053A06F4
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 09:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B37156C70;
	Fri, 27 Dec 2024 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQclhQ7i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914A3482EF;
	Fri, 27 Dec 2024 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735293468; cv=none; b=J29ghebFFRQrSyHWHOo1nwA8UTowx/uv+sEznSjHXJ2iRMgpclh0p5X1Z0utKb+Ruk/wCwR3VczZEdZIP0e1oEguZ4aVD5H6ps32oRMhVW5WkfeOzXNp6aPWhcxcpUg8DxNlbkxPsZbDOXW1Be6HZDRYnlb4gSztWLh7EiZk7Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735293468; c=relaxed/simple;
	bh=oQ8zPcgjAYCtu8aCCr473SaZxWRFCenBaHw8L4UCImA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rv1uwkaHNgzhObu9XKPXCKemrsTUvD6FZ0KVMsmhTj9AYGTFQG9HOmSe3463qRJAVqZZiSLQy2Mi1MQAHAYgytnPsQO4uJ1dARPnL+q5bZGc6mOIK0TNVgH8TVM2XoqqxopPipwAncdGv2LDGS3dhS1TuDIyXC9nINs+wyWqKAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQclhQ7i; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so7314436a91.0;
        Fri, 27 Dec 2024 01:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735293466; x=1735898266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E61b0CQfQJpOWoe/QUwMSbRUTPIEuAgZxxE/14WHMCY=;
        b=kQclhQ7i+SjF7pYEqzov6mJNk9xYabuWsk06lW/p95Hu1rGAFeuRwHZZSP6a5vL4pr
         l0DPo/tCG9SxdXEleX43sVrNMUr8A6K6AuLBzozkoEj0fkcbsu0osDQzeKDqA8qXUHk+
         02CC8PF5GvdrGpCnrRlR5k737CufqqjOhqqjGs3ym20SU6LjFWTVuV/Nqp2k6+rGXM/s
         NtFCltd9hg1Gqzu5wFA5nVkq2uA2MbGpssF29DDxuLcHxnBT4n2vIpRHPkKr8jFiBuDz
         MLoQmuSPmu7C4Gs7m9wPCj1LqjAmV/L61ZkOQT2hB9D7ME+st4Z+iav5UBSBZtZugODE
         eqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735293466; x=1735898266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E61b0CQfQJpOWoe/QUwMSbRUTPIEuAgZxxE/14WHMCY=;
        b=UznF1Ta32qDRXjyR/z6oehCAV1ztqX/tDOwzSJVCBkNziNFIlPw8vay6ekYRkiDtiy
         INTSsflBuzKgzi2CW5DcDQj69JduqFphFDMq0Q8WLatuUdMGfCRmJdrxV3/L9FCxWn/N
         fweAWq/ev75U/TVDQjBB1SrcgqbC9yAt3Yy3h+4kQ5oqqADmwsYUmCtjepKSDQaolCF/
         S3bJ6ow9+EHodEkWSVuZP7o+gzo56+W7zdl7hlqFyfnUsG1giFlfe7iWvh9d244XrJT+
         vi5xeuhDqi5aPQ626m3PFcS9P5obv9Xm1SlnMRAvoqv6Cny1TjZlY8Vegf5e25rr44Ds
         HhPg==
X-Forwarded-Encrypted: i=1; AJvYcCVrYKgpBGOJdHxBP3EOmC7a3O3E19B2nef8Ias1mkgA94fYvuwSVW4RExbtoGXA9dO0pyPJsFnkr9TsFUE=@vger.kernel.org, AJvYcCW5b7ZZramQ5JM1qqZjmcgpVaAv9gjmlTQDP2HgH/SVQjkuQXWf1qv3hBsAiRKQ2ByWfLz15DCLNgc=@vger.kernel.org, AJvYcCW8qxS7IQz8j4hCF7/1Pwq8V3brqFEp9a+664Ukur9Z87Ph8xTdM0EdhSMbhsQTqD/ItszQM+kY@vger.kernel.org, AJvYcCWPwJZS26Qvl+Xspgb3scF1AK6LtM/Zmy7IsErS8EnGlH/ZyguanbpUL9LK8W71VL2Jgl+UTRgpICym@vger.kernel.org, AJvYcCXKw6h6RmZUPxgux0ZohjmbvL4fbfCvX3C261nGUfAnbCOZIRXJkfA46PJz3WMASFJ2OZ3pF7eJ70qnbf05zCI=@vger.kernel.org, AJvYcCXSZiqAk89mS2Nl4egayfkPvZkMgAtCux+De3esouC8RoAQthWedR8yvTj0JtYCkBVKrGSRc6e6MLKy@vger.kernel.org, AJvYcCXUmh/WZmjYPzsYy+CDPy+tMH6ec0lUdJxfnCpmQnLRteXoHmiuDdcvt/cwgivd1t/EqCA1pbFL3ArsDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysZBap6HAuFXuITEvJI8/T/2gMtMVTsefjiHxvPskac2L4fsKh
	hYym7zyyyeNh40BxgqYY4XqwNZy4naVkgPg1makeZpz3I0nUR5yn
X-Gm-Gg: ASbGnctCmoorbTe0ovhLALPB4M02wyLBj38t/M2rKczGXPCEeYSfSsvOhx9SV/pkzEw
	1m8N5c8iEHt62Jm9jXbh+pM1ORo14AziXSRBokSYd2LqOeIww2Lhh+EpA/0Wjps4/7T9+q74Mhw
	jcnZAd3sgtseNWX2WPpvEg0clOTappttAldfescpQxleH7TuP6dFcPw9117M+QtteW06yCJodml
	p6Og+ftiwG54LoE67DpIOXIpfWJnxs4BRVEfPb4FKcVyOL471h36AHWOZkIfx2MpsFMhrGoNhh7
	Mli9AVJWUZPErX4i9TON9pLO
X-Google-Smtp-Source: AGHT+IG25VBuVyNEsjj0ruD0xAOoFQVrnR9gRNTql3ILiys1KjxdfmFcTBW3jd60qhrZpc7MLTd+5Q==
X-Received: by 2002:a17:90b:5251:b0:2f2:a90e:74ef with SMTP id 98e67ed59e1d1-2f44353f0b2mr45145356a91.1.1735293465820;
        Fri, 27 Dec 2024 01:57:45 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51a0sm131581135ad.187.2024.12.27.01.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 01:57:45 -0800 (PST)
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
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v4 0/7] Add Nuvoton NCT6694 MFD drivers
Date: Fri, 27 Dec 2024 17:57:20 +0800
Message-Id: <20241227095727.2401257-1-a0282524688@gmail.com>
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

 MAINTAINERS                      |  13 +
 drivers/gpio/Kconfig             |  12 +
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-nct6694.c      | 462 +++++++++++++++++
 drivers/hwmon/Kconfig            |  10 +
 drivers/hwmon/Makefile           |   1 +
 drivers/hwmon/nct6694-hwmon.c    | 851 +++++++++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig       |  10 +
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-nct6694.c | 156 ++++++
 drivers/mfd/Kconfig              |  10 +
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/nct6694.c            | 394 ++++++++++++++
 drivers/net/can/Kconfig          |  10 +
 drivers/net/can/Makefile         |   1 +
 drivers/net/can/nct6694_canfd.c  | 826 ++++++++++++++++++++++++++++++
 drivers/rtc/Kconfig              |  10 +
 drivers/rtc/Makefile             |   1 +
 drivers/rtc/rtc-nct6694.c        | 263 ++++++++++
 drivers/watchdog/Kconfig         |  11 +
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/nct6694_wdt.c   | 281 ++++++++++
 include/linux/mfd/nct6694.h      | 142 ++++++
 23 files changed, 3469 insertions(+)
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


