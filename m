Return-Path: <linux-i2c+bounces-10326-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF8EA87CD3
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 12:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6263F16CD6B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 10:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13F3269820;
	Mon, 14 Apr 2025 10:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPwcXMBh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D868C25E47F;
	Mon, 14 Apr 2025 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625062; cv=none; b=Ezu6x0muM6JfT9fCQoZhE6Q9VFWe0k+ZUw5L2vM0BGzVML89W09iUOdoBb5vJ10VcQj1fwUTeNdhC6GlWio+rKb2xon0YYV/j4/pB3oiPZ7fZD6dwucam5er+IOHFPpp7+N3PGylTxU2NmAEGfFwJicUTPEwnTwOwCfJA3+eVsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625062; c=relaxed/simple;
	bh=ePHhqI9hu+n6tZEJhbHqhlZGeiDxvd33Qi45kz+hnIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDYAUsfFhKk2vjNddu/uHDFguRYo27I5eHFX6yDaEdwCEYNfjBLHVIeDzQ9o3JYZRkyLE42/M6QechpUJS8zhw9EEcPaFGEimIuSOuv6LVEg+escGfanS4MtZVMcF3F6nHUQAzmZBLQRBchVlNgpID18IiJdQqRbkLY4tpL1g8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPwcXMBh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744625060; x=1776161060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ePHhqI9hu+n6tZEJhbHqhlZGeiDxvd33Qi45kz+hnIY=;
  b=CPwcXMBh/CDz2zskngxx7D1QGm6rBucDk3APy6w3rB7uhU44IXILZGWW
   1hbG/jwOSAGTYE+x7k2PdjjXVr8XE1LwuoD+kZScFsRe+7raKurpKJA1H
   /cfg/sujOwyN+gcb0IFRghPSx6hYIr2Asu5Awnkrs06nK8jMbwxa/9IfH
   44fOLAZYS6YrNDt3fk+LVipq66Z8ucd1XP/V+Be3CHm+VjOYnz7N+26VF
   ILPVlW63wsAyhvwmsSzyOBiy6ppHpUkSb/HA8XQ+TyXhRvRYFL0pX25cM
   jYijFhhGw3VWipmzl7NYbz8kYCobNt9DyMknNlDTnZDAc4HNyqQO9tTcB
   g==;
X-CSE-ConnectionGUID: y2j4/SR5SR2nnDFMRPmVqQ==
X-CSE-MsgGUID: vQ8VGCfuQJqV1SYb8F566Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46177062"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="46177062"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:04:16 -0700
X-CSE-ConnectionGUID: KvEKAKpeQ9uggmWlMc+kAA==
X-CSE-MsgGUID: yGcfJo0KQHG2EQg6V62NgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="130100420"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 14 Apr 2025 03:04:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CD9E920B; Mon, 14 Apr 2025 13:04:11 +0300 (EEST)
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
Subject: [PATCH v4 1/7] i2c: core: Drop duplicate check before calling OF APIs
Date: Mon, 14 Apr 2025 13:01:51 +0300
Message-ID: <20250414100409.3910312-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OF APIs are usually NULL-aware and return an error in case when
device node is not present or supported. We already have a check
for the returned value, no need to check for the parameter.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7ad1ad5c8c3f..c14ffd6190d3 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1209,11 +1209,9 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
 	u32 addr = default_addr;
 	int i;
 
-	if (np) {
-		i = of_property_match_string(np, "reg-names", name);
-		if (i >= 0)
-			of_property_read_u32_index(np, "reg", i, &addr);
-	}
+	i = of_property_match_string(np, "reg-names", name);
+	if (i >= 0)
+		of_property_read_u32_index(np, "reg", i, &addr);
 
 	dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
 	return i2c_new_dummy_device(client->adapter, addr);
@@ -1651,12 +1649,10 @@ int i2c_add_adapter(struct i2c_adapter *adapter)
 	struct device *dev = &adapter->dev;
 	int id;
 
-	if (dev->of_node) {
-		id = of_alias_get_id(dev->of_node, "i2c");
-		if (id >= 0) {
-			adapter->nr = id;
-			return __i2c_add_numbered_adapter(adapter);
-		}
+	id = of_alias_get_id(dev->of_node, "i2c");
+	if (id >= 0) {
+		adapter->nr = id;
+		return __i2c_add_numbered_adapter(adapter);
 	}
 
 	mutex_lock(&core_lock);
-- 
2.47.2


