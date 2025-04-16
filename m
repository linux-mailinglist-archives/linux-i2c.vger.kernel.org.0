Return-Path: <linux-i2c+bounces-10394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7763CA8B1A3
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1473D19050CB
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B189B2376E2;
	Wed, 16 Apr 2025 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkpVsuLX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7613F2309B1;
	Wed, 16 Apr 2025 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787063; cv=none; b=Uy0VLgv26V8hHcfBoWY93L2fLgQUYnicSSzrRr/czwo8qsIssAkKW6JwlCxzGy4QX57+5KF/bdULdeDbsvFtID7siy1kba0wM2T5wVXwJjzBDvuKJ7mX9P2KIgy5GB/xm+5Un1ba7PhfLFu0yju8P4za2Rf5bS8682mxU+eS604=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787063; c=relaxed/simple;
	bh=/z8O9SDZiaTEXhg4ysbJsJfwrcHDw53/UnAOR7/dwrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=grjbsSe6DteO0W/r/ZmuGB7gDOgUNk91cD7OHZosXIxKb1kwVH1zH2zghwuqH3b8q8sYHXmKEJRw0PVIw04keC12yfFetWSK4p4bzHtTMVZc4sY5z9dzbSUcUu6k2SjAXIOYbv/YbwoLECnvqphmJBrfItkvmb9wPEs0rDSlIfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkpVsuLX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744787062; x=1776323062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/z8O9SDZiaTEXhg4ysbJsJfwrcHDw53/UnAOR7/dwrs=;
  b=IkpVsuLXfzqhZUA4wycQcJ3s8yDWk7hJuBkrm9nTLy8qjzc8toVRiSaR
   U51l42tRUve2tQDyOiN8HTZLqC47CcPH4VtejRryr63XK+qHFmmNriXNC
   9TydHQ86qkRLWEKfTHu7YJLetpYEeuA2KUbRr3+DpnuH9qJIcxL3veZ75
   MU80HyHd8pCwEONe36G3xEbiF0LmBnxcD4VNpjM4KbW7/z7nCmILY27iz
   nuoEhrxDCqEKF7Y92eVr4CuoYSev2mN6Mt2CgJdQ849++kXdwNZAwywHf
   WtHqvbEYtniKMe3FtUm4pk3u4j+2FRpmpIfjOO1cVx8+56AVIL9M6dMMC
   A==;
X-CSE-ConnectionGUID: kPCNy67vRKa83ysMhHfYuA==
X-CSE-MsgGUID: 2IcchoUgSyu6KLU+5Rbovw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46241862"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46241862"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:04:18 -0700
X-CSE-ConnectionGUID: A1VrY2KOTjmLpK6I8Y5sBw==
X-CSE-MsgGUID: 7BYbbExuR1STIQxM3SHw9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131315374"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2025 00:04:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C7B8476C; Wed, 16 Apr 2025 10:04:10 +0300 (EEST)
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
Subject: [PATCH v5 7/7] media: i2c: ds90ub960: Remove of_node assignment
Date: Wed, 16 Apr 2025 10:01:37 +0300
Message-ID: <20250416070409.1867862-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>
References: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>
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

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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


