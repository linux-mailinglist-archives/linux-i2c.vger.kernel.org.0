Return-Path: <linux-i2c+bounces-10186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB19BA7E565
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE062188F545
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5782066FB;
	Mon,  7 Apr 2025 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsmGeP+v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF312205E1A;
	Mon,  7 Apr 2025 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040988; cv=none; b=JQTIfZUxzEEo1ZDG3v6gyAvPixMWGsC8j6H1fFZ9Y51Hf89W9xpPEU4e82uUZfzsbhy8uqzazxImpWBUr+frpOVNvpkmyso1sjjSShsyhOHF3NfEOxu2i6lTTVajvRSTrmYOBhpokWAUmnSzYDgmuRos0M3XJQRnqE9gSybHJeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040988; c=relaxed/simple;
	bh=c7ULQ/YDFwbkluQJyxGwnd4AkGdM/+B4VTGHdwHtUNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kiJaEBYiSlHu4+sKgJQW8Oa0OFmOVRMPubSa0gtEdk/dUoaQmgozw6f9kZE8XJMrD855SauDrw/EbPtvKKaMEA1HC/+heO+izXC+hjpJiMDE5RjRUZ8AAkzujauvk42TRuCzQ3EEglKxrv0HNfEYgtknz21VPNSXsYrjSuNH8vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsmGeP+v; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040987; x=1775576987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c7ULQ/YDFwbkluQJyxGwnd4AkGdM/+B4VTGHdwHtUNY=;
  b=QsmGeP+vI57V9mP0o5CpTJWZZjDoylWFEmjFRGaza6fdlHCwmAteBrSB
   ssDCSJmmtvAmxHWA6rVLvnKT53D6TYl64f8IE4AzAde07Kt2HY9e8NqoM
   9o97DkP44Zf3R1GmxGXfvKv5wEvOrhTXITL2FQ8zDT3EQ7ZoIiwdsu45/
   BmZ2HjF8ZR8zju3bQvxmqCBEoNih4vxVV9ZKpPBIBe/Fyim5bSVlrvdmG
   VE1v7LroeQpLPido8j6PDjNrh7kI/McXMW4+vWOd0BGboUdGV4yKPzm+2
   6/rbrIwdkawpTtRoOwBbWFWOOxW3FXNbLqobGGPbIA7tvMvxIqMxGnnL2
   Q==;
X-CSE-ConnectionGUID: Elnf0AuYRmm6uF/3NAjILw==
X-CSE-MsgGUID: gY3idw2fSoyygrDtZjANPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45555083"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45555083"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:49:46 -0700
X-CSE-ConnectionGUID: +RKB55IkR+WTDUcPTD1dNA==
X-CSE-MsgGUID: omWa6NFdQ46bzmb7vXtLJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="158986669"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 07 Apr 2025 08:49:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CFDE1338; Mon, 07 Apr 2025 18:49:38 +0300 (EEST)
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
Subject: [PATCH v3 7/7] media: i2c: ds90ub960: Remove of_node assignment
Date: Mon,  7 Apr 2025 18:45:03 +0300
Message-ID: <20250407154937.744466-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
References: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove of_node assignment which duplicates fwnode in struct i2c_board_info.
In general drivers must not set both, it's quite confusing. The I²C core
will consider fwnode with a priority and of_node is subject to remove from
above mentioned data structure.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/i2c/ds90ub960.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 5dde8452739b..5afdbbad9ff4 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1682,7 +1682,6 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
 	struct device *dev = &priv->client->dev;
 	struct ds90ub9xx_platform_data *ser_pdata = &rxport->ser.pdata;
 	struct i2c_board_info ser_info = {
-		.of_node = to_of_node(rxport->ser.fwnode),
 		.fwnode = rxport->ser.fwnode,
 		.platform_data = ser_pdata,
 	};
-- 
2.47.2


