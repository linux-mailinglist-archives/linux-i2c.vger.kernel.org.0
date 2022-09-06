Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A702E5AF04E
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Sep 2022 18:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbiIFQYV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 12:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239312AbiIFQYE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 12:24:04 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F58E1C938;
        Tue,  6 Sep 2022 08:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662479699; x=1694015699;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tRDDwlBvhb9wfFnESgr5RVzsnPEhi2kS4BUN6UgEBYs=;
  b=eswtDM8z5xtNm1KZQZ53wC4Nvy1pArIgKgsz68y/jsCO1FeVXJ0GlWC+
   +8wjy6IT2NZzs2eiwe3o9NLITXRqgpMaOPWaTfwVtAMSdPnGzfgV0ZnJA
   G35dtW50UKmZw3E1APinJ/DCspGX6u1581yFd1eM252KY+1AjCriP/xmd
   7bo0LA6xfDrHa8JSjnvgbhzyYJk6vJN+QfIEaLAtS9Y8ouk12wOxDsE6W
   S9EJ+T3cOAcKKO6+pHkxzafoTbtvuU4+J93r14ESWLSwO9DJkRmXuEN5h
   ZyHo8eOStIOYiTHkix47od5XaQO8hx9puv2p2TJeIImDoSxc9W+foBpF+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="295365042"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="295365042"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 08:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="703257518"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Sep 2022 08:54:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EF92A86; Tue,  6 Sep 2022 18:55:11 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Josef Johansson <josef@oderland.se>
Subject: [PATCH v1 1/1] i2c: scmi: Convert to be a platform driver
Date:   Tue,  6 Sep 2022 18:55:07 +0300
Message-Id: <20220906155507.39483-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
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

ACPI core in conjunction with platform driver core provides
an infrastructure to enumerate ACPI devices. Use it in order
to remove a lot of boilerplate code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-scmi.c | 48 ++++++++++++++---------------------
 1 file changed, 19 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 6746aa46d96c..0239e134b90f 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -6,15 +6,13 @@
  */
 
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/stddef.h>
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 
-#define ACPI_SMBUS_HC_CLASS		"smbus"
-#define ACPI_SMBUS_HC_DEVICE_NAME	"cmi"
-
 /* SMBUS HID definition as supported by Microsoft Windows */
 #define ACPI_SMBUS_MS_HID		"SMB0001"
 
@@ -30,7 +28,7 @@ struct acpi_smbus_cmi {
 	u8 cap_info:1;
 	u8 cap_read:1;
 	u8 cap_write:1;
-	struct smbus_methods_t *methods;
+	const struct smbus_methods_t *methods;
 };
 
 static const struct smbus_methods_t smbus_methods = {
@@ -358,29 +356,25 @@ static acpi_status acpi_smbus_cmi_query_methods(acpi_handle handle, u32 level,
 	return AE_OK;
 }
 
-static int acpi_smbus_cmi_add(struct acpi_device *device)
+static int smbus_cmi_probe(struct platform_device *device)
 {
+	struct device *dev = &device->dev;
 	struct acpi_smbus_cmi *smbus_cmi;
-	const struct acpi_device_id *id;
 	int ret;
 
 	smbus_cmi = kzalloc(sizeof(struct acpi_smbus_cmi), GFP_KERNEL);
 	if (!smbus_cmi)
 		return -ENOMEM;
 
-	smbus_cmi->handle = device->handle;
-	strcpy(acpi_device_name(device), ACPI_SMBUS_HC_DEVICE_NAME);
-	strcpy(acpi_device_class(device), ACPI_SMBUS_HC_CLASS);
-	device->driver_data = smbus_cmi;
+	smbus_cmi->handle = ACPI_HANDLE(dev);
+	smbus_cmi->methods = device_get_match_data(dev);
+
+	platform_set_drvdata(device, smbus_cmi);
+
 	smbus_cmi->cap_info = 0;
 	smbus_cmi->cap_read = 0;
 	smbus_cmi->cap_write = 0;
 
-	for (id = acpi_smbus_cmi_ids; id->id[0]; id++)
-		if (!strcmp(id->id, acpi_device_hid(device)))
-			smbus_cmi->methods =
-				(struct smbus_methods_t *) id->driver_data;
-
 	acpi_walk_namespace(ACPI_TYPE_METHOD, smbus_cmi->handle, 1,
 			    acpi_smbus_cmi_query_methods, NULL, smbus_cmi, NULL);
 
@@ -390,8 +384,7 @@ static int acpi_smbus_cmi_add(struct acpi_device *device)
 	}
 
 	snprintf(smbus_cmi->adapter.name, sizeof(smbus_cmi->adapter.name),
-		"SMBus CMI adapter %s",
-		acpi_device_name(device));
+		 "SMBus CMI adapter %s", dev_name(dev));
 	smbus_cmi->adapter.owner = THIS_MODULE;
 	smbus_cmi->adapter.algo = &acpi_smbus_cmi_algorithm;
 	smbus_cmi->adapter.algo_data = smbus_cmi;
@@ -408,31 +401,28 @@ static int acpi_smbus_cmi_add(struct acpi_device *device)
 
 err:
 	kfree(smbus_cmi);
-	device->driver_data = NULL;
 	return ret;
 }
 
-static int acpi_smbus_cmi_remove(struct acpi_device *device)
+static int smbus_cmi_remove(struct platform_device *device)
 {
-	struct acpi_smbus_cmi *smbus_cmi = acpi_driver_data(device);
+	struct acpi_smbus_cmi *smbus_cmi = platform_get_drvdata(device);
 
 	i2c_del_adapter(&smbus_cmi->adapter);
 	kfree(smbus_cmi);
-	device->driver_data = NULL;
 
 	return 0;
 }
 
-static struct acpi_driver acpi_smbus_cmi_driver = {
-	.name = ACPI_SMBUS_HC_DEVICE_NAME,
-	.class = ACPI_SMBUS_HC_CLASS,
-	.ids = acpi_smbus_cmi_ids,
-	.ops = {
-		.add = acpi_smbus_cmi_add,
-		.remove = acpi_smbus_cmi_remove,
+static struct platform_driver smbus_cmi_driver = {
+	.probe = smbus_cmi_probe,
+	.remove = smbus_cmi_remove,
+	.driver = {
+		.name   = "smbus_cmi",
+		.acpi_match_table = acpi_smbus_cmi_ids,
 	},
 };
-module_acpi_driver(acpi_smbus_cmi_driver);
+module_platform_driver(smbus_cmi_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Crane Cai <crane.cai@amd.com>");
-- 
2.35.1

