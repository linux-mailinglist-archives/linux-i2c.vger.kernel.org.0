Return-Path: <linux-i2c+bounces-6908-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 581BA97D8A7
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 18:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 960C6B21E04
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 16:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46491802A8;
	Fri, 20 Sep 2024 16:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QfX5gqBX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A1D18005B
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726851404; cv=none; b=lZpQbsWcVWbEHe3ddGWHGHetOmpJ3JzyaXCg6PoIAAdUUctlkX1+4EBXpSa1w2GyqG8J6sQ/Yh7JtJokGfqYcR/OhnoffOPMWsDovvlfywqsve8bbzxmbXkO6fccUFMZfk0ynfn4vhR3UqSBBhawA2idb8M7TlTN2sPuz7ydVJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726851404; c=relaxed/simple;
	bh=eQ6eDJopZ4+URHgz8LSjVYVazPqOH/fmi9Q3KIDAkYs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S1gz/uj+N5uH1xYN2jwb9eqJMLnsS6bGQf3FSRkjyEhiQnZkWWJl9OWHIB5DP+/ekhogtfnWRrlvD0/Py8rl+NgeTtWLUzVyFMaWugcQKvSYkW/qIqWR6fkEtVHbnK/KtcVLl9sOhuXI9JDLnIQOPyOScK1QcVMmseQQLtiVg7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QfX5gqBX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso18389445e9.2
        for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726851401; x=1727456201; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qVWOq7j6VeKrIEQ3TT8g/XrYFL4/GGx+Jco2eWp6mH4=;
        b=QfX5gqBXq+69x/hXp8+bzl6hIeTbKQ2rsWMANSwIegwZNemiM4p8qYv3CwSoc5vQ/L
         Xs6v08on3aBWqReRA/4kIxY29yMt/hYDas1rQkQ1XIUNomLX9OfrlwtDo0sp03ck3LLG
         9+j1YYubMiebiRO+7qQEzXFvq0R1301jwhWKUk2q7Hec62LSAXJOO6v/a+s/9yPVuN29
         oV479yfVlCvNXtP6GaSoBGI5IHJRsg34OYZBd5hJ5Ehp5em0ReetDgd6EgcHFwbY+i9c
         6dZ4e4vlobAeDUuGRtFKX+xm+TIqsT1Frwv8btcipp+vr1QofHcYOGpJC/Rk6v+tx8qI
         /cWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726851401; x=1727456201;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVWOq7j6VeKrIEQ3TT8g/XrYFL4/GGx+Jco2eWp6mH4=;
        b=RFH/b6mLJGjj288hh6BRELfh+vHihl9V6SDbeH1xrBYiq16zVcwfLZYEmLmzl3LPsx
         SmZ2L8Wm3sc5+VKdWtiZqxyi3y9U2dvBlVUnuAGAGPlstGQza6GIVZVSIeLnyfJSrfGG
         6PRInOB2GaLElbQxaOCPF1IEHJzfWV+Y9YoNLaBrPDH9LQ2eB2bmpFMAknLGmwWVA8wM
         MFLYfJan2MfQtoHMvf2BTUuSFvj70QN81GatJp+er2QmoyYgTslL0kcrko4GT8pUs8T/
         E5JXPUiKJL5p/JMbmyyi51TW6SDCsiU8Z1yaoqmvTH6RGIv+O8uarCp9WvU32OGQT3uN
         8uLw==
X-Forwarded-Encrypted: i=1; AJvYcCW96EF8vJIl2P+XOXqei3aq7rGyhlAJ1KfDbhWhYpKEsYWxj22r7nG1Nu2p7tZTYD4E8STRpO6Yc8s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtts+AG9vQm+kptrGduoaUco9H7nclceqKv+Zz5V7iS5r2T+OB
	q6RqAiAdQyTEO6sG2kboQ3x2dh0ocxl4S8hfYcYXI+mL7VsszpnYmCwAjJR+zhw=
X-Google-Smtp-Source: AGHT+IHga6P2ESwmDIdisEJWSdWSk8I9zAFu0d4NEVnifrBC2qujvBEV3L/DzC26OkA6GDV/voWhtg==
X-Received: by 2002:a05:600c:1c95:b0:42c:de2f:da27 with SMTP id 5b1f17b1804b1-42e7c15b393mr24786095e9.2.1726851400593;
        Fri, 20 Sep 2024 09:56:40 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8e69:83a7:a29a:ba83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e6c718e40sm97430135e9.1.2024.09.20.09.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 09:56:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/3] hwmon: pmbus: add tps25990 efuse support
Date: Fri, 20 Sep 2024 18:56:11 +0200
Message-Id: <20240920-tps25990-v2-0-f3e39bce5173@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACup7WYC/23MQQ7CIBCF4as0sxYzBWqDK+9huig42Em0NNAQm
 4a7i127/F9evh0SRaYE12aHSJkTh7mGPDXgpnF+kuBHbZAoNRo0Yl2S7IxBobRD5720hBeo9yW
 S589B3YfaE6c1xO2Qc/tb/yC5FVUyVvWkFfWmu9lxe7GNdHbhDUMp5QuAnrN+owAAAA==
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Naresh Solanki <naresh.solanki@9elements.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2072; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=eQ6eDJopZ4+URHgz8LSjVYVazPqOH/fmi9Q3KIDAkYs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm7alEmgtnJvXig11D+y0pelVYrGLqUfYzpHkQR
 mVNhkLYYh2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZu2pRAAKCRDm/A8cN/La
 hSG+D/9HCkBTa+7D0YPg7wUAjwHdwq6mqzBUmEWmBNcdRleLtgGFxvm9O1WF/lmrF+WlnbFZr5L
 MfMTeTrvWCZDZTP5hwgeGgz/rpB3Q2OisqOmvuzvKwGI0R/XzpCWoQPCd7QWniQR/V+fFZRpkCW
 o85rjvz9akU0zuaZhHRdENRZFuLFfJqXgg6s3NMIjMgIYTCrlw2pjd18dCpd8mnB953zIneXBqk
 ijvD6S3kCeZe+b+IVjCwXuuyHsVd6qeIhL/KKxWh2g1aSARjakd+EtSmkXmaP/ukw0/J0ZybR6t
 /k7UMKaclcVwshuOCbbkm4XfNFAis7NOJ0TjuzvlCP2Lha+O7vOmgTWIRilmpsXANzwljztYppr
 4xwksTSydDc9WLsuxtsUaMiiOjMn5w4g5qtLMcTjMUqbCVvkSUkO79St88GG4eA+OBkzK2bkBtc
 8yn15oK3/Gcvj2rsVu4agRqYQZBusrydX5XDpGMxMSyw7QyOYp7ydqV4Lis3dw9AoL36dBC9PdT
 e+rimzLyLN5wLYkotlVpYSps5AxEVHIHWKSs/VpW+XWpAvvFePc+vFwAvvPpBpQRTLC2LufUqyD
 gMh7J2xgdq2/qmLUwuq/aCKlVZuZddbFpWLPfY9M07s5+vX/rVugKo1B5/S4tEJTXiquADTrJ0c
 vAAhjlMEyg8cRWQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset adds initial support for the Texas Instruments TPS25990
eFuse. The TPS25990 is an integrated, high-current circuit protection and
power management device. TPS25895 may be stacked on the TPS25990 for
higher currents.

This patchset provides basic telemetry support for the device.
On boot, the device is write protected. Limits can be changed in sysfs
after removing the write protection, through the pmbus module parameter.
Limits will be restored to the default value device on startup, unless
saved to NVM. Writing the NVM is not supported by the driver at the moment.

While proper write protection support, including for the regulator part,
depends on [1], there is no compile time dependency.

Changes in v2:
- Drop PGOOD command support
- Use micro-ohms for rimon property and better handle range.
- Adjust read/write callbacks to let PMBus core do the job by default
- Drop history reset specific properties and remap to the generic ones
- Drop debugfs write_protect property and remap to the generic register
- Link to v1: https://lore.kernel.org/r/20240909-tps25990-v1-0-39b37e43e795@baylibre.com

[1] https://lore.kernel.org/r/20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com

---
Jerome Brunet (3):
      dt-bindings: hwmon: pmbus: add ti tps25990 support
      hwmon: (pmbus/core) clear faults after setting smbalert mask
      hwmon: (pmbus/tps25990): add initial support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml          |  83 ++++
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/tps25990.rst                   | 148 +++++++
 drivers/hwmon/pmbus/Kconfig                        |  17 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/pmbus_core.c                   |   7 +-
 drivers/hwmon/pmbus/tps25990.c                     | 427 +++++++++++++++++++++
 7 files changed, 683 insertions(+), 1 deletion(-)
---
base-commit: cd87a98b53518e44cf3c1a7c1c07c869ce33bf83
change-id: 20240909-tps25990-34c0cff2be06

Best regards,
-- 
Jerome


