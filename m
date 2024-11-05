Return-Path: <linux-i2c+bounces-7793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5E09BD3E2
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 18:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D1442840D9
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 17:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4880C1E766C;
	Tue,  5 Nov 2024 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AqkgHuVH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB34E1E3796
	for <linux-i2c@vger.kernel.org>; Tue,  5 Nov 2024 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730829550; cv=none; b=nFTlYgkv3eKTiP22U8WHZ9fh5S2er8fZBlzfjId7z+P6lbsrvUePoPvmi4kBPRQIeLAZ3zPMdM8SHoBiFzAUxgyDPBiLzXAI2JhEYWwsxkGQuAyjZyuiXgW9yTz3faiwPJVFaWQufz5fjb1VNOyDWLpeIqdySLj5WU2g3xhNPgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730829550; c=relaxed/simple;
	bh=s1Ro2carmg4cdDYn+ZehICRb2kuGKQPQwpxPJuGVnxU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BMtD/uO0wuMlMdOIv1eHCqQsKqQKMHxkCC2VD3iQVZabZPqm5eW/uKho22rat5iS6e6+RqazFenvRzLqL44m50YXhPuPrilgOra6b+WNl3qs1AlDELDn+UsAUYxs6K2kaeV/9aU1I9E7qrRCUSbdaOYDiU+yi1+RZlUxbNYZ0uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AqkgHuVH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43159c9f617so45470165e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 05 Nov 2024 09:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730829545; x=1731434345; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h5ogXhGcm7nw9YXJ/wsq+XgFGJryP19GjyijWvmr/6w=;
        b=AqkgHuVHHFvPL1Llx5VtgWdT1zGkNFZYUKEkEw6f13DZ7ReohSGR38jxhaHpDXqln/
         C1KzoR0Kp/YDsLYBu02MxgPXjh09qHVso/c/BEyqJFgVV6AzeoYo6q2WiGIvEKB6pHik
         nL0VhLF2R28mD8PBIPSdDEz9y43V6FpN8Av/yIyFEeQvIKLABd/VTu878rTD5aa0wmAu
         TQzEUtNd9CcayiBaxyIt/RwieA+EvonploQvPgBOt4Pz9Ia9DdtlDGXaPt44hoU8e14B
         sirj2/IXZBy+dhKGryfzW9rtLnNysVeld0D1bzX4CZQabEq4j2vEEPYNXnSDMFf0v6iW
         0JpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730829545; x=1731434345;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5ogXhGcm7nw9YXJ/wsq+XgFGJryP19GjyijWvmr/6w=;
        b=FtMPZbG19jdRQ20w9ytZDppdxqcLfpHa2fGJvzvNJY2H2JA54Eo9e0U8LJT3o/HfVL
         LREIR9MGGLSTuxs++eWmifTYLk6E0qsv2bcyWAQC/LbYnMliLEJyMScwToAfSCg1YsZ2
         QHDpFz1SaWpZN3JHO0ojmBYaWv0vI3BtoUdDP0pmeSepJfvakZoKmbgDz0D9cQmVOm2e
         CWQ9Y+RwkHYuMlTz/LlCPwxUX0Zh7qntfAD1Pu0o5cQ7elt+49388KnkN429XdydxrGm
         5wJMP/tXfuSR3Xj9q/N3EhWU7/HBhIJbSGTBK9kVbJGTlmlbXNElE92I1JKB8FS7Edf+
         9m9g==
X-Forwarded-Encrypted: i=1; AJvYcCXe2fiXFskm+PH313Fru+rWSFea+EL/Fq5L0t4UomqfSVV4zEkDfdF3VclABA79DIYEvVi1XH+pFVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyowDGLpJ8XQrpcYM4nJmzBNEPZmxPBFIK6XU1T0uMy6lwFdxGp
	m3AwRTYpa/oZO+0xigj3Wf75FhPFKZ1LYcP7arGoo6o5SGPc67tQnhGZ65TUGr8=
X-Google-Smtp-Source: AGHT+IHh68+kuUND1IhEtMvxa4mwILdaC1HK3yEzW1UgqnS53G2pJxkVVM+O6YaqsovSK+Qf+4Cr5g==
X-Received: by 2002:adf:e6c4:0:b0:374:c4e2:3ca7 with SMTP id ffacd0b85a97d-380610f81cdmr24243679f8f.5.1730829545040;
        Tue, 05 Nov 2024 09:59:05 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5b9b:df02:2761:7a57])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381c113dd7fsm16959481f8f.70.2024.11.05.09.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 09:59:04 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 0/7] hwmon: pmbus: add tps25990 efuse support
Date: Tue, 05 Nov 2024 18:58:37 +0100
Message-Id: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM5cKmcC/22Qy2rDMBBFf8VoXRVZb3nV/yhd6DFyBImdSo5pC
 Pn3ThJITclCiyvmHObOhTSoBRoZugupsJZW5gmDfOtI3PlpBFoSZsIZl8wxR5dj48o5RoWMLOb
 MAzBNcPxYIZefu+rzC/OutGWu57t57W+/LyRrT9HkgjAgBRinPoI/70uo8B7nA7l5Vr5hOduwH
 NksAPEIqjfiBSuebI9vwwpkg/YaXJJBMf2PvT4KVfg+4UmWR6u/iwzdc50K42nvsSkt4zRXSDT
 5xVNjwXirlMZaA1ZAX/ANKNoPZRk61euUQoZshI5WCqu1Z4GnoJSLYF2QLIIwFle5/gIovC+2p
 QEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3554; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=s1Ro2carmg4cdDYn+ZehICRb2kuGKQPQwpxPJuGVnxU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnKlzZUkdB3O+6c2WU7AIDPphi2EEqpayNiq61K
 dPxum6Q7tSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZypc2QAKCRDm/A8cN/La
 hfBWEAC0Axpud9hi76rSoyLVhQ9UTySoxGQfWheUgOTS/1QxUKND9fcPnvhXn7yim/hLYues193
 yloPlBlff+0SBN3y7cDA+J3QL4mdmh0SyM59wVz/E9vakRyLYO30bz/VW/vbuWiCMPAtvUa5Ghv
 Vkb4JKVI14qjUN7LcnQsRQLhPUGPU4MwUreilFAcA2M7hrFKBvVpS3xVy+uUdS7NZQLXyhGGb6c
 mNQxVAd9iVsXLw9/FpvX4jA8LqMIKHOt2cP+04vNSgAxGVF+uvtolBlVWgbNBpbFviCzM+68LdW
 21aXu4Uw5LaYmvptR0EZEx/Dw/Bj4DTnuhLLiDbyz6uk3KpCEoxf7aP21Xwb78fYtL7GIgEqw7A
 d8b9z4XUO0RFZXirZUuhMeGor0TY6QZUMGru1IoPfJ0o9MkYfzPJcCED+BtV9PaI9pkhfdSZsQs
 YlRgl1+m6NR0id4rvTIBA1/b+KyziBjEQ1xplCb3RX0PkJ+UHM4ON4fb+zY2e73IiV4sQF/gOQr
 Vkw60e5XYcz9tnNVhfKxTm0lHHPckn2ydnrOCqSU79RHsaCn6udHszRUOOMYLd7NBLOyFvKIz9g
 OA69lSgvVcIy44DVC6vNkwCyND4t44QIJJ9yUKE+COdrF+ZsUvAYqurKhjPMS3RdzVVEjYJHJSz
 xIf+HUMPdByy2iQ==
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

Patch 3 depends on the regulator patchset available here [1].
This is a compilation dependency.

[1]: https://lore.kernel.org/r/20241008-regulator-ignored-data-v2-0-d1251e0ee507@baylibre.com

Changes in v4:
- Fix write protect value masking when initializing pmbus chips
- Add 2 more write protect forced mode (VOUT and OP)
- Move module parameter documentation to Documentation/hwmon/pmbus-core.rst
- Add pmbus flag documentation.
- Fix 0-day bitfield report.
- Link to v3: https://lore.kernel.org/r/20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com

Changes in v3:
- Ease application and Group with hwmon write protect patches from:
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
Jerome Brunet (7):
      hwmon: (pmbus) add documentation for existing flags
      hwmon: (pmbus/core) allow drivers to override WRITE_PROTECT
      hwmon: (pmbus/core) improve handling of write protected regulators
      hwmon: (pmbus/core) add wp module param
      hwmon: (pmbus/core) clear faults after setting smbalert mask
      dt-bindings: hwmon: pmbus: add ti tps25990 support
      hwmon: (pmbus/tps25990): add initial support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml          |  83 ++++
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/pmbus-core.rst                 |  50 +++
 Documentation/hwmon/tps25990.rst                   | 148 +++++++
 MAINTAINERS                                        |   8 +
 drivers/hwmon/pmbus/Kconfig                        |  17 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/pmbus.h                        |   4 +
 drivers/hwmon/pmbus/pmbus_core.c                   |  95 ++++-
 drivers/hwmon/pmbus/tps25990.c                     | 428 +++++++++++++++++++++
 include/linux/pmbus.h                              |  14 +
 11 files changed, 840 insertions(+), 9 deletions(-)
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


