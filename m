Return-Path: <linux-i2c+bounces-10393-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFA4A8B19D
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEB201904EF1
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74262343B6;
	Wed, 16 Apr 2025 07:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+0ek7Z8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB0115B546;
	Wed, 16 Apr 2025 07:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787062; cv=none; b=UZe/CVK/26g2yQabhtgnV+JGDyp1v7Xrc3y6eboZsshZVxfzmK+TxwwTI+gU52Uml2NN8N5RrAERWnGdT6UC27CTIVTf+xPpXuKCOdeLnnQsIPW34hBdSros91PxiVKX1s2xlsESjyAj03nafQguNnjE59AWjaDOj9PzEsm3FHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787062; c=relaxed/simple;
	bh=anmEGGlbam++ED94HMau5JtlIwpkkWxloWnoJKhXLPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=teA9H0UGn8yOqhXBafddG6j6eVc4HxJ2vdYhZAFtV+INDK/d7odfFX/A9g/oqo3OuvatSmXVZ3D9n2ir7GaOLqmNbodBytZLxlZyA+SVxr2EHY21Hf6hxT78OFb/CBXUmcvgFwil8NiuJRLKETb3JZHr7/H6ZUNB7FPWOjnY0I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+0ek7Z8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744787061; x=1776323061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=anmEGGlbam++ED94HMau5JtlIwpkkWxloWnoJKhXLPs=;
  b=B+0ek7Z8uu8T0c6uaLPSbPC8Owv4GBD3GxyWgT431lxEAzgQ9940yp9o
   JlfBORE2qD+OptZV7ABrCZO6zRBtwbRyL9oZCcJ1PnxXZRJ4TpSJH7Gml
   SmGwEx9wS9Ij736N3lfQy+kgug3KdZQcJo3GNC5nG36NRHoHnQTB31wB4
   IP3sNecV+sO2nIGk6KaUoAGJPsGcM4RmAI3QVCQu+kb8I3/ce+gnb8bEM
   /aKJ474/QKfvdpRR1lHD0Sc6JWS6cUooCU0cUNHgqeC6Kz5VfTwtrDCx4
   8qpobLJoVXIHz2cthRViuQXYIiLYO+A+eJTiiy391VXE5FfqDEztdjjBm
   Q==;
X-CSE-ConnectionGUID: POYBCcd9QSy9sf0jT7iU0g==
X-CSE-MsgGUID: taUGxLqYT4CLICn2A+mW3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46241857"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46241857"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:04:18 -0700
X-CSE-ConnectionGUID: gmsZ3NmJTrqPuq+wU16Ifw==
X-CSE-MsgGUID: tGASitafQdWZKGJVCP8CPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131315371"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2025 00:04:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B166C6D8; Wed, 16 Apr 2025 10:04:10 +0300 (EEST)
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
Subject: [PATCH v5 5/7] i2c: core: Do not dereference fwnode in struct device
Date: Wed, 16 Apr 2025 10:01:35 +0300
Message-ID: <20250416070409.1867862-6-andriy.shevchenko@linux.intel.com>
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

In order to make the underneath API easier to change in the future,
prevent users from dereferencing fwnode from struct device.
Instead, use the specific device_set_node() API for that.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 19 ++++++++++---------
 drivers/i2c/i2c-core-of.c   |  1 -
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b186de31a9ee..dc3c60a7d382 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -961,6 +961,7 @@ static void i2c_unlock_addr(struct i2c_adapter *adap, unsigned short addr,
 struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
+	struct fwnode_handle *fwnode;
 	struct i2c_client *client;
 	bool need_put = false;
 	int status;
@@ -1001,18 +1002,19 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	client->dev.parent = &client->adapter->dev;
 	client->dev.bus = &i2c_bus_type;
 	client->dev.type = &i2c_client_type;
-	client->dev.of_node = of_node_get(info->of_node);
-	client->dev.fwnode = info->fwnode;
 
 	device_enable_async_suspend(&client->dev);
 
+	fwnode = info->fwnode ?: of_fwnode_handle(info->of_node);
+	device_set_node(&client->dev, fwnode_handle_get(fwnode));
+
 	if (info->swnode) {
 		status = device_add_software_node(&client->dev, info->swnode);
 		if (status) {
 			dev_err(&adap->dev,
 				"Failed to add software node to client %s: %d\n",
 				client->name, status);
-			goto out_err_put_of_node;
+			goto out_err_put_fwnode;
 		}
 	}
 
@@ -1031,8 +1033,8 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 out_remove_swnode:
 	device_remove_software_node(&client->dev);
 	need_put = true;
-out_err_put_of_node:
-	of_node_put(info->of_node);
+out_err_put_fwnode:
+	fwnode_handle_put(fwnode);
 out_err:
 	dev_err(&adap->dev,
 		"Failed to register i2c client %s at 0x%02x (%d)\n",
@@ -1060,12 +1062,11 @@ void i2c_unregister_device(struct i2c_client *client)
 		return;
 
 	fwnode = dev_fwnode(&client->dev);
-	if (is_of_node(fwnode)) {
+	if (is_of_node(fwnode))
 		of_node_clear_flag(to_of_node(fwnode), OF_POPULATED);
-		of_node_put(client->dev.of_node);
-	} else if (is_acpi_device_node(fwnode)) {
+	else if (is_acpi_device_node(fwnode))
 		acpi_device_clear_enumerated(to_acpi_device_node(fwnode));
-	}
+	fwnode_handle_put(fwnode);
 
 	device_remove_software_node(&client->dev);
 	device_unregister(&client->dev);
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 02feee6c9ba9..eb7fb202355f 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -49,7 +49,6 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 	}
 
 	info->addr = addr;
-	info->of_node = node;
 	info->fwnode = of_fwnode_handle(node);
 
 	if (of_property_read_bool(node, "host-notify"))
-- 
2.47.2


