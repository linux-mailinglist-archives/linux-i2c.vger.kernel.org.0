Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08636745BEF
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 14:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbjGCMOS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 08:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbjGCMOQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 08:14:16 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD4A11F;
        Mon,  3 Jul 2023 05:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688386455; x=1719922455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0+SSNItGZd8DaGAVZM/aUS3kbeqhy2m38fy5KVkHewA=;
  b=DcvuSax7COzNFhXb9gdsI6E2rdAe6wUQvvbRu2SpIDrS4d+mhrai6A/k
   /TqsiWWFeNYGLd7zK6YVcQJJG8RbQSRKddUIh3Gdpji6pIl4LGYig3g1Y
   lg/s/2anTqv2ja0QT/z8r/6dESYJzdf2ST9VwNyAvG+lEsHM+3wDRRDB0
   6fnBZpibxU3hraxkgQYIXOTvabg7x9Uh5NMKHqPtXQil4iMoSgq3BiBQf
   KrNCB7L1I1bDbowy6pm9wjmyUBQWRLm0tyZ8n5wzmEdO3Vjd49ZbWxNlQ
   gP1J5JpyM8D/rnOp7vPkEkeARNR6m/ggwqIFGDq/1ldkT3MAUY4r16a+S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="449241149"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="449241149"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 05:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="718574513"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="718574513"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 03 Jul 2023 05:14:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 085C6178; Mon,  3 Jul 2023 15:14:13 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v4 2/5] ACPI: platform: Ignore SMB0001 only when it has resources
Date:   Mon,  3 Jul 2023 15:14:08 +0300
Message-Id: <20230703121411.69606-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230703121411.69606-1-andriy.shevchenko@linux.intel.com>
References: <20230703121411.69606-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/acpi/acpi_platform.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/acpi_platform.c b/drivers/acpi/acpi_platform.c
index fe00a5783f53..c2ce558bd032 100644
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
+	bool *has_resources = data;
+
+	*has_resources = true;
+
+	return AE_CTRL_TERMINATE;
+}
+
 /**
  * acpi_create_platform_device - Create platform device for ACPI device node
  * @adev: ACPI device node to create a platform device for.
@@ -100,17 +113,28 @@ struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
 	struct acpi_device *parent = acpi_dev_parent(adev);
 	struct platform_device *pdev = NULL;
 	struct platform_device_info pdevinfo;
+	const struct acpi_device_id *match;
 	struct resource_entry *rentry;
 	struct list_head resource_list;
 	struct resource *resources = NULL;
+	bool has_resources;
 	int count;
 
 	/* If the ACPI node already has a physical device attached, skip it. */
 	if (adev->physical_node_count)
 		return NULL;
 
-	if (!acpi_match_device_ids(adev, forbidden_id_list))
-		return ERR_PTR(-EINVAL);
+	match = acpi_match_acpi_device(forbidden_id_list, adev);
+	if (match) {
+		if (match->driver_data & ACPI_ALLOW_WO_RESOURCES) {
+			acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
+					    acpi_platform_resource_count, &has_resources);
+			if (has_resources)
+				return ERR_PTR(-EINVAL);
+		} else {
+			return ERR_PTR(-EINVAL);
+		}
+	}
 
 	INIT_LIST_HEAD(&resource_list);
 	count = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
-- 
2.40.0.1.gaa8946217a0b

