Return-Path: <linux-i2c+bounces-10180-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96697A7E55B
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD656167411
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708A1204C06;
	Mon,  7 Apr 2025 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnF4E2Nu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C37C205510;
	Mon,  7 Apr 2025 15:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040985; cv=none; b=PETvohfkrUkjnBIPksnGNx1Uz99wxogVZLbTwah0mbQtlAusG6TJOOzxP4HlD9au4f3T8oUcNARabP6UfNPtmm+cD6FVt0gDVSCBwBSL5tJQphvi0bFY2LXotN2P9gmILyqEc4r8vrK2izeXBBtlGrBc2JOTQfWjx4RQ49lrljk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040985; c=relaxed/simple;
	bh=3N5xhAJtcv+s+42TO+Ggslov0UqddXqYUdb1cV/oLxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uyJKGaVgL/UZ9Mk1RTZoZBOslfH6M5NyjxPoPEvWWIPR+EnoBReT4Du1ReXWmWXbilSAwwJ8AxJ96DJoJoQHQ902y7cvnO7WGk3Dw9HWlKeON6o51FTF4+zqHSuquwW29o60wjmQzC1pnISb0UhSXTT7HjXcxs4WXsHB3CXg9h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnF4E2Nu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040984; x=1775576984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3N5xhAJtcv+s+42TO+Ggslov0UqddXqYUdb1cV/oLxQ=;
  b=YnF4E2NuHpalGiDDrxmC0cwBbEiNYcG/Nj6HWBcU7tW9m99mu8U07xRk
   wavqVU3U6NhLGjvhFA4z0+nRM+0SNIN//MpSf+XiTPbwjF54OdSShM4x1
   K1wDkRQ/j2YWr5Z60cCVR0ojhLqlZPwojJHhfHS4SI6c6osQnIaaAj90U
   t1AXTaAL7YNb6XnzGtv4APdu6VkNIDX9U9lPKdrASMXXW/jRp+TztFRbK
   6Sl2iUl9HghCZ0f5VNHDJPWw6HjImCouVufJwmJlyk2QxZmK3sxcHqzt3
   pRJ+YDKqr19NMJuSwoW3GJHn2oy+sOEPfjzv+JaZQfAbaAEZJTIat/8Q+
   Q==;
X-CSE-ConnectionGUID: Wdd0m1dgQH2phc10UdDR7g==
X-CSE-MsgGUID: tFTkBbxoTG2KXHy5Z/jMcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45324192"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45324192"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:49:42 -0700
X-CSE-ConnectionGUID: eWi+iBCzSVq2zg0UBnnUDA==
X-CSE-MsgGUID: YtEbRmUaRK+5tM763e/CvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128930031"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 07 Apr 2025 08:49:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 922DCE0; Mon, 07 Apr 2025 18:49:38 +0300 (EEST)
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
Subject: [PATCH v3 1/7] i2c: core: Drop duplicate check before calling OF APIs
Date: Mon,  7 Apr 2025 18:44:57 +0300
Message-ID: <20250407154937.744466-2-andriy.shevchenko@linux.intel.com>
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

OF APIs are usually NULL-aware and returns an error in case when
device node is not present or supported. We already have a check
for the returned value, no need to check for the parameter.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ebda3926acf8..0d850d425734 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1213,11 +1213,9 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
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
@@ -1655,12 +1653,10 @@ int i2c_add_adapter(struct i2c_adapter *adapter)
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


