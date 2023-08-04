Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2077705BB
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 18:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjHDQRs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 12:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjHDQRr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 12:17:47 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1BB0B46B1;
        Fri,  4 Aug 2023 09:17:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,255,1684767600"; 
   d="scan'208";a="171950200"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Aug 2023 01:17:44 +0900
Received: from localhost.localdomain (unknown [10.226.93.35])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8805040116B5;
        Sat,  5 Aug 2023 01:17:39 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Cameron <jic23@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-acpi@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-rtc@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 1/4] drivers: fwnode: Extend device_get_match_data() to struct bus_type
Date:   Fri,  4 Aug 2023 17:17:25 +0100
Message-Id: <20230804161728.394920-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Extend device_get_match_data() to buses (for eg: I2C) by adding a
callback device_get_match_data() to struct bus_type() and call this method
as a fallback for generic fwnode based device_get_match_data().

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v6->v7:
 * Added ack from Greg Kroah-Hartman.
v5->v6:
 * Added Rb tag from Sakari.
v4->v5:
 * No change
v3->v4:
 * Documented corner case.
v2->v3:
 * Added Rb tag from Andy.
RFC v1-> v2:
 * Replaced "Signed-off-by"->"Suggested-by" tag for Dmitry.
 * Documented device_get_match_data().
 * Added multiple returns to make code path for generic fwnode-based
   lookup faster.
---
 drivers/base/property.c    | 27 ++++++++++++++++++++++++++-
 include/linux/device/bus.h |  3 +++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 8c40abed7852..a3c188cf68bb 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1275,9 +1275,34 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
 
+/**
+ * device_get_match_data - get match data from OF/ACPI/Bus match tables
+ * @dev: device to find the match data
+ *
+ * Find match data using generic fwnode-based lookup and if there is no
+ * match, call the bus->get_match_data() for finding match data.
+ *
+ * Return: a match data pointer or NULL if there is no match in the matching
+ * table.
+ *
+ * Besides the fact that some drivers abuse the device ID driver_data type
+ * and claim it to be integer, for the bus specific ID tables the driver_data
+ * may be defined as kernel_ulong_t. For these tables 0 is a valid response,
+ * but not for this function. It's recommended to convert those either to avoid
+ * 0 or use a real pointer to the predefined driver data.
+ */
 const void *device_get_match_data(const struct device *dev)
 {
-	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
+	const void *data;
+
+	data = fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
+	if (data)
+		return data;
+
+	if (dev->bus && dev->bus->get_match_data)
+		return dev->bus->get_match_data(dev);
+
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(device_get_match_data);
 
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index ae10c4322754..2e15b0ae5384 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -60,6 +60,7 @@ struct fwnode_handle;
  *			this bus.
  * @dma_cleanup:	Called to cleanup DMA configuration on a device on
  *			this bus.
+ * @get_match_data:	Called to get match data on a device on this bus.
  * @pm:		Power management operations of this bus, callback the specific
  *		device driver's pm-ops.
  * @iommu_ops:  IOMMU specific operations for this bus, used to attach IOMMU
@@ -102,6 +103,8 @@ struct bus_type {
 	int (*dma_configure)(struct device *dev);
 	void (*dma_cleanup)(struct device *dev);
 
+	const void *(*get_match_data)(const struct device *dev);
+
 	const struct dev_pm_ops *pm;
 
 	const struct iommu_ops *iommu_ops;
-- 
2.25.1

