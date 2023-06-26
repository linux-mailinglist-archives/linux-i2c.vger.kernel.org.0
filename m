Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A863D73DCA8
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 13:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjFZLAc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 07:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjFZLAb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 07:00:31 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CFC8F;
        Mon, 26 Jun 2023 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687777221; x=1719313221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hFZZA3JYAHFku7FNJhgT27T5vrlPbdtdbu9UvmFVRsk=;
  b=gRlKcgY6AWYcUVsNq69wWk2ezRV+/J5MOBdvg4k8FfbSDnC/p8u09ANf
   MhqRaqzDut1wUrmVpkKe1+JmUGDGE21M1HtTjw0EYoSP3MvR3xal7o5o6
   H1Wb0Ct++iV6lA1pAqKQi5Xr2/3BujIy4Y8CgdYJB4wGVl4+oMMnYLSuj
   VVV650VQ0pbwLyLVGbrbWir8NboOhyRNz2dD8whkfEK6BR8HmI5j4EiYP
   M1cLn5pLOH3EZYq1Bk0w3kLm53BsV9hnSeeT2e7el7t+ZjHJ3CDByQSju
   egtGwFkAYDiBzmqYSbtPfyhabZNwhW2RA8aC+TM0xz6xag/BGCPYr0rsk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="351010833"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="351010833"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 04:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="781390995"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="781390995"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jun 2023 04:00:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 11BFB16E; Mon, 26 Jun 2023 14:00:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v3 3/4] ACPI: platform: Ignore SMB0001 only when it has resources
Date:   Mon, 26 Jun 2023 14:00:25 +0300
Message-Id: <20230626110026.65825-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230626110026.65825-1-andriy.shevchenko@linux.intel.com>
References: <20230626110026.65825-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After switching i2c-scmi driver to be a platform one, it stopped
being enumerated on number of Kontron platforms, because it's
listed in the forbidden_id_list.

To resolve the situation, add a flag to driver data to allow devices
with no resources in _CRS to be enumerated via platform bus.

Fixes: 03d4287add6e ("i2c: scmi: Convert to be a platform driver")
Closes: https://lore.kernel.org/r/60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.camel@kontron.com
Link: https://lore.kernel.org/r/20230621151652.79579-1-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/acpi_platform.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/acpi_platform.c b/drivers/acpi/acpi_platform.c
index fe00a5783f53..ee6ea1ee8396 100644
--- a/drivers/acpi/acpi_platform.c
+++ b/drivers/acpi/acpi_platform.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
@@ -19,13 +20,16 @@
 
 #include "internal.h"
 
+/* Exclude devices that have no _CRS resources provided */
+#define ACPI_ALLOW_WO_RESOURCES		BIT(0)
+
 static const struct acpi_device_id forbidden_id_list[] = {
 	{"ACPI0009", 0},	/* IOxAPIC */
 	{"ACPI000A", 0},	/* IOAPIC */
 	{"PNP0000",  0},	/* PIC */
 	{"PNP0100",  0},	/* Timer */
 	{"PNP0200",  0},	/* AT DMA Controller */
-	{"SMB0001",  0},	/* ACPI SMBUS virtual device */
+	{"SMB0001",  ACPI_ALLOW_WO_RESOURCES},	/* ACPI SMBUS virtual device */
 	{ }
 };
 
@@ -83,6 +87,15 @@ static void acpi_platform_fill_resource(struct acpi_device *adev,
 		dest->parent = pci_find_resource(to_pci_dev(parent), dest);
 }
 
+static unsigned int acpi_platform_resource_count(struct acpi_resource *ares, void *data)
+{
+	int *count = data;
+
+	(*count)++;
+
+	return AE_OK;
+}
+
 /**
  * acpi_create_platform_device - Create platform device for ACPI device node
  * @adev: ACPI device node to create a platform device for.
@@ -100,17 +113,27 @@ struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
 	struct acpi_device *parent = acpi_dev_parent(adev);
 	struct platform_device *pdev = NULL;
 	struct platform_device_info pdevinfo;
+	const struct acpi_device_id *match;
 	struct resource_entry *rentry;
 	struct list_head resource_list;
 	struct resource *resources = NULL;
-	int count;
+	int count = 0;
 
 	/* If the ACPI node already has a physical device attached, skip it. */
 	if (adev->physical_node_count)
 		return NULL;
 
-	if (!acpi_match_device_ids(adev, forbidden_id_list))
-		return ERR_PTR(-EINVAL);
+	match = acpi_match_acpi_device(forbidden_id_list, adev);
+	if (match) {
+		if (match->driver_data & ACPI_ALLOW_WO_RESOURCES) {
+			acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
+					    acpi_platform_resource_count, &count);
+			if (count > 0)
+				return ERR_PTR(-EINVAL);
+		} else {
+			return ERR_PTR(-EINVAL);
+		}
+	}
 
 	INIT_LIST_HEAD(&resource_list);
 	count = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
-- 
2.40.0.1.gaa8946217a0b

