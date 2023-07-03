Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1D1C745BEC
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 14:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjGCMOQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 08:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjGCMOP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 08:14:15 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB7B10E;
        Mon,  3 Jul 2023 05:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688386454; x=1719922454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tcBflnra7gCALSSSxjriqj/Y8FpJYDW+EY6Pd4pNPvY=;
  b=m0+VtHtTC98PYJH+/ZS3/VhNpVotMRPrfKP0en2aLPL5CKa9buWDL4ja
   hG3Bn+a4j/EGmFzzsx1N7NGJH/ifOliSk1zFeyzR+T+pUNPbaefjNrFXr
   I4Af4pPcnu5JfgUk8+rnpgqWis8MoTQPJsw+/PbYClLxkKl5mJcTbEQSi
   EY2b9ceml+6ynUUO/PsJcSDuMBaWAia1dV5istWwVB9ToQq4LBUWUoxfs
   6whsyvYCbFV3B4QbvSxPyCdjNw8KChyVkJOBO0oWvtNQRUKefIpmtSrME
   TIBIxQuuT6OKtczy4TmpKQzmTCEEL553DnL30YqFNEw3sNlaK2/4lE1eW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="449241138"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="449241138"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 05:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="718574508"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="718574508"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 03 Jul 2023 05:14:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F0B4A13C; Mon,  3 Jul 2023 15:14:12 +0300 (EEST)
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
Subject: [PATCH v4 1/5] ACPI: bus: Introduce acpi_match_acpi_device() helper
Date:   Mon,  3 Jul 2023 15:14:07 +0300
Message-Id: <20230703121411.69606-2-andriy.shevchenko@linux.intel.com>
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

Match the ACPI device against a given list of ACPI IDs.
This may be helpful in different cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/bus.c   | 25 +++++++++++++++++++++----
 include/linux/acpi.h |  9 +++++++++
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 20cdfb37da79..2fc2b43a4ed3 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -850,6 +850,26 @@ static bool __acpi_match_device(const struct acpi_device *device,
 	return true;
 }
 
+/**
+ * acpi_match_acpi_device - Match an ACPI device against a given list of ACPI IDs
+ * @ids: Array of struct acpi_device_id objects to match against.
+ * @adev: The ACPI device pointer to match.
+ *
+ * Match the ACPI device @adev against a given list of ACPI IDs @ids.
+ *
+ * Return:
+ * a pointer to the first matching ACPI ID on success or %NULL on failure.
+ */
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
@@ -864,10 +884,7 @@ static bool __acpi_match_device(const struct acpi_device *device,
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

