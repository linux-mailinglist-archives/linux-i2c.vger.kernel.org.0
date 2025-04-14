Return-Path: <linux-i2c+bounces-10330-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A81A87CF2
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 12:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74F2C174481
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 10:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF8826E169;
	Mon, 14 Apr 2025 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6ovOH7P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884926563C;
	Mon, 14 Apr 2025 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625065; cv=none; b=sHEIcp3jQaCyc+G5UnQo4yOdCNJf+WeX2Sz7Hanm9D1LwdUc1DnqWIHrlBzMUe4Ujc/IroSbMJaaH6F44a4Vy+r3JLrKIfValIg2h0XGuMF2ZEyXn0kYsOuEpP+KgCpF/ESN5Vj8+Dw9OOktmr8A2iyxqJWlGoPOO+wrw2ubVYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625065; c=relaxed/simple;
	bh=/z8O9SDZiaTEXhg4ysbJsJfwrcHDw53/UnAOR7/dwrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tZrz4yJZ4iRY4/uDOQUUlQiRcu7FQxyN2GvTNEi5W1EP2RUhW0eI3BCmFIJkJ7FGPQ3clmHKY9LOqpKMeCsXVHJQC4OA/RRI3DHenlJbrn8fNkYs+kp4i8U3Y8vX2fN8D4u7/4Y+hPml7aCmylnuOiM6EYeWMsp4iDb2w+Xu36E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6ovOH7P; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744625064; x=1776161064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/z8O9SDZiaTEXhg4ysbJsJfwrcHDw53/UnAOR7/dwrs=;
  b=Q6ovOH7PJfHtfnPtdN6kdJz7+FDvv1+hNvioIkyKQ7JHB5Zu51GLXsiM
   Z89bnPLrMDr3nv0I1hFJF1qEQNkyTX41vpwq7rLOVLjOQJypHDVYg704w
   X7/wDScJ8oT0dYcJ+MXBq6g/YR5MXE2xU8S6QEjtusX4vyH9EU76SGWIp
   UUWx42NsF6VQ9RFnaT595eBijUHsC6MujOPWXimy9D/FQMwxC33Q44BKq
   xGvlhQKfSEizA9gR4EL0af87NI2UbSUb4bn7szd2LY2t6p7Xx2qeVfOVi
   rmD6S/uPImF408Df63yfo1LBLEoyIU/kk4LImtg03qzTdz1LXPkHxy3RQ
   A==;
X-CSE-ConnectionGUID: 66BRT2IBQ2W8gfQOLYXjDA==
X-CSE-MsgGUID: wL5gpYmjSaKRs7DOGKulmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56747145"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56747145"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:04:20 -0700
X-CSE-ConnectionGUID: VpzGRA15T4Gp+B8WZerERA==
X-CSE-MsgGUID: 7/ZuEDTWRcaEL1Rsg354Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134747330"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Apr 2025 03:04:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 261CCB0C; Mon, 14 Apr 2025 13:04:12 +0300 (EEST)
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
Subject: [PATCH v4 7/7] media: i2c: ds90ub960: Remove of_node assignment
Date: Mon, 14 Apr 2025 13:01:57 +0300
Message-ID: <20250414100409.3910312-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
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


