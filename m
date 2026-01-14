Return-Path: <linux-i2c+bounces-15143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAB5D1D14F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 09:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5427F30383B4
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 08:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D590737F736;
	Wed, 14 Jan 2026 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3PxQqXU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B247A37C0F2;
	Wed, 14 Jan 2026 08:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768378807; cv=none; b=S54qhNBZ+LPHFmsHUmariGbNqnUCHW08lt85zIBC5BklpDn8G4FqhrYgQpYEqQMsFF2D0C7BLE4WtNc+YPJS5YIx8SEY3sVEZXzCdRcRXXoEAOV6oasjxeEjyuRTcm2iDFBAVjV5TdOXl8DizXMG/zXSQqBhFJK1sfuslXh3n7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768378807; c=relaxed/simple;
	bh=pI6spQ4lWxb3ZFYAk7xNvco3VgkGk6QWvy6Hhujh/ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RjT+Uq4UVMmev5LG8M0Dmu+iOyE4mlMQ/Pq0krQ8WD7ROvJCYDdHqc1xsHPCrVppd0Spmqh+M/fR6RuK9aqYD0su+fzkEQrrwL4iLqNw/gB40CCRnnna84bAnHARUnec0sFlapYQE7suFCQ2t/i+kXlN+5ltahi+cLyDPly2Nbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3PxQqXU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768378804; x=1799914804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pI6spQ4lWxb3ZFYAk7xNvco3VgkGk6QWvy6Hhujh/ic=;
  b=g3PxQqXU8EJntXdWQ926MJERatJ9UrfdXRDb7/bRsAgoQXA1bL8fGmqA
   mKL57kNeOMWqX/tZUbl3awyElasxR3WnShJPMy4l3dbQPc8PTRqvpNT5b
   bKOvGQpZKW7hjqCtqJycoU4S84Y9wPAKXPQUyqfhJIzpWa/y1u12HAHld
   BOoTcPGlJSGOvLh9X2XB9P9CVHxhPeQ9TFOmh7uzd2kwFuwMnVn6/h2jQ
   FPDPep/MU8eDRMRFAVnHOdJ/DBBugu+4E7S2xS/s59+6tOUkkoS3wSD6u
   wPlPE5TF78ureA3cqDEZpa/xM2+nDzTwnxGLlSOVJBXBzeDg7f6XWsiw/
   Q==;
X-CSE-ConnectionGUID: ZvJXwFesTKmJ826l5G0fIg==
X-CSE-MsgGUID: +yTtFq7SRCScklyj2mDNbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69757981"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69757981"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:19:59 -0800
X-CSE-ConnectionGUID: Peol8wtRQ4O7jkqHxL8ZGQ==
X-CSE-MsgGUID: rcYNFXQ3TCikkeTzvL995A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204676472"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 14 Jan 2026 00:19:58 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id F0D239B; Wed, 14 Jan 2026 09:19:55 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>
Subject: [PATCH v1 2/2] i2c: designware: Use device_is_compatible() instead of custom approach
Date: Wed, 14 Jan 2026 09:17:51 +0100
Message-ID: <20260114081954.252160-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260114081954.252160-1-andriy.shevchenko@linux.intel.com>
References: <20260114081954.252160-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We use MODEL_MSCC_OCELOT effectively is a flag for comparing against
"compatible" property. Use device_is_compatible() directly to make it
clear.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c  | 6 +-----
 drivers/i2c/busses/i2c-designware-core.h    | 1 -
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 5b1e8f74c4ac..c766d9821975 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -238,14 +238,10 @@ static void i2c_dw_of_configure(struct device *device)
 	struct platform_device *pdev = to_platform_device(device);
 	struct dw_i2c_dev *dev = dev_get_drvdata(device);
 
-	switch (dev->flags & MODEL_MASK) {
-	case MODEL_MSCC_OCELOT:
+	if (device_is_compatible(dev->dev, "mscc,ocelot-i2c")) {
 		dev->ext = devm_platform_ioremap_resource(pdev, 1);
 		if (!IS_ERR(dev->ext))
 			dev->set_sda_hold_time = mscc_twi_set_sda_hold_time;
-		break;
-	default:
-		break;
 	}
 }
 
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index cf0364079b55..10055f0e0ec3 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -313,7 +313,6 @@ struct dw_i2c_dev {
 #define ARBITRATION_SEMAPHORE			BIT(2)
 #define ACCESS_POLLING				BIT(3)
 
-#define MODEL_MSCC_OCELOT			BIT(8)
 #define MODEL_AMD_NAVI_GPU			BIT(10)
 #define MODEL_WANGXUN_SP			BIT(11)
 #define MODEL_MASK				GENMASK(11, 8)
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 2e532f16691b..4e6fe3b55322 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -267,7 +267,7 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dw_i2c_of_match[] = {
-	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
+	{ .compatible = "mscc,ocelot-i2c" },
 	{ .compatible = "snps,designware-i2c" },
 	{}
 };
-- 
2.50.1


