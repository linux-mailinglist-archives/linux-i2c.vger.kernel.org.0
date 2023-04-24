Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5981E6ED59F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 21:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbjDXTyf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 15:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbjDXTyc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 15:54:32 -0400
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29363619A;
        Mon, 24 Apr 2023 12:54:30 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33OJs961070569;
        Mon, 24 Apr 2023 14:54:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1682366049;
        bh=fGh2KtrD4r68N5har2QjJNUa/w/bm+R2RNcbEC38Sxg=;
        h=From:To:CC:Subject:Date;
        b=RMA/RvAFyDsrC0r3FDZOkv81/keNPA/y9DcdbAiuKdI2luOz6nhcgbCbJA42RY1E9
         SXjmtY8xMIl+wSsnLD79MUmVUsRkTDR4ZrpOBwIti0g3laBQyXqpAhOX9twWQccDZI
         oLsM/frYmYOnAKQbxE98Hss6OXu1aF37ipScv4Io=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33OJs9a0007685
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Apr 2023 14:54:09 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 24
 Apr 2023 14:54:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 24 Apr 2023 14:54:09 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33OJs9G1044051;
        Mon, 24 Apr 2023 14:54:09 -0500
From:   Reid Tonking <reidt@ti.com>
To:     <tony@atomide.com>, <vigneshr@ti.com>, <aaro.koskinen@iki.fi>,
        <jmkrzyszt@gmail.com>
CC:     <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        Reid Tonking <reidt@ti.com>
Subject: [PATCH] i2c: omap: Fix standard mode false ACK readings
Date:   Mon, 24 Apr 2023 14:53:44 -0500
Message-ID: <20230424195344.627861-1-reidt@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Using standard mode, rare false ACK responses were appearing with
i2cdetect tool. This was happening due to NACK interrupt triggering
ISR thread before register access interrupt was ready. Removing the
NACK interrupt's ability to trigger ISR thread lets register access
ready interrupt do this instead.

Fixes: 3b2f8f82dad7 ("i2c: omap: switch to threaded IRQ support")

Signed-off-by: Reid Tonking <reidt@ti.com>
---
Fixes: LCPD-29949

 drivers/i2c/busses/i2c-omap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index f9ae520aed22..7ec252199706 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1058,7 +1058,7 @@ omap_i2c_isr(int irq, void *dev_id)
 	u16 stat;
 
 	stat = omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG);
-	mask = omap_i2c_read_reg(omap, OMAP_I2C_IE_REG);
+	mask = omap_i2c_read_reg(omap, OMAP_I2C_IE_REG) & ~OMAP_I2C_STAT_NACK;
 
 	if (stat & mask)
 		ret = IRQ_WAKE_THREAD;
-- 
2.34.1

