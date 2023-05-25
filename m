Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3097710D9D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 15:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241398AbjEYNv1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 May 2023 09:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241225AbjEYNv0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 09:51:26 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A50A8199;
        Thu, 25 May 2023 06:51:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,191,1681138800"; 
   d="scan'208";a="160806224"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 May 2023 22:51:24 +0900
Received: from localhost.localdomain (unknown [10.226.93.84])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A12D04226EA8;
        Thu, 25 May 2023 22:51:21 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
Subject: [PATCH 3/3] i2c: rzv2m: Disable the operation of unit in case of error
Date:   Thu, 25 May 2023 14:51:08 +0100
Message-Id: <20230525135108.240651-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525135108.240651-1-biju.das.jz@bp.renesas.com>
References: <20230525135108.240651-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The remove and suspend callbacks disable the operation of the unit.
Do the same in probe() in case of error.

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/i2c/busses/i2c-rzv2m.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index ccd337f2e8c3..3e9fc269e4fd 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -454,8 +454,10 @@ static int rzv2m_i2c_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 
 	ret = i2c_add_numbered_adapter(adap);
-	if (ret < 0)
+	if (ret < 0) {
+		BIT_CLRL(priv->base + IICB0CTL0, IICB0IICE);
 		pm_runtime_disable(dev);
+	}
 
 	return ret;
 }
-- 
2.25.1

