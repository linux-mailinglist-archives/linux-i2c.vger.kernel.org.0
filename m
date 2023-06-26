Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50EE573DCA9
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 13:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjFZLAe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 07:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjFZLAc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 07:00:32 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFC510DB;
        Mon, 26 Jun 2023 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687777221; x=1719313221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cfkHmvhL16siboX9Cx9flRIYjtdn8/awF8GL0BpfHpU=;
  b=F3BZxFX6bPium+iZbkUPTbppIqKQW0/tgWrG28seB+980y/XOvOPbhtQ
   XgPNyVBi5djSbzEqWMp2r+JrbbxsXAaaCjPyNfKktp8D5qMhM4iVOP1h8
   FbEKvvgVUGBnYJub+9XrgUS7Xkbpjy/wHkVwdiS0QhZFYbBQkyLk+pxgz
   B0jae98e1/CjMxb3d9VZkUn2UGD1tsV5OFJcXfxzG4HF/h1mmnaZpnszz
   KSrNrPBxb+Lo4zt14haJYCzckHcyFHp9CT5HGcp3BuL9zc0n6dGsJkZWl
   iZplQUeTBkt0vlZxzcFhDf5HSCyBAJrc4vnchvpADwG4bZ/l1YmjsquIN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="427232827"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="427232827"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 04:00:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="890245264"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="890245264"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 26 Jun 2023 04:00:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0C220370; Mon, 26 Jun 2023 14:00:28 +0300 (EEST)
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
Subject: [PATCH v3 2/4] ACPI: bus: Introduce acpi_match_acpi_device() helper
Date:   Mon, 26 Jun 2023 14:00:24 +0300
Message-Id: <20230626110026.65825-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230626110026.65825-1-andriy.shevchenko@linux.intel.com>
References: <20230626110026.65825-1-andriy.shevchenko@linux.intel.com>
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

In some cases we can't have a physical node associated with
the ACPI device. Yet we want to match it against ID table and
get respective driver data. Introduce the helper for that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/bus.c   | 15 +++++++++++----
 include/linux/acpi.h |  9 +++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 20cdfb37da79..ee88bfb60ac2 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -850,6 +850,16 @@ static bool __acpi_match_device(const struct acpi_device *device,
 	return true;
 }
 
+const struct acpi_device_id *acpi_match_acpi_device(const struct acpi_device_id *ids,
+						    const struct acpi_device *adev)
+{
+	const struct acpi_device_id *id = NULL;
+
+	__acpi_match_device(adev, ids, NULL, &id, NULL);
+	return id;
+}
+EXPORT_SYMBOL_GPL(acpi_match_acpi_device);
+
 /**
  * acpi_match_device - Match a struct device against a given list of ACPI IDs
  * @ids: Array of struct acpi_device_id object to match against.
@@ -864,10 +874,7 @@ static bool __acpi_match_device(const struct acpi_device *device,
 const struct acpi_device_id *acpi_match_device(const struct acpi_device_id *ids,
 					       const struct device *dev)
 {
-	const struct acpi_device_id *id = NULL;
-
-	__acpi_match_device(acpi_companion_match(dev), ids, NULL, &id, NULL);
-	return id;
+	return acpi_match_acpi_device(ids, acpi_companion_match(dev));
 }
 EXPORT_SYMBOL_GPL(acpi_match_device);
 
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 640f1c07c894..641dc4843987 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -707,6 +707,9 @@ extern int acpi_nvs_register(__u64 start, __u64 size);
 extern int acpi_nvs_for_each_region(int (*func)(__u64, __u64, void *),
 				    void *data);
 
+const struct acpi_device_id *acpi_match_acpi_device(const struct acpi_device_id *ids,
+						    const struct acpi_device *adev);
+
 const struct acpi_device_id *acpi_match_device(const struct acpi_device_id *ids,
 					       const struct device *dev);
 
@@ -922,6 +925,12 @@ static inline int acpi_nvs_for_each_region(int (*func)(__u64, __u64, void *),
 
 struct acpi_device_id;
 
+static inline const struct acpi_device_id *acpi_match_acpi_device(
+	const struct acpi_device_id *ids, const struct acpi_device *adev)
+{
+	return NULL;
+}
+
 static inline const struct acpi_device_id *acpi_match_device(
 	const struct acpi_device_id *ids, const struct device *dev)
 {
-- 
2.40.0.1.gaa8946217a0b

