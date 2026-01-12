Return-Path: <linux-i2c+bounces-15051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 191A0D12C5D
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 880143054B13
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88302359F96;
	Mon, 12 Jan 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PiEThbjn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102193596FE;
	Mon, 12 Jan 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224233; cv=none; b=ToDieI++8UJ54o5HXo3BVy/DmcieJ02VSi4JybecSG0PWmLWLecJHt4tmICKjSzeGtx7RQFCzuMEMzi+1+exnKGkSkjxYIfOPLSofI1W76H4iui2JYal5Txz1kagbW+21s6qkK2v4PRW510awdxYzdKfnbcx2gY8wT+5kLQKOIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224233; c=relaxed/simple;
	bh=eG2etpVKFnB08jm2KUL4PZFJ6ZvA17LhEazw7WLaYEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbjFN9wWq/R0Kstc+ocVQQ+TlAKkzPIWfOzWgl50L3B+zNytfig3tUdEm1ejfpN0zqrIZrjKI/yBGvrjBjDR8gafgaPlFWT4IV2w637L3ChrqifgNe04l1I5A/t6TQ64R2y3ilA3NN78iLIIuuBBi/gPq3v0O4eg5WCbw22obeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PiEThbjn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768224232; x=1799760232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eG2etpVKFnB08jm2KUL4PZFJ6ZvA17LhEazw7WLaYEc=;
  b=PiEThbjnBNmCCf/FbGn207BW5zStSIi1G8abMNAEoQM9OQm+tEKkEMpQ
   HacYVXQtezMXtATTNjSaIp9uBRwXWCTpi4R5JhlhgxtEBXMvSw9LDy09k
   3GKL44pZwc1IbJJvVbs23o+zi7+W10Ec4FdCb08/Dbs3zscqwKTKfpBAi
   QJcpflcn65gHRiX7TTgjaJp/jB2xsK9nTVnRiqgZixdlKFySHRyBG6Z/E
   73zQTmJjPcf9/Fvv179qokzZPLHn3T/HrcW/REw+A+02vdyT2bMx82EMD
   YTEzjyYSAXlBBDZaZbGqS6Olh5VHoEjApKLvfUG5sykUukLlERkliwH84
   A==;
X-CSE-ConnectionGUID: tls5zGWISfOM5t5UZBg5MQ==
X-CSE-MsgGUID: 3VXN6uwVRuiB3HFtkQuZqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80602710"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80602710"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:23:50 -0800
X-CSE-ConnectionGUID: fUMVAzaUT2qxtGwcEXhoEQ==
X-CSE-MsgGUID: Iyss4sbyQhapASZpu0NZYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208563189"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jan 2026 05:23:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id ABA3699; Mon, 12 Jan 2026 14:23:47 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] i2c: core: Check for error pointer for fwnode
Date: Mon, 12 Jan 2026 14:22:40 +0100
Message-ID: <20260112132346.4087258-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112132346.4087258-1-andriy.shevchenko@linux.intel.com>
References: <20260112132346.4087258-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Theoretically it's possible that fwnode is returned by some API,
that may return an error pointer (and we have, for example,
fwnode_find_reference() which does that). If such an fwnode
is supplied to the i2c core APIs the functions will perform
unneeded loops and checks. Avoid this by preventively checking
for an error pointer and bail out immediately.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae7e9c8b65a6..41c2e46ffb24 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1090,7 +1090,7 @@ struct i2c_client *i2c_find_device_by_fwnode(struct fwnode_handle *fwnode)
 	struct i2c_client *client;
 	struct device *dev;
 
-	if (!fwnode)
+	if (IS_ERR_OR_NULL(fwnode))
 		return NULL;
 
 	dev = bus_find_device_by_fwnode(&i2c_bus_type, fwnode);
@@ -1875,7 +1875,7 @@ struct i2c_adapter *i2c_find_adapter_by_fwnode(struct fwnode_handle *fwnode)
 	struct i2c_adapter *adapter;
 	struct device *dev;
 
-	if (!fwnode)
+	if (IS_ERR_OR_NULL(fwnode))
 		return NULL;
 
 	dev = bus_find_device(&i2c_bus_type, NULL, fwnode,
-- 
2.50.1


