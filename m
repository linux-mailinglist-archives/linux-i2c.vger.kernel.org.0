Return-Path: <linux-i2c+bounces-10388-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB044A8B18D
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC7FD16C6DC
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B6922B8C1;
	Wed, 16 Apr 2025 07:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+esTsqG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45472221572;
	Wed, 16 Apr 2025 07:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787058; cv=none; b=Hj+has1qX8bNo32mfhiYhCb6jbM/pDQ/NLKEkQcT9xP/qQ1P+p7pA+3MvEm5YwdDGIOW/Bz0xmR1SmDpVVPAwh4+MrkGY48+cAEjtHH0netzwSrJV5yOT2GFRwCZ6EAnFvcoeN/Tyf8WaPE0J+FssVdLkTwbGoxOHCyyg7M9PVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787058; c=relaxed/simple;
	bh=ePHhqI9hu+n6tZEJhbHqhlZGeiDxvd33Qi45kz+hnIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MA7G6xOsbUa99EWoswqKVUaUemErPBEoefR6oatSTIafocHrso3sH5GgwSqKz/+i7Q6IQzX9d5efDbvOAvipl6v4DPpBTpe2l0z++a7iTbgpoagXlx77xf6YWIanaUEclxVL0CnDU1cRtWTdhlSWUmkEuPvN5D151F8T1FyXcDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+esTsqG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744787056; x=1776323056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ePHhqI9hu+n6tZEJhbHqhlZGeiDxvd33Qi45kz+hnIY=;
  b=n+esTsqG69Fd/M4MuDH9cO3PjLg3ZYH1X6URcfV1lG28YxkyYS43nZLX
   29DAP6usOyIN5I1u0LBvKBUxvmukZnGwq8+5YN0ETwCdsK9JoXMCorzf/
   xptLrBcQA+bUbP78Brc7BqVSoo1qZl+0wUwAqxuwsblGctwTkwQpJdOTq
   nkWsCc9fIiYtKNDRqnF13MeIbNNS4hme4VhS7CmAWCkTErIkipU9YBHs0
   jxVGsab8vhaQtfa7X9p4y9JW5MpRzPoaBzm/8z+mr3cIa0297al/ryGQB
   hMHFJornCNU1jfeEyqfExjvSTCiWnlYDrhZUE+3zQ9A/Lb/1ko8GQf5pH
   w==;
X-CSE-ConnectionGUID: UsVUvF5sQpCu0hrMgoUHkQ==
X-CSE-MsgGUID: /u8czRG4Q/GMptLJjYQSgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46241840"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46241840"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:04:14 -0700
X-CSE-ConnectionGUID: tNsrczTeQ7yc8bzHiLZRfg==
X-CSE-MsgGUID: uysz7O20Qgmt2PubSXD42w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131315353"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2025 00:04:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 75885E0; Wed, 16 Apr 2025 10:04:10 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 1/7] i2c: core: Drop duplicate check before calling OF APIs
Date: Wed, 16 Apr 2025 10:01:31 +0300
Message-ID: <20250416070409.1867862-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>
References: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>
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


