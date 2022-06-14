Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8725A54AE11
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 12:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242922AbiFNKO1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 06:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245741AbiFNKOW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 06:14:22 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3D746B0C;
        Tue, 14 Jun 2022 03:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655201659; x=1686737659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6W4JCf3REfCgtU1YeTx5Cs8TR95mjpKwa6re06enmmY=;
  b=fwSS4OxUB28pbrbq+gViamSlX7lfMYRva/qhUsrjkGntM/QTKjbD4uTI
   X4LRJoPTVra1dlSWK6GiEYWjJsOJ9iZo6nYVuCCviLeeIhyPLVNDA3oBv
   GCdXe1G7uzpK2pBM491DxyN47XtrvsSi72D2Fg4edMYQ1vqczrzAyrSh8
   BBQtba/SUyKfNbxpwc0U7D61sdO+HCMPzCO3T7gqDnnVkq2DqmmSiiyEq
   ISfx3772pF7b1C2EYWSktlKfkxQo+mTmrOmwOpB9jNxSMR3pCi07ZA3A3
   C1BAcUROUVQlDdJlqeGNtPxMM5u/gkkMHqmmd78ev99VRKJb9rqKA2hFW
   w==;
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="168028816"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2022 03:14:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 14 Jun 2022 03:14:18 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 14 Jun 2022 03:14:14 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <andrew@sanpeople.com>,
        <mhoffman@lightlink.com>, <khali@linux-fr.org>, <wsa@kernel.org>,
        <peda@axentia.se>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [RESEND 3/3] i2c: at91: add advanced digital filtering support for SAMA5D4
Date:   Tue, 14 Jun 2022 13:13:47 +0300
Message-ID: <20220614101347.16910-4-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220614101347.16910-1-codrin.ciubotariu@microchip.com>
References: <20220614101347.16910-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C/TWI IP variant found in SAMA5D4 supports advanced digital filtering,
even though, at the time of this patch, it is not present in Datasheet.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 drivers/i2c/busses/i2c-at91-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index 2df9df585131..7549a75a98ef 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -120,6 +120,7 @@ static struct at91_twi_pdata sama5d4_config = {
 	.clk_offset = 4,
 	.has_hold_field = true,
 	.has_dig_filtr = true,
+	.has_adv_dig_filtr = true,
 };
 
 static struct at91_twi_pdata sama5d2_config = {
-- 
2.34.1

