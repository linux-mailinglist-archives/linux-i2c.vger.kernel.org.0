Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1BC47336D
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Dec 2021 19:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234963AbhLMSAb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Dec 2021 13:00:31 -0500
Received: from mga06.intel.com ([134.134.136.31]:33677 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235530AbhLMSAb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Dec 2021 13:00:31 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="299572185"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="299572185"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 10:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="481601809"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2021 10:00:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0A0DD1A8; Mon, 13 Dec 2021 20:00:36 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 3/6] i2c: designware-pci: use __maybe_unused for PM functions
Date:   Mon, 13 Dec 2021 20:00:31 +0200
Message-Id: <20211213180034.30929-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
References: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use __maybe_unused for PM functions instead of ifdeffery.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v2: added tag (Jarkko)
 drivers/i2c/busses/i2c-designware-pcidrv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 85860902c496..e4be5420840a 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -206,8 +206,7 @@ static struct dw_pci_controller dw_pci_controllers[] = {
 	},
 };
 
-#ifdef CONFIG_PM
-static int i2c_dw_pci_suspend(struct device *d)
+static int __maybe_unused i2c_dw_pci_suspend(struct device *d)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(d);
 
@@ -217,7 +216,7 @@ static int i2c_dw_pci_suspend(struct device *d)
 	return 0;
 }
 
-static int i2c_dw_pci_resume(struct device *d)
+static int __maybe_unused i2c_dw_pci_resume(struct device *d)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(d);
 	int ret;
@@ -227,7 +226,6 @@ static int i2c_dw_pci_resume(struct device *d)
 
 	return ret;
 }
-#endif
 
 static UNIVERSAL_DEV_PM_OPS(i2c_dw_pm_ops, i2c_dw_pci_suspend,
 			    i2c_dw_pci_resume, NULL);
-- 
2.33.0

