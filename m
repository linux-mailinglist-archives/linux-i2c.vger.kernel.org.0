Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3441B73DCAF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 13:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjFZLBB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 07:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbjFZLAx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 07:00:53 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B2710EA;
        Mon, 26 Jun 2023 04:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687777231; x=1719313231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bhqeMcnIeLHiERhCVntd9eCy5M/ovDNlECDlMUUEH0Y=;
  b=S2iGQ3P3BXTyJWs8HIfWm1qP/Ayu9NZtY2sh3+b5v8J+nSud43Nrsyxn
   MOtnosfOKKtJihjK5dmG4sz0se3UpNmVWeXpDOkLE3gQXRROFpDFnDJtU
   0SDUP08kgUYRjVKJOr/4AO0L195feEADnc/bjyDd7hyR3r8kQVHa649dW
   2LoeA67zqs3yYQl4INZUmu6QEdfItHiXb2180sGuVnJN4Q8sDH9dZa/8M
   D03Q5xznXF/3zs1FVUqtKVPcm7fXeV4WBSrAR85sVOUCxc6egu4ZFwTA/
   VmcF8vGmR/SKSH/V6B535yxLcVbL4zUaAWZNIYF2VSJBU8Z6Zfv1xz1vV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="351010844"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="351010844"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 04:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="781391001"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="781391001"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jun 2023 04:00:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F0E3378; Mon, 26 Jun 2023 14:00:27 +0300 (EEST)
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
Subject: [PATCH v3 1/4] ACPI: bus: Constify acpi_companion_match() returned value
Date:   Mon, 26 Jun 2023 14:00:23 +0300
Message-Id: <20230626110026.65825-2-andriy.shevchenko@linux.intel.com>
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

acpi_companion_match() doesn't alter the contents of the passed
parameter, so we don't expect that returned value can be altered
either. So constify it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/bus.c          | 6 +++---
 drivers/acpi/device_sysfs.c | 2 +-
 drivers/acpi/internal.h     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index e3e0bd0c5a50..20cdfb37da79 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -682,7 +682,7 @@ bool acpi_device_is_first_physical_node(struct acpi_device *adev,
  * resources available from it but they will be matched normally using functions
  * provided by their bus types (and analogously for their modalias).
  */
-struct acpi_device *acpi_companion_match(const struct device *dev)
+const struct acpi_device *acpi_companion_match(const struct device *dev)
 {
 	struct acpi_device *adev;
 
@@ -706,7 +706,7 @@ struct acpi_device *acpi_companion_match(const struct device *dev)
  * identifiers and a _DSD object with the "compatible" property, use that
  * property to match against the given list of identifiers.
  */
-static bool acpi_of_match_device(struct acpi_device *adev,
+static bool acpi_of_match_device(const struct acpi_device *adev,
 				 const struct of_device_id *of_match_table,
 				 const struct of_device_id **of_id)
 {
@@ -808,7 +808,7 @@ static bool __acpi_match_device_cls(const struct acpi_device_id *id,
 	return true;
 }
 
-static bool __acpi_match_device(struct acpi_device *device,
+static bool __acpi_match_device(const struct acpi_device *device,
 				const struct acpi_device_id *acpi_ids,
 				const struct of_device_id *of_ids,
 				const struct acpi_device_id **acpi_id,
diff --git a/drivers/acpi/device_sysfs.c b/drivers/acpi/device_sysfs.c
index 0fbfbaa8d8e3..b9bbf0746199 100644
--- a/drivers/acpi/device_sysfs.c
+++ b/drivers/acpi/device_sysfs.c
@@ -283,7 +283,7 @@ int acpi_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env
 }
 EXPORT_SYMBOL_GPL(acpi_device_uevent_modalias);
 
-static int __acpi_device_modalias(struct acpi_device *adev, char *buf, int size)
+static int __acpi_device_modalias(const struct acpi_device *adev, char *buf, int size)
 {
 	int len, count;
 
diff --git a/drivers/acpi/internal.h b/drivers/acpi/internal.h
index 50dcb35c9965..f4148dc50b9c 100644
--- a/drivers/acpi/internal.h
+++ b/drivers/acpi/internal.h
@@ -121,7 +121,7 @@ int acpi_bus_register_early_device(int type);
 /* --------------------------------------------------------------------------
                      Device Matching and Notification
    -------------------------------------------------------------------------- */
-struct acpi_device *acpi_companion_match(const struct device *dev);
+const struct acpi_device *acpi_companion_match(const struct device *dev);
 int __acpi_device_uevent_modalias(const struct acpi_device *adev,
 				  struct kobj_uevent_env *env);
 
-- 
2.40.0.1.gaa8946217a0b

