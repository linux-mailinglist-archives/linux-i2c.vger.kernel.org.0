Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0E2475B88
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 16:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243818AbhLOPMS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 10:12:18 -0500
Received: from mga18.intel.com ([134.134.136.126]:62944 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243812AbhLOPMR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 10:12:17 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="226104878"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="226104878"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 07:12:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="518801195"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.88])
  by orsmga008.jf.intel.com with ESMTP; 15 Dec 2021 07:12:16 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 5/6] i2c: designware-pci: use __maybe_unused for PM functions
Date:   Wed, 15 Dec 2021 17:12:04 +0200
Message-Id: <20211215151205.584264-5-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
References: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Use __maybe_unused for PM functions instead of ifdeffery.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
Jarkko: In my opinion this was worth to take before cleanups so hand
edited to apply to currect code.
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 021eee44fa3d..855ea666029f 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -213,8 +213,7 @@ static struct dw_pci_controller dw_pci_controllers[] = {
 	},
 };
 
-#ifdef CONFIG_PM
-static int i2c_dw_pci_suspend(struct device *dev)
+static int __maybe_unused i2c_dw_pci_suspend(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
@@ -224,7 +223,7 @@ static int i2c_dw_pci_suspend(struct device *dev)
 	return 0;
 }
 
-static int i2c_dw_pci_resume(struct device *dev)
+static int __maybe_unused i2c_dw_pci_resume(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 	int ret;
@@ -234,7 +233,6 @@ static int i2c_dw_pci_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
 static UNIVERSAL_DEV_PM_OPS(i2c_dw_pm_ops, i2c_dw_pci_suspend,
 			    i2c_dw_pci_resume, NULL);
-- 
2.34.1

