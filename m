Return-Path: <linux-i2c+bounces-3816-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 997BF8FD4A0
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 20:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85A561C222BB
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 18:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D3B13B5AB;
	Wed,  5 Jun 2024 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OyMmHgy1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FE0194AF4
	for <linux-i2c@vger.kernel.org>; Wed,  5 Jun 2024 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610403; cv=none; b=fvQ2P9CTgwxNCHULMAmHRdPLsacBjZTywFa1FPwhj7gFMBTyPsBfic/VeR5uV4pr2gUqOpetSQgU7lrWCYsvGaWM7aiU1/O9vXDCWfuVmrVNGS7OAxeO/IuAC0z1XHnqQZ6BViXTuWu63SUClpGCpU3cfhM2lTkdlvwfYf06JXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610403; c=relaxed/simple;
	bh=BxoABlKvJef+pUpKvjxVkdFoF53gAB3xVu8cHZaGBrk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cjqV0xlYzJz0shcHaG4wB/mj046CBbbO7Sei/RPk+xRvHoY91gXNkbz/Q5HRGyuk6d33102uiKL+lvHDhNOqKKE3nl/KIDnK6nR/SQKetggYl3k2JYrwF7XfOPGercNGfpwSIDI/sZmPVDM7LAp9+Fzeul0xoYVwTiThi1znrtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OyMmHgy1; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-df78ea30f83so1550248276.1
        for <linux-i2c@vger.kernel.org>; Wed, 05 Jun 2024 11:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610401; x=1718215201; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w5RPl7PD7LMs1k1njsQ/RXiUssQb7CTl+XBmOvI3R5A=;
        b=OyMmHgy1OprhTZCk1PpY0KDM++WlQ1Edw2Mps1X0EgJF2iRBA3+tnZUd98ocPSXWN7
         I5HJFrKZWoDLgPm7SDxl1bkWvzGz18zxNjGoXmNXX1/JRy6wFqUXPM4fg6njQ4saM2A8
         yLMbKusUCgwnE0ITdDiMX3hsSX1dBE5GBbZOTqY8dwoA8iLHbnfmjPCwDmWjbzvPqRvX
         jE0jfYNVECTVlFMrLnVd2AQ5Xmr6HOM3bKPb3xt0oUX/V9PhfG/3FV6uK6EMbBp8IkTk
         9k2llsKW20VKa+QhtGVJt5Ip8/G/LiZr0xSkvjVn57gLonJE8lQKc2VUpPo0iQIWkuHq
         QWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610401; x=1718215201;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w5RPl7PD7LMs1k1njsQ/RXiUssQb7CTl+XBmOvI3R5A=;
        b=lAJWW0ArRJnNjW5xnAtGFYJsHTdL7duawXsSyhLgJivxvnVZcIkvw1Qb/fifZ3idz4
         kdKQoK7LKpftIDpwH06kvubNjpEtcE1JD6xpVXKJSRF/UXLG7KksQKRbEkXTe5MMoEo9
         vMClWqfUVh7Dn4/CNVvng3s8prfCV/4XENUk3x989pS9tN5A7XLJN6AkiFK1ia6S0cS7
         tJMtmhwFCOJ4pd4G2zYp4zTwNmh5PP7+sl9IW07uPoWZqGkfnatgyu3VwSUugio/W2sk
         r9aaSB3/pDWq/DcO90ZCVcTyZJF1w6cKI9KKUa2SHj4ZzaVEc3W7GhS1KLkjgnJgZ7Cz
         4HEA==
X-Forwarded-Encrypted: i=1; AJvYcCWg1SGdPp9EVHTXn2nEAomB8gNvSCBRFhZIIU7eS3vuRXOnPDkNk53KjDlY6qmJfxrdv5k91Uxoi+O+u2ePumohHlEhLeW7N9No
X-Gm-Message-State: AOJu0YwXbMRsNTRucnS5VZ79yYO4YAZNdz5cSklFi/u32tM57OymfiEN
	rX9SJzF+IItiUYJqpZdIkGXDl486+VEUP897Xokzk5pNOaBye0W4RI1N2fLQ9PqpcKQPdhHYULr
	S1IBnnz0u6A==
X-Google-Smtp-Source: AGHT+IE3beT3+LJiyuyeey70O4vTmt9cNoEU8h7bwGC3fodiNqs+98CXh8Kyq/MReppn/4vWIwzPR7Cf0wAFHw==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:987:b0:dfa:7552:e09e with SMTP
 id 3f1490d57ef6-dfade7e34cbmr71646276.0.1717610400689; Wed, 05 Jun 2024
 11:00:00 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:44 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-1-joychakr@google.com>
Subject: [PATCH v1 00/17] nvmem: Handle change of return type in
 reg_read/write() definition
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

This patch series facilitates compilation post the change in definition
of nvmem_reg_read_t and nvmem_reg_write_t callback in
https://lore.kernel.org/all/171751721565.70889.16944298203785853489.b4-ty@linaro.org/

Currently the nvmem core change is picked on
https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git/log/?h=for-next

---
V1 Changes : Change read/write return type to ssize_t and handle
relevant logic changes
---

Joy Chakraborty (17):
  hwmon: pmbus: adm1266: Change nvmem reg_read/write return type
  media: i2c: ov2740: Change nvmem reg_read/write return type
  media: i2c: video-i2c: Change nvmem reg_read/write return type
  iio: pressure: bmp280: Change nvmem reg_read/write return type
  misc: ds1682: Change nvmem reg_read/write return type
  misc: eeprom: at24: Change nvmem reg_read/write return type
  misc: eeprom: at25: Change nvmem reg_read/write return type
  misc: eeprom: 93xx46: Change nvmem reg_read/write return type
  misc: mchp_pci1xxxx: Change nvmem reg_read/write return type
  mtd: core: Change nvmem reg_read/write return type
  mtd: ubi: nvmem: Change nvmem reg_read/write return type
  soc: atmel: sfr: Change nvmem reg_read/write return type
  w1: slaves: w1_ds250x: Change nvmem reg_read/write return type
  thunderbolt: switch: Change nvmem reg_read/write return type
  thunderbolt: retimer: Change nvmem reg_read/write return type
  soc: tegra: fuse: Change nvmem reg_read/write return type
  rtc: Change nvmem reg_read/write return type

 drivers/hwmon/pmbus/adm1266.c                 |  4 +-
 drivers/iio/pressure/bmp280-core.c            | 14 ++++---
 drivers/media/i2c/ov2740.c                    |  6 +--
 drivers/media/i2c/video-i2c.c                 |  9 +++--
 drivers/misc/ds1682.c                         | 16 +++-----
 drivers/misc/eeprom/at24.c                    | 10 +++--
 drivers/misc/eeprom/at25.c                    | 11 +++---
 drivers/misc/eeprom/eeprom_93xx46.c           | 12 +++---
 .../misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 16 ++++----
 drivers/mtd/mtdcore.c                         | 18 ++++-----
 drivers/mtd/ubi/nvmem.c                       |  6 +--
 drivers/rtc/rtc-abx80x.c                      | 15 +++----
 drivers/rtc/rtc-cmos.c                        |  8 ++--
 drivers/rtc/rtc-ds1305.c                      | 18 ++++++---
 drivers/rtc/rtc-ds1307.c                      | 22 +++++++----
 drivers/rtc/rtc-ds1343.c                      | 18 ++++++---
 drivers/rtc/rtc-ds1511.c                      | 12 +++---
 drivers/rtc/rtc-ds1553.c                      | 14 ++++---
 drivers/rtc/rtc-ds1685.c                      | 14 ++++---
 drivers/rtc/rtc-ds1742.c                      | 14 ++++---
 drivers/rtc/rtc-ds3232.c                      | 22 +++++++----
 drivers/rtc/rtc-isl12026.c                    | 12 +++---
 drivers/rtc/rtc-isl1208.c                     |  8 ++--
 drivers/rtc/rtc-m48t59.c                      | 12 +++---
 drivers/rtc/rtc-m48t86.c                      | 12 +++---
 drivers/rtc/rtc-max31335.c                    | 18 ++++++---
 drivers/rtc/rtc-meson.c                       | 18 ++++++---
 drivers/rtc/rtc-omap.c                        | 12 +++---
 drivers/rtc/rtc-pcf2127.c                     | 20 ++++++----
 drivers/rtc/rtc-pcf85063.c                    | 20 +++++++---
 drivers/rtc/rtc-pcf85363.c                    | 39 ++++++++++++-------
 drivers/rtc/rtc-rp5c01.c                      | 14 ++++---
 drivers/rtc/rtc-rv3028.c                      | 32 +++++++++------
 drivers/rtc/rtc-rv3029c2.c                    | 20 +++++++---
 drivers/rtc/rtc-rv3032.c                      | 24 ++++++++----
 drivers/rtc/rtc-rv8803.c                      | 16 +++++---
 drivers/rtc/rtc-rx8581.c                      | 39 ++++++++++++-------
 drivers/rtc/rtc-stk17ta8.c                    | 14 ++++---
 drivers/rtc/rtc-sun6i.c                       |  8 ++--
 drivers/rtc/rtc-ti-k3.c                       | 16 +++++---
 drivers/rtc/rtc-twl.c                         | 20 +++++++---
 drivers/soc/atmel/sfr.c                       | 11 ++++--
 drivers/soc/tegra/fuse/fuse-tegra.c           |  6 +--
 drivers/thunderbolt/retimer.c                 |  8 ++--
 drivers/thunderbolt/switch.c                  |  8 ++--
 drivers/w1/slaves/w1_ds250x.c                 |  4 +-
 46 files changed, 408 insertions(+), 282 deletions(-)

-- 
2.45.1.467.gbab1589fc0-goog


