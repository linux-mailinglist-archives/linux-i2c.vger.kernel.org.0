Return-Path: <linux-i2c+bounces-7518-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629E9ADFA1
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10A731F223E3
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E781B3939;
	Thu, 24 Oct 2024 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBPPVemd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12151B0F19;
	Thu, 24 Oct 2024 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760384; cv=none; b=LGjn80SqkZSelJz8/LVpgWg2mO4VvgKW19v3bJ0zr/5RcN3Yq5XooVDHudFSvnGoCe5ngf4xiHYsTFGBZ0RvAnQgTgc0QGq9lCE7ivs/9kdScC7eD55ADiy+fGT7CX+ySKIMLuQshCuKCiE70d0Kmyfzwl0UDJ9+cG6RCMTmG8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760384; c=relaxed/simple;
	bh=fWZRKKDMjH6AV4L2EpcN1Z+Dw912vE6hGK1NZIhh4cs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BMwhJTOGQrgKAcsap72WnPzHNtCV3yydqvdtzD0vjRbMMOKkA2Q73CB/QvfSdozXvhvLQie0Enr44kk8IrNr90wRRFJYS1Ys639KvmClLDczEe5JF6e7yqMaP4Or0HNOxuQxVnmi56N0FXjC5OTS6PLZlJDmTcGpbcBZEIWbCDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBPPVemd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20cbca51687so5384395ad.1;
        Thu, 24 Oct 2024 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729760382; x=1730365182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0Y48yxp1xFIkBVIBLGxo7k5thlINaCSsNpWdPdeLiA=;
        b=XBPPVemdcCZ6JXXDHrwJfyDRfjIJ4NtrlHhncJVteYaH8otcHa/tyqQMmvqiVNK1eO
         bf0wadbdmE03/hAez0/5+GiKVT5Hw51t7vZzNgMhn4B6J7e8AcFLZ7U2tjsK7ZRWtNDd
         6GurXdL6q8ciK2Psty3smiB/wp+NIlAEb9m3rmWVM83dmUfOGzz7TCdDjVYstA5XykIa
         rvG2XAFQsBHiBWxQLJegm35fMIm2B5c7AAx1JlYscI0R/OanV00EgMsACxGSHAC24uqt
         JDqmkIP0F1Uaq3SFuztA3KPRFPBzPA09+KQxLyiSxBCkcJQ43hg/CtrE8AP4vHmUM3MJ
         yaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729760382; x=1730365182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0Y48yxp1xFIkBVIBLGxo7k5thlINaCSsNpWdPdeLiA=;
        b=P8Q7y2NMC8YPMoH6XUdtw3IeJC/CTNC3b48m7jofCO/lKfwHieCYIsPxy79Bfpqn9B
         j/cNsCe7hJOREuL0K4XB92wJta6spDupe341eq1Mum8BBgcscuckuNdvARD/E5lUyLHM
         U7ZU5obA9CB6GkJEoydsb8u4Kgwn14ivtN3uND1Mk/32a58jPWlxlps34e8AZmKeQThq
         ijv07jRETqBb45lrbzotAdPB0TFMq86Kzc8eeHh33kwVu6kiWcgGFXQXCessWVJ8Eu+C
         ONE+/lnHeIKpxvyUrcTOp18EimVPCeQyxgnDVIULF0Jx4qQ2wUxxL4nqt3fnFWQ4fMOP
         TVgg==
X-Forwarded-Encrypted: i=1; AJvYcCU5q7zbIxMwV0vHLnMY0MVMn0s2gTs9TSu3ePcZ7tj2a+rp56qH5ogVOKeZhjD+EAs0r54DMVpbuc0Q@vger.kernel.org, AJvYcCUqsQV4miPOct+eW5McMrOy5ZpaHD96gBA9X9LSGnoTfHZ0N1Ke3bHXnIMjJfoZaUuiFWI74BcprIzy@vger.kernel.org, AJvYcCVKTKgTov2kcO8GScamM3u4n3136b3y07CbteI4/QGdBpunAXSLnLmQ8etKwQ/BIsF9e1Fywl7h@vger.kernel.org, AJvYcCW56tQ+M/Mfw0Ek8mFsiu7zm3FWx7D+wGoiOCzhBqkdGmf/v4g3dvqiee2SmRjHXCKDWoER56197Jc=@vger.kernel.org, AJvYcCWFYHB56j7nNxyggej1S8dQEFI3qCZLtc+wpPkB31S7QpOCGrRNs/NI/zIIQuEapG8PUDJZAvpLZAzg0mT5W+Q=@vger.kernel.org, AJvYcCXBl6a7K7vxQckXIT7eUA8mz1zxOfzqUEFlZGO32MAbp644fXaLXAS7uqtgyHTCs81xCyBaCTeDQ/tzw+o=@vger.kernel.org, AJvYcCXI4KgNVj0k0lmT8C8uq3Iy53H1aE47blRHIWL5hpA95RCGaRhQQqR7cd5jln8QFlkXUZj7u6SLfXf7@vger.kernel.org, AJvYcCXI6dVfI0pAuZuOV0bz8fWnzBqGErMfeNVhfLjWw2FgIb9J3EUsb8YMqxTTQlbkw7YCjrV/nk9+iSqE4A==@vger.kernel.org, AJvYcCXLHBB2xR0gSpcPEyiujFZg3xRlUNY/2hDUSel8hc3YwXN1Bvo1OKIIN/huuCD8qb99K/h1ZtFEUJli@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3MZN3RJLM6JMQlurq0KzxmPwmf3peyowlVtvBSbPXfBe3Wvcx
	Zt/57HgZmcDNRCWp4tfrxgEjRaC9aMpCNPMVmYs3IMUexCcmlj8C
X-Google-Smtp-Source: AGHT+IFwOHTmv7xybBTY9E1hOrVStUF7eEvo0pWRQYLqNOIKdK0keUMlla+cJjiazlWheUoWCc8y9w==
X-Received: by 2002:a17:903:1cd:b0:205:6a9b:7e3e with SMTP id d9443c01a7336-20fab2da04dmr74934675ad.56.1729760381872;
        Thu, 24 Oct 2024 01:59:41 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6e89sm68503615ad.277.2024.10.24.01.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:59:41 -0700 (PDT)
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
	jic23@kernel.org,
	lars@metafoo.de,
	ukleinek@kernel.org,
	alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v1 0/9] Add Nuvoton NCT6694 MFD devices
Date: Thu, 24 Oct 2024 16:59:13 +0800
Message-Id: <20241024085922.133071-1-tmyu0@nuvoton.com>
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
(1/9), GPIO driver(2/9), I2C Adapter driver(3/9), CANfd driver(4/9),
WDT driver(5/9), HWMON driver(6/9), IIO driver(7/9), PWM driver(8/9),
and RTC driver(9/9).

The MFD driver implements USB device functionality to issue
custom-define USB bulk pipe packets for NCT6694. Each child device can
use the USB functions nct6694_read_msg() and nct6694_write_msg() to issue
a command. They can also register a handler function that will be called
when the USB device receives its interrupt pipe.

The following introduces the custom-define USB transactions:
	nct6694_read_msg - Send bulk-out pipe to write request packet
			   Receive bulk-in pipe to read response packet
			   Receive bulk-in pipe to read data packet

	nct6694_write_msg - Send bulk-out pipe to write request packet
			    Send bulk-out pipe to write data packet
                            Receive bulk-in pipe to read response packet
                            Receive bulk-in pipe to read data packet

Ming Yu (9):
  mfd: Add core driver for Nuvoton NCT6694
  gpio: Add Nuvoton NCT6694 GPIO support
  i2c: Add Nuvoton NCT6694 I2C support
  can: Add Nuvoton NCT6694 CAN support
  watchdog: Add Nuvoton NCT6694 WDT support
  hwmon: Add Nuvoton NCT6694 HWMON support
  iio: adc: Add Nuvoton NCT6694 IIO support
  pwm: Add Nuvoton NCT6694 PWM support
  rtc: Add Nuvoton NCT6694 RTC support

 MAINTAINERS                      |  15 +
 drivers/gpio/Kconfig             |  12 +
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-nct6694.c      | 489 ++++++++++++++++++
 drivers/hwmon/Kconfig            |  10 +
 drivers/hwmon/Makefile           |   1 +
 drivers/hwmon/nct6694-hwmon.c    | 407 +++++++++++++++
 drivers/i2c/busses/Kconfig       |  10 +
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-nct6694.c | 166 ++++++
 drivers/iio/adc/Kconfig          |  10 +
 drivers/iio/adc/Makefile         |   1 +
 drivers/iio/adc/nct6694_adc.c    | 616 ++++++++++++++++++++++
 drivers/mfd/Kconfig              |  10 +
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/nct6694.c            | 394 +++++++++++++++
 drivers/net/can/Kconfig          |  10 +
 drivers/net/can/Makefile         |   1 +
 drivers/net/can/nct6694_canfd.c  | 843 +++++++++++++++++++++++++++++++
 drivers/pwm/Kconfig              |  10 +
 drivers/pwm/Makefile             |   1 +
 drivers/pwm/pwm-nct6694.c        | 245 +++++++++
 drivers/rtc/Kconfig              |  10 +
 drivers/rtc/Makefile             |   1 +
 drivers/rtc/rtc-nct6694.c        | 276 ++++++++++
 drivers/watchdog/Kconfig         |  11 +
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/nct6694_wdt.c   | 329 ++++++++++++
 include/linux/mfd/nct6694.h      | 168 ++++++
 29 files changed, 4051 insertions(+)
 create mode 100644 drivers/gpio/gpio-nct6694.c
 create mode 100644 drivers/hwmon/nct6694-hwmon.c
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c
 create mode 100644 drivers/iio/adc/nct6694_adc.c
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 drivers/net/can/nct6694_canfd.c
 create mode 100644 drivers/pwm/pwm-nct6694.c
 create mode 100644 drivers/rtc/rtc-nct6694.c
 create mode 100644 drivers/watchdog/nct6694_wdt.c
 create mode 100644 include/linux/mfd/nct6694.h

-- 
2.34.1


