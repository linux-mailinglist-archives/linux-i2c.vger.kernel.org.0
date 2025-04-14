Return-Path: <linux-i2c+bounces-10329-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F00A8A87CEF
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 12:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AD033B656F
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 10:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1FF26AA9D;
	Mon, 14 Apr 2025 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ey7jBXhR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E8268FEB;
	Mon, 14 Apr 2025 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625063; cv=none; b=Al93xOobnFoM50YtAj+53kseoybGryBNEIW1bwWYUpabjZvwXNKQja2jLPcvNOyUnnaVuLF1Fj9yF4JRVSIdSyAtOuHfLk89JyxOxeYQi926GZuUjl9aP7UFNoE+YMkgFi7vNcehRfejc9S4ouoWwon1bc3VnyOM/3u7l8aWCqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625063; c=relaxed/simple;
	bh=9vMgAE98MYpRnIk0gMgMO6YcMvJ1BWiMDswo9m1ORFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDOGKZsINcINThL6vY7d8AOQuc1ExlF23sMeKhYsl/MkOOjSUZ0iKOd1Hsi7Fv78zN2col2hdwNvmstbbGT9r9l1LuoL12UWK0LAbdV3YgHdaPVMlvheHjqT0gb2g8RLeYtu3/+by44pS58LWM5tnyKYCGtaTQLz/GKyOTAaQvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ey7jBXhR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744625062; x=1776161062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9vMgAE98MYpRnIk0gMgMO6YcMvJ1BWiMDswo9m1ORFw=;
  b=Ey7jBXhROcxCOL2twLR9HrCikJSl6zAvf3zpeu8CjwHup5lQcXLrpmLc
   7buyjpDY/Rf57D/EFfsiBR0LHtAay0nfEszRcb3SXMbOx7ZNl/iYY9qNn
   XWpEPyDiIwbBKu4gCHUC5CZOk0Uz33O9MUsF/RiIY5KXFqG8eH6E4MzQA
   mUEWs6zSxFAvzWspfNxe9+wI5nGu4VT+upV/8RrUcD/Fp+pB8PNxNzWC/
   gtnvryQdlR+N+00532VVVJmNON+4AHjuQ2vEywMp8Sdw0Zd8BGRI5LTqB
   ZM8cdRiRPGIvtUMUIfX1sTw0LAMeMlGAfpNpLgJcZmw3wyDMk1uhFmytb
   A==;
X-CSE-ConnectionGUID: vlY67s++RG+cGZvXGXopzg==
X-CSE-MsgGUID: xU9tYnfWTtO/dBr+Lr09cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56747141"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56747141"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:04:19 -0700
X-CSE-ConnectionGUID: 3S7uPp+oRnix1ZMQDCtjdg==
X-CSE-MsgGUID: 265FqWCZTi+vIEs2TedQKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134747329"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Apr 2025 03:04:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1AD21B0A; Mon, 14 Apr 2025 13:04:12 +0300 (EEST)
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
Subject: [PATCH v4 6/7] i2c: core: Deprecate of_node in struct i2c_board_info
Date: Mon, 14 Apr 2025 13:01:56 +0300
Message-ID: <20250414100409.3910312-7-andriy.shevchenko@linux.intel.com>
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

Two members of the same or quite similar semantics is quite confusing
to begin with. Moreover, fwnode covers all possible firmware descriptions
that Linux kernel supports. Deprecate of_node in struct i2c_board_info,
so users will be warned and in the future remove it completely.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 2e4903b7f7bc..cc1437f29823 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -405,7 +405,7 @@ static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
  * @addr: stored in i2c_client.addr
  * @dev_name: Overrides the default <busnr>-<addr> dev_name if set
  * @platform_data: stored in i2c_client.dev.platform_data
- * @of_node: pointer to OpenFirmware device node
+ * @of_node: **DEPRECATED** - use @fwnode for this
  * @fwnode: device node supplied by the platform firmware
  * @swnode: software node for the device
  * @resources: resources associated with the device
-- 
2.47.2


