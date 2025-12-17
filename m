Return-Path: <linux-i2c+bounces-14618-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1823ACC641E
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 07:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B7A5300A8CC
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 06:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B0630C631;
	Wed, 17 Dec 2025 06:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8sKF/T7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC3030B536
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 06:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765953050; cv=none; b=W+orsBYEB/+44ElbVOuPjcUSGJulg2jV6WETIpeEkNLOOhFMuw05a9RV9uf8KNOpG/omhVcPHsWvtF1ILKDc+or1GyLfXRz6OE0RHm4lPiFEFobKbnXcip4or7b96lGrIMI8bzKKWmFPVS67XNK/cESweyD4RiQbV6iqJ7qx0IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765953050; c=relaxed/simple;
	bh=m9lGFFqXYj//oKEcp7wu52ulCezQ86DMkY+pBK1RPiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOe6gCPLZMs3+XtPv58T9+zz6b/k1jAHjcrLQbUO1ZB9Qq0Rpor8GGv2QUD9+8P+vvW7Q6cSJrmhaO86B6yqkGgS6cGRBHywQ9gQ3R8r73TACO1ZkIE9HaorFpBGNxX1lh6jLF6dlU8XCW8A/FLAuLfXM0EmTgxBLlPWjz56pd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8sKF/T7; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34c708702dfso3419468a91.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 22:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765953046; x=1766557846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up+MXp1S73xUe3fM3leG5ONITobzvQqFUKCH5Mxa1ds=;
        b=i8sKF/T77ClP38RoZ2yWcD/nIX54C4q4xL8vFNsedbueam0RT9OhNXLOnREMqGYHRV
         e2gDIi6VoYZ2vwCtE6b9Oyau8omdfkG2h2vrWb/tExGOIv+yKvnpluNGUiqeFjPWAP/G
         niiFEGbKIsoPTw6an3/YmsCIc2XaIbcWLfrmuy9kVYs8142NOmr+DR3zcpdfM2c0XLKG
         7D3OJljjiqwC6NkmK5xZKpLsxR4vp/G0uwS4YF03xTFMcqLUgFSjSF9y472TTzL9UkJV
         72ZWEcwalZoqLSpGUj0k6NP9SrpfGFnLunpmDPbsn3nDyz+8gP0Ulrqn8t+O2/KMBgKr
         Y75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765953046; x=1766557846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Up+MXp1S73xUe3fM3leG5ONITobzvQqFUKCH5Mxa1ds=;
        b=V8E9RBtOrlRDKPOT/SZSNPyl8NQB5xenoc/R3/IftJLgZIbC1TD4YF5V3ZFc8dTfUR
         u94FlOQb0x4J5GaMgXFiUmd1V8TtCfgKm14JIl25fVY3wOo7/+93Y22CFMMygk/K9dqO
         wpzbxB2MLIybSuVGS3pbRxOD/93R0bArRjGaxQEBNTRFN1740o0YzZAY6cUqBVHmuOqu
         LZzOnVWI6DrLzBVGM3CwaMhm8MR7kv3AGwHcnBXlCHqfDK3pcAx1GhRW68RjKMRcmJ0l
         7vIh5hCw3BVnkaUv0E3Esp/WZqnHIhEeo0VO1G6jlTr5bNPrL0uYTg2al6jfnbBxThxT
         zRiw==
X-Gm-Message-State: AOJu0YzrK7PlbV0k2CLSsljkz52hHXN5NgZz1M2GPZxGgU0Ue8a8oK6V
	e0jQKNyHpiRBrutt/T9Byvc/gpn2ewFAZnd01UD4Tq0b754DFIPe2cauofZq5w==
X-Gm-Gg: AY/fxX4868Zb4mrA/iQz5+8mjimi8vKZoIDOwYUVOX4YBGYGGBEvumpkMowkaUSt4lz
	4ERMYyBk188j7C89zsGCgTkV+kVaA4JeO34fpNMjRDoR4IAYXsd9tALZeItHQnvNZbnAOay1Ejy
	VEAV7ExoUkqGMmkzmQYpAIDRCArPQGPD/nZ2xKzvuN2vlfdMl7YxOc2iBak5jdljXyTEo/FbtoY
	gT2BXaxkFGZoxXMyv2biJeECQ/VlgAuT7PDBSHQQcJkAea+B6Ev/ZXsAR5GQ5m0yj0P6F54e3Ov
	osiMh8yd3hyKj2IDDb9wFAwB0d8IbivJBWH1MVGgZP0oDwVs/SqCcOCgCBo34M7eipNgpE7PmR6
	FThIzFelNRkG+MCFfQB4AuJFC46R9FET9/uelbDlb1CJdM0Efr0A4i0ukaA==
X-Google-Smtp-Source: AGHT+IGMDEj9S/3j4e2k+6y4PBuznFhugbi5r257/hfwvZzCF0c0qd5zPSpDnkWcRNP70gnlMkCDSw==
X-Received: by 2002:a05:7022:98d:b0:119:e56b:9583 with SMTP id a92af1059eb24-11f34bd9048mr13515132c88.8.1765953045757;
        Tue, 16 Dec 2025 22:30:45 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::c20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm61585357c88.1.2025.12.16.22.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:30:45 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] i2c: rtl9300: remove const cast
Date: Tue, 16 Dec 2025 22:30:26 -0800
Message-ID: <20251217063027.37987-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217063027.37987-1-rosenp@gmail.com>
References: <20251217063027.37987-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These casts are used to remove const for no good reason. Fix the types
instead.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/i2c/busses/i2c-rtl9300.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 4723e48cfe18..f2aa341a7cdd 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -129,7 +129,7 @@ static int rtl9310_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
 
 static int rtl9300_i2c_config_chan(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan)
 {
-	struct rtl9300_i2c_drv_data *drv_data;
+	const struct rtl9300_i2c_drv_data *drv_data;
 	int ret;
 
 	if (i2c->sda_num == chan->sda_num)
@@ -139,7 +139,7 @@ static int rtl9300_i2c_config_chan(struct rtl9300_i2c *i2c, struct rtl9300_i2c_c
 	if (ret)
 		return ret;
 
-	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
+	drv_data = device_get_match_data(i2c->dev);
 	ret = drv_data->select_scl(i2c, i2c->scl_num);
 	if (ret)
 		return ret;
@@ -372,7 +372,7 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rtl9300_i2c *i2c;
 	struct fwnode_handle *child;
-	struct rtl9300_i2c_drv_data *drv_data;
+	const struct rtl9300_i2c_drv_data *drv_data;
 	struct reg_field fields[F_NUM_FIELDS];
 	u32 clock_freq, scl_num, sda_num;
 	int ret, i = 0;
@@ -399,7 +399,7 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2c);
 
-	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
+	drv_data = device_get_match_data(i2c->dev);
 	if (device_get_child_node_count(dev) > drv_data->max_nchan)
 		return dev_err_probe(dev, -EINVAL, "Too many channels\n");
 
-- 
2.52.0


