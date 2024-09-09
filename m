Return-Path: <linux-i2c+bounces-6414-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F96971E34
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 306701C22865
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 15:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A9654278;
	Mon,  9 Sep 2024 15:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Z6yQMEBh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1903BBCF
	for <linux-i2c@vger.kernel.org>; Mon,  9 Sep 2024 15:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725896361; cv=none; b=CdLIiXRWHeSjR/PFi+2LpBNkCi+5xNOGZsw3QMUFklmwd6u0SUbGrQNXe4oRszJNs++t6btN++XeAcj1a0Mu/BnYjRd3qvfCDxgcFzzPtQIMZAF8vaO30PLRrpe/K6SZnhO1s0SlAHRqXpDXOTiYlsqW75Qzpk4gg8O+aT3tWq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725896361; c=relaxed/simple;
	bh=tR8kO6PuFrwBBIuqy1jmykEHT6GN8EHwvvkRzwZMc8c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u8pPyhVLinfsyveg8ZXrmPYli+DsOirSTwGShYe7Zz5tYCeE8rBI8rDlWuav8dQnCY3hNGWEpLxpbxPi6KDbc5uQlVqTAIyNMWY17itMpVW6jGnE9S2mueOevLH4cd7PBBJP56h3y1Cudn+h+oLv8S5hMlqLpLIv4GXFVdMt5L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Z6yQMEBh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374bfc395a5so2643708f8f.0
        for <linux-i2c@vger.kernel.org>; Mon, 09 Sep 2024 08:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725896358; x=1726501158; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gI3EWry1HeKkrariixrdSUNjJ5pjPrLgpmN89IajSBE=;
        b=Z6yQMEBhU9uHwdwBwxpBdL6ZAVd2iPL36oQysjCZuN35mhNozIol83cHeA0PWQv7to
         vlZp1+ddn6nYOKpkFMmZdn602Y8rkP2SyJ+gBW/WAmoKWZL5gFQlgRALfuaCCSZyR0fn
         j7YKzpdcp9lt+I/tT7OSekZAFnw1edl0Q5xBiOKS6y8GlZS1y6UtK2NC5vh2KUZtkrrw
         sdP7N48r+vhI1GR+Jrtp7KSWQosKv4gRC4grwSBL5XPLnFwFIYcZ5Ui4TVBRuQF4X6P2
         pFFYiwLdFta5AQbqEP3k83NP4sn9AdiMuRpPAG1yTiv/Em/siuH8KpRaWkp66Due27CT
         VsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725896358; x=1726501158;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gI3EWry1HeKkrariixrdSUNjJ5pjPrLgpmN89IajSBE=;
        b=oQRZpbqCgKGJOlqQL7t1QPn3rUdVrmppK6Q30Br+OqxKvgjpMeC8U5zoZyWFR2V89R
         XuO2R+kWUhRzLPGDzGD5GNIRhnfqPnwGkD4B1kb0U2eHYJIKzvAO/t6C33QMc99X3vUn
         qMaYZxB6D/OV2B7OgDK5TghJ6SO00KmvZ/N2s3Ch2Z7rnkmnmxUWAogfUw884izrwSaf
         u3bm3xegPzzHv59YKgDtYeXmt3x16duTcIMUidjCnFQdoPy8Ar/POBeKaZgZ3rp1OI71
         V+YMuW3j+2FFXdO7SzjoC0gsWz7cqGed/uye8ejQvsWfdTJTZkTf4o6JXg37vHNsn0cl
         kxYw==
X-Forwarded-Encrypted: i=1; AJvYcCVqr8cWNVgMLHGX0t8Ut8fQI0of85E298JHH+WPTyfd4BFHuHzk66oXlrFnDkD1A/+RWqnfrcpBt5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW1sPJGulJ8FTrMzmfhj1KqBlR8HRE+u5iMub7BzeNimTbTB84
	q1YzZRUdnsCGMg5yzbGpNGYh8hVox4aMi/6hP31lpCRRY+ZD0nPsdjTLWSYJtqeOsPJG9lhd27B
	m
X-Google-Smtp-Source: AGHT+IE9XPZXajcl+NEQcJ7P0Jannlu1V5w4PEQDba0+5qseJi/FCOGsmbFLhX7q9rPCx5Jh2uuGmQ==
X-Received: by 2002:a5d:6284:0:b0:374:cb28:b3f8 with SMTP id ffacd0b85a97d-378a89fd611mr24756f8f.1.1725896357418;
        Mon, 09 Sep 2024 08:39:17 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:788a:4542:ae86:67f4])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3789564af1asm6305145f8f.18.2024.09.09.08.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 08:39:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/3] hwmon: pmbus: add tps25990 efuse support
Date: Mon, 09 Sep 2024 17:39:02 +0200
Message-Id: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJYW32YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwNL3ZKCYiNTS0sDXWOTZIPktDSjpFQDMyWg8oKi1LTMCrBR0bG1tQB
 8TA00WgAAAA==
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tR8kO6PuFrwBBIuqy1jmykEHT6GN8EHwvvkRzwZMc8c=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm3xagS7BwL8tqMu7GRBfQetYcJy9MwFpJJwkY3
 4En3g/50yaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZt8WoAAKCRDm/A8cN/La
 hcosD/0UO/DTTtUYHOqQv1Mjr4Rhs6b89CikgPS2UZm6E2AtU1DS+9gj9rz+5nfJfHdulRZfmdO
 0bOPkzrh2ehmTiLO4b9ciE9euq26sERQ4+Fn5Ttf65rAReiLYRKhjoETIXS4wpr4meySZDh5Ngk
 wL3/EhJIiy3Ze5cYX/B6Q4qeQebsQOHf0Eo3USEBkFJaID21y21+WqifLFry++D9mSFh/QO84qv
 JaKjYcr5PYAXN9k/pINqW6TdZEu+1IaxwBkQE232Cir5lHySg8YKtfCXNxlKQD0PLIbA0XU2ekf
 w9JZpkpU8XjG7NY9g0AmcJPUGx7l39Q0EF8SSVeUYOxN4MNrUlOpIwk35s4rABH8eQNfiI0LGON
 0rCxvAK6ar9UzDK2FIbzWarLMTXlNjTXQ7xECRvLaj8YWHoSqFkjFZBSbll8aNGiRS1Ru/ZBced
 akj2OpTXZzqeE7kwHfLG24YfDOA8wY0JnsSKkfueFnDoBugUphFN1i+OWiV+mOT18wykgVBQH+9
 B1W2USFSi/jHgNQ3pq/ExntCFWvRWzIuh9X7ys95z9UUjaSrjTPb3t5sA02d7jF8N0WQNrAEut/
 9JfxDit+Bx6lZSjwjEhXAsel3Vdjj6SNfLZraN2GgJ5dmYAnakan3pQP/XBzcutn3aRkUCHBqu0
 PDbFCtiddoSqnGw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset adds initial support for the Texas Instruments TPS25990
eFuse. The TPS25990 is an integrated, high-current circuit protection and
power management device. TPS25895 may be stacked on the TPS25990 for
higher currents.

This patchset provides basic telemetry support for the device.
On boot, the device is write protected. Limits can be changed in sysfs
after removing the write protection, through debugfs. Limits will be
restored to the default value device on startup, unless saved to NVM.
Writing the NVM is not supported by the driver at the moment.

---
Jerome Brunet (3):
      dt-bindings: hwmon: pmbus: add ti tps25990 documentation
      hwmon: (pmbus/core) add POWER_GOOD signal limits support
      hwmon: (pmbus/tps25990): add initial support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml          |  73 ++++
 Documentation/hwmon/tps25990.rst                   | 141 ++++++
 drivers/hwmon/pmbus/Kconfig                        |  17 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/pmbus.h                        |   3 +
 drivers/hwmon/pmbus/pmbus_core.c                   |   6 +
 drivers/hwmon/pmbus/tps25990.c                     | 474 +++++++++++++++++++++
 7 files changed, 715 insertions(+)
---
base-commit: d22bd451d5606411895ef55cb105277e4f4f6e54
change-id: 20240909-tps25990-34c0cff2be06

Best regards,
-- 
Jerome


