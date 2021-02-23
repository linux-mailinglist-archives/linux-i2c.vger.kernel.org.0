Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA63322F8F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Feb 2021 18:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233686AbhBWRY2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Feb 2021 12:24:28 -0500
Received: from mga03.intel.com ([134.134.136.65]:64882 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233651AbhBWRY2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Feb 2021 12:24:28 -0500
IronPort-SDR: u9sea2y2pB4UFjpG9226jraQEMfASXlrw+WYdgpkCRnRNqmpJBR8F9/KB1PMZYgwBorO9W940S
 GIRxYghLhdPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="184936238"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; 
   d="scan'208";a="184936238"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2021 09:22:42 -0800
IronPort-SDR: We4PIJLG3tPt/lR5PzeWuGUQc6CDC/uZ/bcAwfH/SrB0L5Ut8LwsI6RrxAUpS2tQYmjdF5EUg2
 7sxix/ss6U3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; 
   d="scan'208";a="596791789"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 23 Feb 2021 09:22:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F375230E; Tue, 23 Feb 2021 19:22:38 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v1 1/1] i2c: cht-wc: Use fwnode for the controller and IRQ domain
Date:   Tue, 23 Feb 2021 19:22:31 +0200
Message-Id: <20210223172231.2224-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It's better to describe the I²C controller and associated IRQ domain with
fwnode, so they will find their place in the hierarchy in sysfs and also
make easier to debug.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Hans, unfortunately I have no device at hand with INT34D3. This is only compile
tested in that sense. Also I would like to hear if you like the idea in general.

 drivers/i2c/busses/i2c-cht-wc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index f80d79e973cd..dbf55842b0dc 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -303,6 +303,7 @@ static struct bq24190_platform_data bq24190_pdata = {
 static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 {
 	struct intel_soc_pmic *pmic = dev_get_drvdata(pdev->dev.parent);
+	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 	struct cht_wc_i2c_adap *adap;
 	struct i2c_board_info board_info = {
 		.type = "bq24190",
@@ -333,6 +334,7 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 	strlcpy(adap->adapter.name, "PMIC I2C Adapter",
 		sizeof(adap->adapter.name));
 	adap->adapter.dev.parent = &pdev->dev;
+	set_primary_fwnode(&adap->adapter.dev, fwnode);
 
 	/* Clear and activate i2c-adapter interrupts, disable client IRQ */
 	adap->old_irq_mask = adap->irq_mask = ~CHT_WC_EXTCHGRIRQ_ADAP_IRQMASK;
@@ -350,8 +352,8 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Alloc and register client IRQ */
-	adap->irq_domain = irq_domain_add_linear(pdev->dev.of_node, 1,
-						 &irq_domain_simple_ops, NULL);
+	adap->irq_domain = irq_domain_create_linear(fwnode, 1,
+						    &irq_domain_simple_ops, NULL);
 	if (!adap->irq_domain)
 		return -ENOMEM;
 
-- 
2.30.0

