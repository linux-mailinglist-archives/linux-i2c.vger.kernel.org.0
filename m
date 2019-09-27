Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E22BFC03DC
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2019 13:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbfI0LJR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Sep 2019 07:09:17 -0400
Received: from mga07.intel.com ([134.134.136.100]:15085 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfI0LJR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 27 Sep 2019 07:09:17 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Sep 2019 04:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,555,1559545200"; 
   d="scan'208";a="204142079"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.189])
  by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2019 04:09:14 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>,
        Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: i801: Bring back Block Process Call support for certain platforms
Date:   Fri, 27 Sep 2019 14:09:11 +0300
Message-Id: <20190927110911.23045-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Commit b84398d6d7f9 ("i2c: i801: Use iTCO version 6 in Cannon Lake PCH
and beyond") looks like to drop by accident Block Write-Block Read Process
Call support for Intel Sunrisepoint, Lewisburg, Denverton and Kaby Lake.

That support was added for above and newer platforms by the commit
315cd67c9453 ("i2c: i801: Add Block Write-Block Read Process Call
support") so bring it back for above platforms.

Fixes: b84398d6d7f9 ("i2c: i801: Use iTCO version 6 in Cannon Lake PCH and beyond")
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a4608a047468..1fed7bf00a6d 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1736,6 +1736,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	case PCI_DEVICE_ID_INTEL_LEWISBURG_SSKU_SMBUS:
 	case PCI_DEVICE_ID_INTEL_DNV_SMBUS:
 	case PCI_DEVICE_ID_INTEL_KABYLAKE_PCH_H_SMBUS:
+		priv->features |= FEATURE_BLOCK_PROC;
 		priv->features |= FEATURE_I2C_BLOCK_READ;
 		priv->features |= FEATURE_IRQ;
 		priv->features |= FEATURE_SMBUS_PEC;
-- 
2.23.0

