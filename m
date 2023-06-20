Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA8BA7371D6
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jun 2023 18:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbjFTQgR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jun 2023 12:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjFTQgG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Jun 2023 12:36:06 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082CF1FFC;
        Tue, 20 Jun 2023 09:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687278942; x=1718814942;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JK3tVYgPO813k37yyUcq4KAbO6r53M5gA1CD/W9gXN8=;
  b=C1AncA6hwg3dXQMAeiRzYT+mJSLy/lPRbX/r5EUi9819GG6Np7ludt8R
   K4+QvOh3uD0T49+KXeFKR+PgUi0SN1dCovidctMwuCyHmVoZMlgy9cDyi
   c8BR1ZAkVeXa+l4Z8j+eysGOjhcuV8poNTohH/eNrjKunUq3jFTratDy5
   2wscgl6P8BaoB1xYbb2qkV6p0i5ZwQR6uS2TmKvC8OHF493x6vbVLPWSU
   sOx9qg0VfP+6hnYGLyXg9DiHdWXW+0MuSq2RSHffv3WeoEUiseegrOlw1
   3B0c/6hvc1ckX9s/EiupWG8Wlv6kqRQnXOKnM4PTrX4yC2nvWXq2MoX9y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="363334026"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="363334026"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 09:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="827062742"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="827062742"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2023 09:35:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E770C413; Tue, 20 Jun 2023 19:35:46 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Brunner <michael.brunner@kontron.com>
Subject: [PATCH v1 1/2] ACPI: platform: Ignore SMB0001 only when it has resources
Date:   Tue, 20 Jun 2023 19:35:33 +0300
Message-Id: <20230620163534.1042-1-andriy.shevchenko@linux.intel.com>
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

After switchind i2c-scmi driver to be a plaform one it stopped
being enumerated on number of Kontron platformsm, because it's
listed in the forbidden_id_list.

To resolve the situation, split the list to generic one and
another that holds devices that has to be skiped if and only if
they have bogus resources attached (_CRS method returns some).

Fixes: 03d4287add6e ("i2c: scmi: Convert to be a platform driver")
Closes: https://lore.kernel.org/r/60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.camel@kontron.com
Reported-by: Michael Brunner <michael.brunner@kontron.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
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

