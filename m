Return-Path: <linux-i2c+bounces-10187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 006B5A7E55F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 236FB1894701
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C17206F13;
	Mon,  7 Apr 2025 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euEzV6oW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206AD205E36;
	Mon,  7 Apr 2025 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040988; cv=none; b=jCgaT9vwCUbm5Qsoq4jGKx61pwr+L1Ldai30Lf0uIbwc3Uav+2MoENwrFBCrcZ5BOnstJSCdEIczV3yrn/1QYCPxLKUcOAnJ+OTd1/lJPdM3cX0YhpJOARaKgA1FneS4QAJfq6qWlIOHVnuky3Pc4FEfdG1iNau19U7Atzy0kck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040988; c=relaxed/simple;
	bh=13O5W3bCuiHDF3L9eBsuHmrbVsCq2QcoZklOEK2ib0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdXU2qToU2+7r9BVSKQGd5qm6YZqBkmsH44JWyh+sZ1JdtA7iJdQQ8KX8Y1X80TH4zcHM4oHEqUy4ajlD/a7vA2c1QCUEVfM96/dqnoDA5k0PrC9FH9eTwkecaFyqTU3hCgdh+32TyQUTdhqvjFNa6zTyez2suBdfG88Eoilve0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euEzV6oW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040987; x=1775576987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=13O5W3bCuiHDF3L9eBsuHmrbVsCq2QcoZklOEK2ib0Y=;
  b=euEzV6oWG1obRFuYvuaIngZQafeUekHpe8Mk4fqj7mIoNY5Qn2mY6/o7
   Hco72sIwFQdAB6+1orAQhVfF2OmRQmGRCeA1PxN3OXiNwej1795UsbpND
   NMQcSII4P6uyaTSB8kcghF+PZ+qmqmKwQ+r6u+BJ2C+mKg8nc1iqWE2Z6
   Gi4YmlSUtJzo/PWUmJ8WxM8N9LU+1ZdQUQ+Eygn02sIzItAzJth41W+Om
   0b3rDgeo7g75XQyUPYhj9006unSy22MPTS9JGQwqLwiC8OJ6gx3yCtwV7
   vWsHZkEDQGLdeqsPZNKw3rfaB5kXZGS5IcLVJT1zaeN5TxLvXjVqQVC2i
   g==;
X-CSE-ConnectionGUID: T6sT9/r2RGq6mta7RLgrUA==
X-CSE-MsgGUID: 5jYivJjbQEyW2rvaxS7Big==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45324202"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45324202"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:49:43 -0700
X-CSE-ConnectionGUID: qngkipzXRAaeQC0M+xbcog==
X-CSE-MsgGUID: YxflcNHNTU2os4L0/+YyAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128930033"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 07 Apr 2025 08:49:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B2C6D26D; Mon, 07 Apr 2025 18:49:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 4/7] i2c: core: Reuse fwnode variable where it makes sense
Date: Mon,  7 Apr 2025 18:45:00 +0300
Message-ID: <20250407154937.744466-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
References: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reuse fwnode variable where it makes sense. This avoids unneeded
duplication hidden in some macros and unifies the code for different
types of fwnode.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index e2fdfbdb1bd7..c92badadd47a 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -571,7 +571,7 @@ static int i2c_device_probe(struct device *dev)
 
 	dev_dbg(dev, "probe\n");
 
-	status = of_clk_set_defaults(dev->of_node, false);
+	status = of_clk_set_defaults(to_of_node(fwnode), false);
 	if (status < 0)
 		goto err_clear_wakeup_irq;
 
@@ -1065,10 +1065,10 @@ void i2c_unregister_device(struct i2c_client *client)
 
 	fwnode = dev_fwnode(&client->dev);
 	if (is_of_node(fwnode)) {
-		of_node_clear_flag(client->dev.of_node, OF_POPULATED);
+		of_node_clear_flag(to_of_node(fwnode), OF_POPULATED);
 		of_node_put(client->dev.of_node);
 	} else if (is_acpi_device_node(fwnode))
-		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
+		acpi_device_clear_enumerated(to_acpi_device_node(fwnode));
 
 	device_remove_software_node(&client->dev);
 	device_unregister(&client->dev);
-- 
2.47.2


