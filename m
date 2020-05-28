Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A631E6395
	for <lists+linux-i2c@lfdr.de>; Thu, 28 May 2020 16:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390962AbgE1OTC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 May 2020 10:19:02 -0400
Received: from mga07.intel.com ([134.134.136.100]:64022 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390880AbgE1OTC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 May 2020 10:19:02 -0400
IronPort-SDR: F1YHOZxgWvisaKeYo5wHIBZ374lphDxlEIcNt59IjLcQt9W2ZGil7ghF/McbwN/biuzrlmyr6W
 N16Qc21O3QbA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 07:19:01 -0700
IronPort-SDR: Msf4DbFpLFycq+neVAka0xHfjZGWVNji1fJ2hAdesFwsSSWEgS/9kaV5V+D6+AQDVbFNQpKkcm
 MQ/DyYaAkK5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,444,1583222400"; 
   d="scan'208";a="442964121"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 28 May 2020 07:18:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D2A10230; Thu, 28 May 2020 17:18:58 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-acpi@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] i2c: acpi: Drop double check for ACPI companion device
Date:   Thu, 28 May 2020 17:18:58 +0300
Message-Id: <20200528141858.82648-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

acpi_dev_get_resources() does perform the NULL pointer check against
ACPI companion device which is given as function parameter. Thus,
there is no need to duplicate this check in the caller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-acpi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index c8f42f2037cb..2ade99b105b9 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -468,16 +468,12 @@ struct notifier_block i2c_acpi_notifier = {
 struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 				       struct i2c_board_info *info)
 {
+	struct acpi_device *adev = ACPI_COMPANION(dev);
 	struct i2c_acpi_lookup lookup;
 	struct i2c_adapter *adapter;
-	struct acpi_device *adev;
 	LIST_HEAD(resource_list);
 	int ret;
 
-	adev = ACPI_COMPANION(dev);
-	if (!adev)
-		return ERR_PTR(-EINVAL);
-
 	memset(&lookup, 0, sizeof(lookup));
 	lookup.info = info;
 	lookup.device_handle = acpi_device_handle(adev);
-- 
2.26.2

