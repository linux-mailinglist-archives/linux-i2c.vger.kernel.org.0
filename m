Return-Path: <linux-i2c+bounces-6510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E87E4973D53
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 18:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7626D1F25B0E
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 16:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA431A4F3F;
	Tue, 10 Sep 2024 16:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7K+iKI7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535331A4B88;
	Tue, 10 Sep 2024 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725985897; cv=none; b=KQ1Il/PLSXGU30Drsdxx/s319RmZFnIhUmPEiSDUHHtmGXyBUEEVHzFFyWDvFQlQuLN51n5eJZ75chGoj+jaAMGPopeqNUvUyXa56La1I7cQqaFpk7VUrBEpZQaPDyOkLFDlpmVCm9SSKGBZ9iYJ2V//VIzcQR50fCH4ZG6H6FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725985897; c=relaxed/simple;
	bh=vEW5qV4d0ZwrlZRzn8eAWwa3WaWsA63I80urDlIb264=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIZnIb85DrQ7D7WAU5YpHyiK1hdR629FNUmi333LFxXAJfVnuo6MdxyYWktG8c2aC5UD1IcGS74SBqfeHtRmASqK6H/t6vyABlEwHDX6t6N1s45thMBobrnsQF7VxmsO0A8W1rOZD2WCMEDdHYH84U+LFfbfQcCz4bF+3GnSxW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7K+iKI7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725985896; x=1757521896;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vEW5qV4d0ZwrlZRzn8eAWwa3WaWsA63I80urDlIb264=;
  b=e7K+iKI7YkaQeGfoPsTKFJLk8ITxNU7/lPAglhr26gmqy6o6J6XTRziO
   ULTlbuqSEqVYSkVBvqaZqOgOrhI9KCNK/6Vy0eYHRsII4yzT/C0R4qcCx
   ObPsfIcNZ9rkq07j3h06V9IsEu9jajpPAbytKxJB5zp+IyqF8KqSUZx7r
   vqh9CpQVrTXruERnCwPDHBSlFd914xww8N6oiKAmHXD5EpOefzEb6P00a
   kWrvwMrlDT23vhGGrzKOYj7LJPIeZ8JWtSnknByGSbcCB5OBvpy9l4h1G
   JOwZfdwIc/CjzcP0aTU1RtnyqlH3jPivtpmIFEFzl2eZsfIy1J4TPlRpG
   Q==;
X-CSE-ConnectionGUID: G3HTaWKTTn6xTNM7028qtA==
X-CSE-MsgGUID: o3x+5lyHQpCAnT9HEdKzpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35341739"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="35341739"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 09:31:33 -0700
X-CSE-ConnectionGUID: z3e9f7hkSVmNU0tmp5TZSA==
X-CSE-MsgGUID: dITHEob3TbGqy1RgwsxdXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="71681501"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 10 Sep 2024 09:31:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E532E20B; Tue, 10 Sep 2024 19:31:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>
Subject: [PATCH v1 1/3] i2c: designware: Uninline i2c_dw_probe()
Date: Tue, 10 Sep 2024 19:28:44 +0300
Message-ID: <20240910163123.2499931-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240910163123.2499931-1-andriy.shevchenko@linux.intel.com>
References: <20240910163123.2499931-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since i2c_dw_probe() is going to be extended, uninline it to reduce
the noise in the common header.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 14 ++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h   | 17 ++---------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index fb65fe6d8122..a6dbccd85565 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -737,6 +737,20 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
 }
 EXPORT_SYMBOL_GPL(i2c_dw_disable);
 
+int i2c_dw_probe(struct dw_i2c_dev *dev)
+{
+	switch (dev->mode) {
+	case DW_IC_SLAVE:
+		return i2c_dw_probe_slave(dev);
+	case DW_IC_MASTER:
+		return i2c_dw_probe_master(dev);
+	default:
+		dev_err(dev->dev, "Wrong operation mode: %d\n", dev->mode);
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(i2c_dw_probe);
+
 static int i2c_dw_prepare(struct device *device)
 {
 	/*
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index c6bd6f65a2d3..1ac2afd03a0a 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -10,9 +10,7 @@
  */
 
 #include <linux/bits.h>
-#include <linux/compiler_types.h>
 #include <linux/completion.h>
-#include <linux/dev_printk.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
 #include <linux/pm.h>
@@ -388,19 +386,6 @@ static inline void i2c_dw_configure_slave(struct dw_i2c_dev *dev) { }
 static inline int i2c_dw_probe_slave(struct dw_i2c_dev *dev) { return -EINVAL; }
 #endif
 
-static inline int i2c_dw_probe(struct dw_i2c_dev *dev)
-{
-	switch (dev->mode) {
-	case DW_IC_SLAVE:
-		return i2c_dw_probe_slave(dev);
-	case DW_IC_MASTER:
-		return i2c_dw_probe_master(dev);
-	default:
-		dev_err(dev->dev, "Wrong operation mode: %d\n", dev->mode);
-		return -EINVAL;
-	}
-}
-
 static inline void i2c_dw_configure(struct dw_i2c_dev *dev)
 {
 	if (i2c_detect_slave_mode(dev->dev))
@@ -409,6 +394,8 @@ static inline void i2c_dw_configure(struct dw_i2c_dev *dev)
 		i2c_dw_configure_master(dev);
 }
 
+int i2c_dw_probe(struct dw_i2c_dev *dev);
+
 #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_BAYTRAIL)
 int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
 #endif
-- 
2.43.0.rc1.1336.g36b5255a03ac


