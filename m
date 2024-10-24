Return-Path: <linux-i2c+bounces-7552-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE21C9AEF4C
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 20:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E29B1F211E4
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 18:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49EFF200CB0;
	Thu, 24 Oct 2024 18:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wacLMw9N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09775200BB6
	for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793467; cv=none; b=HDwHv31B4PJuvW422kuCI6nFz/vxUrf3dbXT7nlM0FiO6ZMZD4qWjHyLPavuv38SkqPJWeOt7MbpTxBFWCEEroaGgon7OC8wgpoPu7CSXDl4AT5T5zEYt0dJWHbuu2qjyoUzhxrL27zorYb3S93ukEP79RkGal2knUDHV/PrbOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793467; c=relaxed/simple;
	bh=wuUDrWGldoGzLKmEDKRB+N+oojKVOt07T8M5dyrnk6A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ayG3CaPly6s6KkMrj9gPS50AKQ2fff/o5IBl+aNbvG6e4PQPrW7WpkusvmBJ34hjNZ4cyEW6KdITn++CkZK5D25EBHi3kEz2UmvBxpE0f084eHqnVn4BlcbKQYIl/L1bYTVUJ/mePkjdCCBUxs9eCKE9KxYft6YRaC8475AS+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wacLMw9N; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37f52925fc8so835693f8f.1
        for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729793462; x=1730398262; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IqU0yvR44kyPrUFOs9XxlTbM2CjS1kPGGNa549pruJ0=;
        b=wacLMw9NLwTcPf6/cMlDcibqMP48rL2Yw0wzUZDO12oQuFM3AFIZrJTRl9DUT4n5Xw
         ZIIgpkB70prKYJMA7U69FQ8irLUo5Gvy9MocCI0utufLYs5OSCYdByt5VapHouVF8PQ/
         zaVWWmyMLql7Dua8uM2sT5fDzLpa8Bnt3Y3HZySOS+IsFOw4GEyd1QlVe3M2Q00bTsko
         TvRh5kBOD6nFipU5n2evTNT9AA/IkMUDe53yO3jV65YtWSTrZsSanIAs7aZ54xndGI+I
         Gzw1l26Y/b7BK5I2hsHuhFuTvi8FmzcF2HmNOHPZqW+jztoemTmtG6cAyWKR+JaRY1Yr
         ZVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793462; x=1730398262;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqU0yvR44kyPrUFOs9XxlTbM2CjS1kPGGNa549pruJ0=;
        b=Vh605sR3AWz27jEvIG/pa5QN/7lzD7ouaaYUUtcMIK7OP0Dos0APv1YlpDY4toqRrO
         C+Z2H/RFZFc1GagRkvxBypDPjZ4dhkpP5tT69o7Cn9Chx5Md0SZCyMzBKu55R6VVFm1h
         +JXrQXdXrI5d53CMgjG2MN7ITStSRs2anW2LOsdk75SK2/zoFr4iXVUE8fjiITiUPKbH
         C3b3OEDy+kQx6rx+LeEL6oh8lKT5w5q4rFWGtMa0dBN0oFAqP9kNqPLFRzoFAZ++z41h
         1Mcma6vuRZEksmuARJFoHeIvsObc9E1agrkPMjhBP95IS/7GL1op/BcmasTtMxz1UvYn
         H1uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX9x2YE4qBVe9bsK6pfZzeZoeCBJDu5FJyHFlgsCCoM2bUqYGpthizHSJWIArDkKAyGsVFTjjEpfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlKyf05fByTZuhN9lJvHD6BLH0F9W2IZqxJ66Au3eSFiUwUSwZ
	nu8GNAOx2lzI8VQpFz/2v1zF5gz+1KE9clg4FbjU0sPUCah+CQ4colTATOafJCM=
X-Google-Smtp-Source: AGHT+IFHTyuVsCBfNROuxNLrz1m+g63n0f5uKNpwbhVb79Q5e4mIsRTsMpKrKaJPjPSMD95PJpY3+A==
X-Received: by 2002:a5d:4f83:0:b0:37d:5046:571 with SMTP id ffacd0b85a97d-37efcf10dd8mr4687694f8f.22.1729793462147;
        Thu, 24 Oct 2024 11:11:02 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c04c:f30a:b45c:dbb])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c0f248sm52551275e9.37.2024.10.24.11.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:11:01 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/6] hwmon: pmbus: add tps25990 efuse support
Date: Thu, 24 Oct 2024 20:10:34 +0200
Message-Id: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJqNGmcC/22Py2rDMBBFf8VoXRVZb3nV/yhd6DFyBImdSoppC
 Pn3ThJoQ+nyCp3DmQtpUAs0Mg0XUmErrawLDvEykLjzywy0JNyEMy6ZY472Y+PKOUaFjCzmzAM
 wTfD7sUIuX3fV+wfuXWl9ree7eRtvr/9ItpGiyQVhQAowTr0Ff96XUOE1rgdy82z8ieXsieXIZ
 gGIR1CjEX/Y6yOqwucJz+qPst+rpuFHWWE+7T3W0jIva4VEk++eGgvGW6U0pk2Ygb7gG1C0H0q
 fBjXqlEKGbISOVgqrtWeBp6CUi2BdkCyCMBZTrt/xnE06aQEAAA==
X-Change-ID: 20240909-tps25990-34c0cff2be06
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <naresh.solanki@9elements.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Vaishnav Achath <vaishnav.a@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3011; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=wuUDrWGldoGzLKmEDKRB+N+oojKVOt07T8M5dyrnk6A=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnGo2uqLyLH6b8a+08Lm5MTRQl2OMVrjsX1pGku
 PCvopCiPZeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZxqNrgAKCRDm/A8cN/La
 hYJ1D/4hcgp6yuUvwxrHxbwvSEe4PKEWna4DpzjRu9DXprZcMDnPviwD2pKOrmS2H9tOOIqcwNP
 1PxdGl9FUuK6XYFzRzJcF5rg7YZjdK6Z/FHz3i9bs1DB5AdwHFk70oOK+WVtm6X1MBuYZno+Msg
 pKuOFg0qHXyeV9IOo5i84+qLXqDhWLFCNHUd/NfE1n1thnQwWAIsJ5wjn3EwoHA47T+su3HsXhe
 +0CioVEFXMYgoSgr3sU0Cr4QAk5n+ZuHAa9eETvbIUn74KCblHSRzVPd1GR0HboKXxrpDR9zrTA
 MyYpcAxYmB9DSw4NAfYbfX/vjN6kfZNoDRCNFOQF0yciPILVPLRIn1n6YdayWoVRTzARJ47uCX2
 2KWMwVZvu8LuKCfdW5ALIC1VuGVEqNKJKWXiwvQIla5o2u3cbt3YFxN8RDPV2liksxuOJM80OuB
 Nz5hBI+ApC+eK4gJw6vhaAWuYjnovGo3CpmkR9Zt7kEqW07U+3lZF3oWAzImMNoEAf0B44KPo6z
 ZdfJwgaO0abAXzY4nMzLM68AXlauujpvAoUR6EEWEy82xhbisoR9Byb9/+9w1+/q09SUK6ticuk
 ID59EcGjNxIU5v7sun+7YmZ2apL255cJjWohULxpUBQckVbaZoFXy1shivpYTbOGLareUrDfbIG
 qoA0ERK/u9/3ISQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset adds initial support for the Texas Instruments TPS25990
eFuse. The TPS25990 is an integrated, high-current circuit protection and
power management device. TPS25895 may be stacked on the TPS25990 for
higher currents.

This patchset provides basic telemetry support for the device.
On boot, the device is write protected. Limits can be changed in sysfs
if the write protection is removed using the introduced pmbus parameter.

Limits will be restored to the default value device on startup, unless
saved to NVM. Writing the NVM is not supported by the driver at the moment.

As part of this series, PMBus regulator support is improved to better
support write-protected devices.

This patchset depends on the regulator patchset available here [1]

[1]: https://lore.kernel.org/r/20241008-regulator-ignored-data-v2-0-d1251e0ee507@baylibre.com

Changes in v3:
- Grouped hwmon write protect patches from:
  https://lore.kernel.org/r/20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com
- Link to v2: https://lore.kernel.org/r/20240920-tps25990-v2-0-f3e39bce5173@baylibre.com

Changes in v2:
- Drop PGOOD command support
- Use micro-ohms for rimon property and better handle range.
- Adjust read/write callbacks to let PMBus core do the job by default
- Drop history reset specific properties and remap to the generic ones
- Drop debugfs write_protect property and remap to the generic register
- Link to v1: https://lore.kernel.org/r/20240909-tps25990-v1-0-39b37e43e795@baylibre.com

---
Jerome Brunet (6):
      hwmon: (pmbus/core) allow drivers to override WRITE_PROTECT
      hwmon: (pmbus/core) improve handling of write protected regulators
      hwmon: (pmbus/core) add wp module param
      hwmon: (pmbus/core) clear faults after setting smbalert mask
      dt-bindings: hwmon: pmbus: add ti tps25990 support
      hwmon: (pmbus/tps25990): add initial support

 Documentation/admin-guide/kernel-parameters.txt    |   4 +
 .../bindings/hwmon/pmbus/ti,tps25990.yaml          |  83 ++++
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/tps25990.rst                   | 148 +++++++
 drivers/hwmon/pmbus/Kconfig                        |  17 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/pmbus.h                        |   4 +
 drivers/hwmon/pmbus/pmbus_core.c                   |  90 ++++-
 drivers/hwmon/pmbus/tps25990.c                     | 427 +++++++++++++++++++++
 include/linux/pmbus.h                              |  14 +
 10 files changed, 780 insertions(+), 9 deletions(-)
---
base-commit: 516ddbfef736c843866a0b2db559ce89b40ce378
change-id: 20240909-tps25990-34c0cff2be06
prerequisite-change-id: 20240920-regulator-ignored-data-78e7a855643e:v2
prerequisite-patch-id: 468882ab023813ffe8a7eeb210d05b5177a1954a
prerequisite-patch-id: 2d88eb941437003c6ba1cebb09a352a65b94f358
prerequisite-patch-id: e64c06b721cda2e3c41a670251335d8a2a66a236

Best regards,
-- 
Jerome


