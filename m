Return-Path: <linux-i2c+bounces-5103-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5172D945E4B
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 15:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6E28B24154
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 13:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E601DAC5F;
	Fri,  2 Aug 2024 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbPUNuKN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA851BE87A
	for <linux-i2c@vger.kernel.org>; Fri,  2 Aug 2024 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722603726; cv=none; b=qB1vmxzZDZLaaCOIU5pLTHDo2oxEKWqDpesttPiCp3GyZmiplh+B6fhStab+7pPMt0OCc5NUfOeFdObCIYKPQGr/u3Z7fvqLWmnj3HWOGZ6CegYkBVeI6QEZ6Om1juNk6WuVEhO+9ACvWPBsDnJZTfNQqws9DTb673C0UWhwaBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722603726; c=relaxed/simple;
	bh=wpqbe2ygEdF/rDt2hwlQ7Fa+CvhkZPIGmtftaS/+abw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zslp1JpAfKsmXSeCkbS2c3e1YURS7POv/6ROeP8+k8c6G8rxZIuTJtGJA/A3ma1V6VXtrGcZc1b0cKECmz+RAJ3HrS/YDweFmkZuYwV5s3NfPjazauUVH1QwvLcDtbT7Qnvlb8sOX1pwLxMkO5TmanKAWoU8CELFN7Fz5mO1210=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbPUNuKN; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2cfdafdb914so2290901a91.2
        for <linux-i2c@vger.kernel.org>; Fri, 02 Aug 2024 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722603724; x=1723208524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wXfNhMECotM7QYkPwI2HP5RcblTyuqTAjoxasS/u+5k=;
        b=PbPUNuKN3Z2cKc6TJ6GIswZmkkp0dOW89QtlWXqQI76U7VNa5yUHXmRellSNDFzH9S
         1v4Z/zAjm21OON5Xyf7tDHrVTt3bjOANcNCyhSzrHRpOz907CX0nfuxn3mOP2nNyszdl
         C3l52Ae9/HpDxxDLKIY170wVb1n3SCSZz/A1WmCk6SCg773iU6dANVdoqSe9p7uRrYQY
         sz8O0VZveOk2a/qQoWeB5M8+WmN/54G1v1pX0NQz9IpHZHfoEALaYe5JENJOZdCpzIfA
         XdEFRC0LsWtq97OqKdEijL5BoXvHYi+qu+lET4lwAYJLK8V4kMEQqUbdnHEDQ58rw4lL
         OYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722603724; x=1723208524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXfNhMECotM7QYkPwI2HP5RcblTyuqTAjoxasS/u+5k=;
        b=SwWVRbSHrmHbFwB6CC4MOFemJiHyZgv8Re90Bd/CifqJoKBJhQ/cWePVKBpHx/PzUF
         9XQQ+CCeDQXztaLceAECuZk1ninYO8EOvDWOke2sGZMxjKE9bXjJMMUkT65SUMPWyOEL
         Bc9HfdJluKOFLEGT1B4P+77Z2BrnoUI3i92iuGdWgc+Rzt4WH0x3mQ1xmlE/Le2FO9Sm
         /u56P1K2A+SqlegtwciqN7I/8CcZhvlo0YbqhZKBsNJwq5johwgndWZ6yUYZmnQPAuct
         mETfFi1sGvutyM60I2v7ICvNzD6psHX0zfplctVh73JOPKDvVz5mjqfPv45eo7NQ5tDi
         gifg==
X-Forwarded-Encrypted: i=1; AJvYcCUP1823K6973wxOQLK44/nOEZ5QZbq2Q4LBZk9fbpLPOXhWTdH/pZQHkWHxX+eu+CP7YDjP0KM3hSUBHZLv8ppueBcLAAVsu4Wd
X-Gm-Message-State: AOJu0YwnU99SXrk/JRFlVZTzfhZL/GaezXtNsmTIyRtir2xCua9TnmKi
	WS/vPx0XgjSoWfthl1Mg25GXcaCP3oRUBMHADC4F0+dxnyy1fMnt
X-Google-Smtp-Source: AGHT+IEKyrj3tb6PUx/Se+rY956aqrsYEewhQ1CnuuJkUpra9/3qO5ElPBZXykYVLezqegVUNF8gXw==
X-Received: by 2002:a17:90b:1dcb:b0:2cf:db0e:89f6 with SMTP id 98e67ed59e1d1-2cff953db58mr3786261a91.41.1722603723988;
        Fri, 02 Aug 2024 06:02:03 -0700 (PDT)
Received: from AHUANG12-3ZHH9X.lenovo.com (220-143-232-152.dynamic-ip.hinet.net. [220.143.232.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffb36bd48sm1691497a91.46.2024.08.02.06.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 06:02:03 -0700 (PDT)
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
Subject: [PATCH v2 1/1] i2c: designware: Fix wrong setting for {ss,fs,hs}_{h,l}cnt registers
Date: Fri,  2 Aug 2024 21:01:43 +0800
Message-Id: <20240802130143.26908-1-ahuang12@lenovo.com>
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

Fix the issue by reading dev->{ss,fs,hs}_hcnt and dev->{ss,fs,hs}_lcnt
from HW registers if ic_clk is not set.

Link: https://lore.kernel.org/linux-i2c/8295cbe1-a7c5-4a35-a189-5d0bff51ede6@linux.intel.com/
Suggested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
Reported-by: Dong Wang <wangdong28@lenovo.com>
Tested-by: Dong Wang <wangdong28@lenovo.com>

---
 drivers/i2c/busses/i2c-designware-common.c | 27 ++++++++++++++++--
 drivers/i2c/busses/i2c-designware-core.h   |  6 ++--
 drivers/i2c/busses/i2c-designware-master.c | 32 ++++++++++++++++------
 3 files changed, 53 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e8a688d04aee..4160c5e57df4 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -332,8 +332,27 @@ void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
 }
 EXPORT_SYMBOL_GPL(i2c_dw_adjust_bus_speed);
 
-u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
+static u32 i2c_dw_read_scl_reg(struct dw_i2c_dev *dev, u32 reg)
 {
+	u32 val;
+	int ret;
+
+	ret = i2c_dw_acquire_lock(dev);
+	if (ret)
+		return 0;
+
+	ret = regmap_read(dev->map, reg, &val);
+	i2c_dw_release_lock(dev);
+
+	return ret ? 0 : val;
+}
+
+u32 i2c_dw_scl_hcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
+		    u32 tSYMBOL, u32 tf, int cond, int offset)
+{
+	if (!ic_clk)
+		return i2c_dw_read_scl_reg(dev, reg);
+
 	/*
 	 * DesignWare I2C core doesn't seem to have solid strategy to meet
 	 * the tHD;STA timing spec.  Configuring _HCNT based on tHIGH spec
@@ -372,8 +391,12 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 		       3 + offset;
 }
 
-u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
+u32 i2c_dw_scl_lcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
+		    u32 tLOW, u32 tf, int offset)
 {
+	if (!ic_clk)
+		return i2c_dw_read_scl_reg(dev, reg);
+
 	/*
 	 * Conditional expression:
 	 *
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index e9606c00b8d1..3e48f446ce53 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -329,8 +329,10 @@ struct i2c_dw_semaphore_callbacks {
 };
 
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
-u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
-u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
+u32 i2c_dw_scl_hcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
+		    u32 tSYMBOL, u32 tf, int cond, int offset);
+u32 i2c_dw_scl_lcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
+		    u32 tLOW, u32 tf, int offset);
 int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev);
 u32 i2c_dw_clk_rate(struct dw_i2c_dev *dev);
 int i2c_dw_prepare_clk(struct dw_i2c_dev *dev, bool prepare);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c7e56002809a..d3b466592be4 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -64,13 +64,17 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 	if (!dev->ss_hcnt || !dev->ss_lcnt) {
 		ic_clk = i2c_dw_clk_rate(dev);
 		dev->ss_hcnt =
-			i2c_dw_scl_hcnt(ic_clk,
+			i2c_dw_scl_hcnt(dev,
+					DW_IC_SS_SCL_HCNT,
+					ic_clk,
 					4000,	/* tHD;STA = tHIGH = 4.0 us */
 					sda_falling_time,
 					0,	/* 0: DW default, 1: Ideal */
 					0);	/* No offset */
 		dev->ss_lcnt =
-			i2c_dw_scl_lcnt(ic_clk,
+			i2c_dw_scl_lcnt(dev,
+					DW_IC_SS_SCL_LCNT,
+					ic_clk,
 					4700,	/* tLOW = 4.7 us */
 					scl_falling_time,
 					0);	/* No offset */
@@ -94,13 +98,17 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 		} else {
 			ic_clk = i2c_dw_clk_rate(dev);
 			dev->fs_hcnt =
-				i2c_dw_scl_hcnt(ic_clk,
+				i2c_dw_scl_hcnt(dev,
+						DW_IC_FS_SCL_HCNT,
+						ic_clk,
 						260,	/* tHIGH = 260 ns */
 						sda_falling_time,
 						0,	/* DW default */
 						0);	/* No offset */
 			dev->fs_lcnt =
-				i2c_dw_scl_lcnt(ic_clk,
+				i2c_dw_scl_lcnt(dev,
+						DW_IC_FS_SCL_LCNT,
+						ic_clk,
 						500,	/* tLOW = 500 ns */
 						scl_falling_time,
 						0);	/* No offset */
@@ -114,13 +122,17 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 	if (!dev->fs_hcnt || !dev->fs_lcnt) {
 		ic_clk = i2c_dw_clk_rate(dev);
 		dev->fs_hcnt =
-			i2c_dw_scl_hcnt(ic_clk,
+			i2c_dw_scl_hcnt(dev,
+					DW_IC_FS_SCL_HCNT,
+					ic_clk,
 					600,	/* tHD;STA = tHIGH = 0.6 us */
 					sda_falling_time,
 					0,	/* 0: DW default, 1: Ideal */
 					0);	/* No offset */
 		dev->fs_lcnt =
-			i2c_dw_scl_lcnt(ic_clk,
+			i2c_dw_scl_lcnt(dev,
+					DW_IC_FS_SCL_LCNT,
+					ic_clk,
 					1300,	/* tLOW = 1.3 us */
 					scl_falling_time,
 					0);	/* No offset */
@@ -142,13 +154,17 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 		} else if (!dev->hs_hcnt || !dev->hs_lcnt) {
 			ic_clk = i2c_dw_clk_rate(dev);
 			dev->hs_hcnt =
-				i2c_dw_scl_hcnt(ic_clk,
+				i2c_dw_scl_hcnt(dev,
+						DW_IC_HS_SCL_HCNT,
+						ic_clk,
 						160,	/* tHIGH = 160 ns */
 						sda_falling_time,
 						0,	/* DW default */
 						0);	/* No offset */
 			dev->hs_lcnt =
-				i2c_dw_scl_lcnt(ic_clk,
+				i2c_dw_scl_lcnt(dev,
+						DW_IC_HS_SCL_LCNT,
+						ic_clk,
 						320,	/* tLOW = 320 ns */
 						scl_falling_time,
 						0);	/* No offset */
-- 
2.25.1


