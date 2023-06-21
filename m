Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E10E77388AE
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jun 2023 17:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjFUPUK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jun 2023 11:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbjFUPTu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jun 2023 11:19:50 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B9984C05;
        Wed, 21 Jun 2023 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687360609; x=1718896609;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VblY/rm86Nrtd/B1UCaI/PliO/WD8SqNOUgqlsMUt7g=;
  b=l//1jgSkwfkYX76FIKACDJUB4PKtFBr0f4x/qiTfudQ1nHTreJzfGwI5
   FkmFcC4y+u0R3HuXrm9ETdg5Okl4/8qf7+9Imh/tQ20D6gZMq4k9ylANO
   jxT1aGfvHx2pONaPQhzxPMUtulf3iS5LXlsBSGYbreGiueTgcd5O+QHPA
   h1q/bIuTputnGbb+7CbD25v7Ynjvib7DQ0HJpiera0TB0AtzRYCCr0+eH
   qKwpT1ABSKoFJcw90lOpuuFzE080yUIAEm7ustQPgATjA8sHC42D47eDz
   z1SgqFG/8QcN2/0N74iKeFcuSBmvVW4shLwy+vC+oLxb27eGTwpxwbyzw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="446584489"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="446584489"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 08:16:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="664702531"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="664702531"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 21 Jun 2023 08:16:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 43DDF1FD; Wed, 21 Jun 2023 18:16:55 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Brunner <michael.brunner@kontron.com>
Subject: [PATCH v2 1/2] ACPI: platform: Ignore SMB0001 only when it has resources
Date:   Wed, 21 Jun 2023 18:16:51 +0300
Message-Id: <20230621151652.79579-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After switching i2c-scmi driver to be a plaform one, it stopped
being enumerated on number of Kontron platforms, because it's
listed in the forbidden_id_list.

To resolve the situation, split the list to generic one and
another that holds devices that has to be skipped if and only
if they have bogus resources attached (_CRS method returns some).

Fixes: 03d4287add6e ("i2c: scmi: Convert to be a platform driver")
Closes: https://lore.kernel.org/r/60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.camel@kontron.com
Reported-by: Michael Brunner <michael.brunner@kontron.com>
Tested-by: Michael Brunner <michael.brunner@kontron.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Link: https://lore.kernel.org/r/20230620163534.1042-1-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: added tags (Andi, Michael), fixed spelling (Andi)
 drivers/acpi/acpi_platform.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/acpi_platform.c b/drivers/acpi/acpi_platform.c
index fe00a5783f53..089a98bd18bf 100644
--- a/drivers/acpi/acpi_platform.c
+++ b/drivers/acpi/acpi_platform.c
@@ -19,13 +19,17 @@
 
 #include "internal.h"
 
+static const struct acpi_device_id forbidden_id_with_resourses[] = {
+	{"SMB0001",  0},	/* ACPI SMBUS virtual device */
+	{ }
+};
+
 static const struct acpi_device_id forbidden_id_list[] = {
 	{"ACPI0009", 0},	/* IOxAPIC */
 	{"ACPI000A", 0},	/* IOAPIC */
 	{"PNP0000",  0},	/* PIC */
 	{"PNP0100",  0},	/* Timer */
 	{"PNP0200",  0},	/* AT DMA Controller */
-	{"SMB0001",  0},	/* ACPI SMBUS virtual device */
 	{ }
 };
 
@@ -83,6 +87,15 @@ static void acpi_platform_fill_resource(struct acpi_device *adev,
 		dest->parent = pci_find_resource(to_pci_dev(parent), dest);
 }
 
+static int acpi_platform_resource_count(struct acpi_resource *ares, void *data)
+{
+	int *count = data;
+
+	*count = *count + 1;
+
+	return 1;
+}
+
 /**
  * acpi_create_platform_device - Create platform device for ACPI device node
  * @adev: ACPI device node to create a platform device for.
@@ -103,7 +116,8 @@ struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
 	struct resource_entry *rentry;
 	struct list_head resource_list;
 	struct resource *resources = NULL;
-	int count;
+	int count = 0;
+	int ret;
 
 	/* If the ACPI node already has a physical device attached, skip it. */
 	if (adev->physical_node_count)
@@ -113,6 +127,15 @@ struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
 		return ERR_PTR(-EINVAL);
 
 	INIT_LIST_HEAD(&resource_list);
+	ret = acpi_dev_get_resources(adev, &resource_list, acpi_platform_resource_count, &count);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	acpi_dev_free_resource_list(&resource_list);
+
+	if (count > 0 && !acpi_match_device_ids(adev, forbidden_id_with_resourses))
+		return ERR_PTR(-EINVAL);
+
 	count = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
 	if (count < 0)
 		return NULL;
-- 
2.40.0.1.gaa8946217a0b

