Return-Path: <linux-i2c+bounces-5007-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D2C93377E
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jul 2024 08:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69651B22238
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jul 2024 06:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F0417BDC;
	Wed, 17 Jul 2024 06:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFnEf04h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D8318026
	for <linux-i2c@vger.kernel.org>; Wed, 17 Jul 2024 06:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721199587; cv=none; b=L/NHukgn6D5EJ9JKpE3Lm6pq/1GcUgTSHefqGFh8ig4Cqliym6pvnIsyHnW3WmERX6NMcWBB5Z8PbhuCzdNFHT+KBUblHaHMs++lou/u2VKcK5b7j0OAImFB1i1+YE4LjEOI5KnbRm8br5wcFzwCrk5PhIXPRzvuffPxXcR6YJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721199587; c=relaxed/simple;
	bh=7IQEbo7T7xrlY2S7ZXILyf4PPjHKRmECPhteNvgb2LY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BftA6YLc+5xdpt1Uau+sLTq1lDm8M1C3qQ4QCWBzbPBT708De+tmA+/OddmmWqSIazadw0jjjmYNnjg2vIy4k8ZbS9wzVxLAaLoAFq6QqnP3NZKcGBoVOC+20R3QfBxDnlm1yiJkx0Da6n14gQaqIFiagBKlfUchwH0ch/LivWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFnEf04h; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70b04cb28acso396059b3a.0
        for <linux-i2c@vger.kernel.org>; Tue, 16 Jul 2024 23:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721199585; x=1721804385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dmz3S+34QAVzCxydi43+BKxcdmfMU9e38V3Xcuwebvs=;
        b=bFnEf04hHfYswfvqWGjupZtqF4KtSO93KOqJYa4yGTq3QgdlAfwFVHMRlHOrpxagJb
         O1GrnF7NH0ZCNvk6J3hwyZFMWUvtctvz6bk0soEAdjJEljQ1JkZZ+JePKLjOiJKmR0E2
         n3uKzqXTNCCnLwXuo3poNS92ro92L4KwkLp4gpelcehQtsONY+mwaoqBqfyz6QShB0t+
         fBq8FsU0QXRw478cy212sT4O0Hufaqu3bc27OrsOAoEWhHX42fHBdJtO8nyItDJY/9YX
         UNpX1GvjyrkuWVYdRfxFmHnfNv7oyg4AWnNJ2XGSPULJEl7Xudhn9zFxva1Hj7l6vKSd
         d1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721199585; x=1721804385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmz3S+34QAVzCxydi43+BKxcdmfMU9e38V3Xcuwebvs=;
        b=Ogy2IbdQiHz1ZEoSXueBGY+Uy+ZK59FSK+Ww5aEVv/hwBjQO2psSqOCjF9VdR5Fxe2
         Z+wmu7MIj5jYOChVQefBOtqFBckuvAwYVP6/PjaP5YP506aTAA0CK/bt8lvw/asKrH1b
         aoQmaosN0JvG/U+AhHWVYRpg09S+gPfWfCzl27cjfWZIIJB5akONAFWF6tqT0PCAOcup
         PNIHnOdEcGemWQAm0sv6bf0BWXD960NCHCCVk6nLvPS04udGrhCqoM5dAdrbswZosct6
         FycAQ7fb56LUTVWsMqnhjZti3IaMzU6+MTKwMRfKYZBHrBZOj4stPiMnbSpqF6a22UMQ
         TbhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgC6pf2GZmxbJ+BDgcus/4zD01VdY/aPOYj3IVP10f46J5CJ7kTK6C4dXA8TEnSmgweviCNi1I+/yyiToYKUVT0kKvz+1IYWoR
X-Gm-Message-State: AOJu0Yy/j4VZJPS2MGJJ8CFcsfygP1BVOJS/G6Q+mt+GNoWPO4ddQomp
	Iy5PGiRf90ns1gWTcl2kg5X9Ee3qc74MySWpb+IqvzQ8ji/vF+55FiAjNZTC
X-Google-Smtp-Source: AGHT+IHF4SAZR3QpeRf3hyKSxZUPZwRaUD8HWlJhjKTO8x2nGuiBln6Y60yDCcVUiJHLgFOOAdxMHg==
X-Received: by 2002:a05:6a00:3e0e:b0:706:1bfd:4e8e with SMTP id d2e1a72fcca58-70cd8264f7dmr7094948b3a.0.1721199584661;
        Tue, 16 Jul 2024 23:59:44 -0700 (PDT)
Received: from AHUANG12-3ZHH9X.lenovo.com (220-143-226-123.dynamic-ip.hinet.net. [220.143.226.123])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ecc8f16sm7474691b3a.190.2024.07.16.23.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:59:44 -0700 (PDT)
From: Adrian Huang <adrianhuang0701@gmail.com>
X-Google-Original-From: Adrian Huang <ahuang12@lenovo.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	Adrian Huang <ahuang12@lenovo.com>,
	Dong Wang <wangdong28@lenovo.com>
Subject: [PATCH 1/1] i2c: designware: Fix wrong setting for {ss,fs}_{h,l}cnt registers
Date: Wed, 17 Jul 2024 14:59:17 +0800
Message-Id: <20240717065917.18399-1-ahuang12@lenovo.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adrian Huang <ahuang12@lenovo.com>

When disabling CONFIG_X86_AMD_PLATFORM_DEVICE option, the driver
'drivers/acpi/acpi_apd.c' won't be compiled. This leads to a situation
where BMC (Baseboard Management Controller) cannot retrieve the memory
temperature via the i2c interface after i2c DW driver is loaded. Note
that BMC can retrieve the memory temperature before booting into OS.

[Debugging Detail]
  1. dev->pclk and dev->clk are NULL when calling devm_clk_get_optional()
     in dw_i2c_plat_probe().

  2. The callings of i2c_dw_scl_hcnt() in i2c_dw_set_timings_master()
     return 65528 (-8 in integer format) or 65533 (-3 in integer format).
     The following log shows SS's HCNT/LCNT:

       i2c_designware AMDI0010:01: Standard Mode HCNT:LCNT = 65533:65535

  3. The callings of i2c_dw_scl_lcnt() in i2c_dw_set_timings_master()
     return 65535 (-1 in integer format). The following log shows SS's
     HCNT/LCNT:

       i2c_designware AMDI0010:01: Fast Mode HCNT:LCNT = 65533:65535

  4. i2c_dw_init_master() configures the register IC_SS_SCL_HCNT with
     the value 65533. However, the DW i2c databook mentioned the value
     cannot be higher than 65525. Quote from the DW i2c databook:

       NOTE: This register must not be programmed to a value higher than
             65525, because DW_apb_i2c uses a 16-bit counter to flag an
             I2C bus idle condition when this counter reaches a value of
             IC_SS_SCL_HCNT + 10.

  5. Since ss_hcnt, ss_lcnt, fs_hcnt, and fs_lcnt are the invalid
     values, we should not write the corresponding registers.

Fix the issue by returning 0 if ic_clk is 0 in i2c_dw_scl_{h,l}cnt().
Then, do not write the corresponding registers if those values are 0.

Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
Reported-by: Dong Wang <wangdong28@lenovo.com>
Tested-by: Dong Wang <wangdong28@lenovo.com>
---
 drivers/i2c/busses/i2c-designware-common.c |  6 ++++++
 drivers/i2c/busses/i2c-designware-master.c | 16 ++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e8a688d04aee..6c7e331c32cb 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -334,6 +334,9 @@ EXPORT_SYMBOL_GPL(i2c_dw_adjust_bus_speed);
 
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 {
+	if (!ic_clk)
+		return 0;
+
 	/*
 	 * DesignWare I2C core doesn't seem to have solid strategy to meet
 	 * the tHD;STA timing spec.  Configuring _HCNT based on tHIGH spec
@@ -374,6 +377,9 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 
 u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
 {
+	if (!ic_clk)
+		return 0;
+
 	/*
 	 * Conditional expression:
 	 *
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c7e56002809a..68c523d9d10b 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -184,13 +184,17 @@ static int i2c_dw_init_master(struct dw_i2c_dev *dev)
 	/* Disable the adapter */
 	__i2c_dw_disable(dev);
 
-	/* Write standard speed timing parameters */
-	regmap_write(dev->map, DW_IC_SS_SCL_HCNT, dev->ss_hcnt);
-	regmap_write(dev->map, DW_IC_SS_SCL_LCNT, dev->ss_lcnt);
+	if (dev->ss_hcnt && dev->ss_lcnt) {
+		/* Write standard speed timing parameters */
+		regmap_write(dev->map, DW_IC_SS_SCL_HCNT, dev->ss_hcnt);
+		regmap_write(dev->map, DW_IC_SS_SCL_LCNT, dev->ss_lcnt);
+	}
 
-	/* Write fast mode/fast mode plus timing parameters */
-	regmap_write(dev->map, DW_IC_FS_SCL_HCNT, dev->fs_hcnt);
-	regmap_write(dev->map, DW_IC_FS_SCL_LCNT, dev->fs_lcnt);
+	if (dev->fs_hcnt && dev->fs_lcnt) {
+		/* Write fast mode/fast mode plus timing parameters */
+		regmap_write(dev->map, DW_IC_FS_SCL_HCNT, dev->fs_hcnt);
+		regmap_write(dev->map, DW_IC_FS_SCL_LCNT, dev->fs_lcnt);
+	}
 
 	/* Write high speed timing parameters if supported */
 	if (dev->hs_hcnt && dev->hs_lcnt) {
-- 
2.34.1


