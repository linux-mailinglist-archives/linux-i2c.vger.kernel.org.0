Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA899213C
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2019 12:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfHSKY1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Aug 2019 06:24:27 -0400
Received: from mga05.intel.com ([192.55.52.43]:19934 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726717AbfHSKY0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 19 Aug 2019 06:24:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Aug 2019 03:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; 
   d="scan'208";a="261802676"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 19 Aug 2019 03:24:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C49E38D; Mon, 19 Aug 2019 13:24:23 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v1] i2c: designware: assert reset when error happen at ->probe()
Date:   Mon, 19 Aug 2019 13:24:23 +0300
Message-Id: <20190819102423.73683-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The commit c62ebb3d5f0d ("i2c: designware: Add support for an interface clock")
introduced an optional clock while missed correct error handling.
assert reset line back if error happen at ->probe().

Fixes: c62ebb3d5f0d ("i2c: designware: Add support for an interface clock")
Cc: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index ddfb81872906..4624ef8fbae8 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -346,8 +346,10 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	/* Optional interface clock */
 	dev->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk))
-		return PTR_ERR(dev->pclk);
+	if (IS_ERR(dev->pclk)) {
+		ret = PTR_ERR(dev->pclk);
+		goto exit_reset;
+	}
 
 	dev->clk = devm_clk_get(&pdev->dev, NULL);
 	if (!i2c_dw_prepare_clk(dev, true)) {
-- 
2.23.0.rc1

