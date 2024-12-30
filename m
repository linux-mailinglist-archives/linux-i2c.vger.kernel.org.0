Return-Path: <linux-i2c+bounces-8838-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE809FE8D5
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 17:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BF2F1882ACA
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 16:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896621AA1FE;
	Mon, 30 Dec 2024 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3TosvWTl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F71AAA1D
	for <linux-i2c@vger.kernel.org>; Mon, 30 Dec 2024 16:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735574406; cv=none; b=AiUdxVeHyw4/tjvFFhAQRwBcMihkPdDf599fRryKnnvbJOZ3Id98zAIbo1BjPemgRoxC7c3TJpnKT3obi+KMK+rqzyL1evHCUZOlzzWODR2XjMdabGqKjkbYzr/QeFsrbC3D6b0yUqUFcSQeAu9Y4jEnRfiiiTAAg58Skq4b4AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735574406; c=relaxed/simple;
	bh=e5pa9zm/IDPD6ojXEZScjQ8sMVk15k4rJMivCJ178Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m8pZ2e9XFbBxcGT5Jpn5fHgmf+M0D0I7OVfPCpxX+igwOANDuRFS+OGDkddzRT0Rw1jE9dRub7gGvbltaTARHsmJWli4Km+5SRslCePsuGW2Up6ujazEGud0YvyW0kVLRV1MVvLsB9Jctbi8zcmI9h8xuoFwtLubFRoRogD9TBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3TosvWTl; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aabfb33aff8so1619569466b.0
        for <linux-i2c@vger.kernel.org>; Mon, 30 Dec 2024 08:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735574402; x=1736179202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TCXX2yJLWj9ThSdd+lMtqSTGbzNmb973OvmHPhSe13Y=;
        b=3TosvWTl5QdFnw22FtkzmpYB7g4TfQE+Eot/fLDiUDUGDIJ+53Ofpd6FoTwqoFtxSD
         rK2niwMzvNrFLZ27Y28V08xYHAPNH+qxzFmdRxkYaxhuwHB1MMJTFtb+cR9YKVHiOQNM
         /r/JHhyYkfMmxpXGKfU0Kp4xPh7WHIokvh3JJeDOpjuQPri8A3dKh2icYWRwIgGhuafF
         1yqbew+LcWdMd03vskIwWOQXRjLY0G65JLfYhOPcspthCKiwcuWLemzHTayojc313MXP
         sDBe8fmpy50F8UE/Mt+DdfpjTXdKtqyN9iZCFUKTlpqu95q+T9bwbv2Zsyj0B5L9tlYh
         5BjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735574402; x=1736179202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCXX2yJLWj9ThSdd+lMtqSTGbzNmb973OvmHPhSe13Y=;
        b=jhiDWXZTVsPzVqMetL3L1Tza/q60qmvUgmqvyOU2YmVVUiZxFYV9yYcAWhod2vmdPX
         BDXpFe6oLsApmFkPgk+exN+rH5WbTnkEHixn+Yq3fayFxghCcEtMvL7KNFWpB9zmEXWf
         xVpx5rwE/tElCLhvmkTAUv95Ixya+o3SQS8kZlwDiBLd/yrFNhaBtArKMCNlJC5hd/hA
         EIt/pcgCH3xEWwstSbXjnIFw29IP1eefqo8w0LS8qNOJJZz7d1vIPlFpE4P7D10aPd26
         0+m6OQGdF5EHg+UHYCsx2fg8wdTykYpavssDl20TK0adDM4qrgKn8SEoSCX2V62f8Uvv
         TVAg==
X-Forwarded-Encrypted: i=1; AJvYcCXHEmISdh7fLjgnzeqGBALE6w0SMbpaOXx050a4a3U28vmewAxP1ngCuD1CwGViagglrFV8uvYxjhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzCUsxzOX9yufmtDS+Bo1BiKIhQoK6Lb4tpXwH1QPU5m5mDGJl
	8MC7WjNFtFW0YeniyTJl7bDDTPHMucK91lgtYG/3NBHzjxBvo4PhTx/MJzY4lfQ=
X-Gm-Gg: ASbGncsUZ4jCTUnrN1oGrvxYG8pz1bJXBw96heJMDjkompT8L1piNRrmGnvjWPhq5Um
	ZRAndYpF8sNtBSV+3+x2qKOs5xQJcIUsVIEyf++zTRvkL0t8O6Q/5W4iyf3wEk0s3CkPMqi2yXt
	vLxKBEzcu2UITDrk7S0GEKOW3Zb0wcA3JdpHf7t4hVSumOnRx7Q6Lp8WRnruMzmiruRFeihTx92
	QbVgciWq+/I9W0SuNntpXQnPfS7mjJBbvCicuCNiwcXRd9vua9tCEJINEeY+itetMb4RvIr++p9
	tHISD35wtA==
X-Google-Smtp-Source: AGHT+IFCIH4sn41HQmYmDRm+g00lWH6lqDxFRyKMkiMzRjxmD8u8PYxihE/16RAw/A+An+k+dXV1RA==
X-Received: by 2002:a17:906:6a21:b0:aab:edc2:ccef with SMTP id a640c23a62f3a-aac080fe36dmr3284047966b.2.1735574401937;
        Mon, 30 Dec 2024 08:00:01 -0800 (PST)
Received: from localhost (p50915bc6.dip0.t-ipconnect.de. [80.145.91.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf69b4540csm75036466b.159.2024.12.30.08.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 08:00:01 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2] i2c: designware: Actually make use of the I2C_DW_COMMON and I2C_DW symbol namespaces
Date: Mon, 30 Dec 2024 16:59:49 +0100
Message-ID: <20241230155948.3211743-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2860; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=e5pa9zm/IDPD6ojXEZScjQ8sMVk15k4rJMivCJ178Zg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBncsN1F5WHq4nUsdvUCtLkXSGpq9UcG+l4EtwNn dkk3gwWFo6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ3LDdQAKCRCPgPtYfRL+ TvSyB/4mnrQ5DxXv36Fm4O1cUI78s1wS3B4oym4rzdPUM8LUos5e7umSORYPKXD9YLt05XuoTyC aEgA9QjQoEyYVGfme8OX4JlPyjs7eP8wOYgkTB/U2fbTgtfzEM+vtkX77ehfWjGcV4LiHRWPtc6 wZbo28pLNs2CvQqJpTy6wmaEBIO8dDR0PHbNKDx8TEZC406to8b9K4/vq2IW4jl8kCLXyt3c5Hd G++sDTqyZjjVRkD0KapkIjG+VAv99D516FqssaW+q9jeYfpJjRXOie5HzXpA2eucJHg9LN/O/8W yJQCgVp2YlpTxqYWzoS5Xd0AGzqC/5LYPKU+8e3NRYkAkJ4R
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
is included. So move the define above the include block.

Fixes: fd57a3325a77 ("i2c: designware: Move exports to I2C_DW namespaces")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

Changes since (implicit) v1 that is available at
https://lore.kernel.org/linux-i2c/20241203173640.1648939-2-u.kleine-koenig@baylibre.com:

 - Also fix drivers/i2c/busses/i2c-designware-master.c
 - Make added line breaks consistent

 drivers/i2c/busses/i2c-designware-common.c | 4 ++--
 drivers/i2c/busses/i2c-designware-master.c | 5 +++--
 drivers/i2c/busses/i2c-designware-slave.c  | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 183a35038eef..8eb7bd640f8d 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -8,6 +8,9 @@
  * Copyright (C) 2007 MontaVista Software Inc.
  * Copyright (C) 2009 Provigent Ltd.
  */
+
+#define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW_COMMON"
+
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -29,8 +31,6 @@
 #include <linux/types.h>
 #include <linux/units.h>
 
-#define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW_COMMON"
-
 #include "i2c-designware-core.h"
 
 static const char *const abort_sources[] = {
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c8cbe5b1aeb1..2569bf1a72e0 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -8,6 +8,9 @@
  * Copyright (C) 2007 MontaVista Software Inc.
  * Copyright (C) 2009 Provigent Ltd.
  */
+
+#define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW"
+
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -22,8 +25,6 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW"
-
 #include "i2c-designware-core.h"
 
 #define AMD_TIMEOUT_MIN_US	25
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index dc2b788eac5b..5cd4a5f7a472 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -6,6 +6,9 @@
  *
  * Copyright (C) 2016 Synopsys Inc.
  */
+
+#define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW"
+
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -16,8 +18,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
-#define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW"
-
 #include "i2c-designware-core.h"
 
 static void i2c_dw_configure_fifo_slave(struct dw_i2c_dev *dev)

base-commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
-- 
2.25.1


