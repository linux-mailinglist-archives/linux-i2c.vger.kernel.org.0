Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 168C261787D
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 09:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiKCIPY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 04:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiKCIPX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 04:15:23 -0400
X-Greylist: delayed 437 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 03 Nov 2022 01:15:20 PDT
Received: from mxus.zte.com.cn (mxus.zte.com.cn [20.112.44.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66C61BC;
        Thu,  3 Nov 2022 01:15:20 -0700 (PDT)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mxus.zte.com.cn (FangMail) with ESMTPS id 4N2xFs4kncz9tyW5;
        Thu,  3 Nov 2022 16:08:01 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxhk.zte.com.cn (FangMail) with ESMTPS id 4N2xFp2Rk2z8QrkZ;
        Thu,  3 Nov 2022 16:07:58 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
        by mse-fl2.zte.com.cn with SMTP id 2A387iG9057025;
        Thu, 3 Nov 2022 16:07:44 +0800 (+08)
        (envelope-from zhang.songyi@zte.com.cn)
Received: from mapi (xaxapp01[null])
        by mapi (Zmail) with MAPI id mid31;
        Thu, 3 Nov 2022 16:07:46 +0800 (CST)
Date:   Thu, 3 Nov 2022 16:07:46 +0800 (CST)
X-Zmail-TransId: 2af9636376d27d692465
X-Mailer: Zmail v1.0
Message-ID: <202211031607462393505@zte.com.cn>
Mime-Version: 1.0
From:   <zhang.songyi@zte.com.cn>
To:     <avifishman70@gmail.com>
Cc:     <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
        <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <openbmc@lists.ozlabs.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <zhang.songyi@zte.com.cn>
Subject: =?UTF-8?B?U3ViamVjdDogW1BBVENIIGxpbnV4LW5leHRdIGkyYzogbnBjbTd4eDogcmVtb3ZlIHJlZHVuZGFudCByZXQgdmFyaWFibGU=?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2A387iG9057025
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at 10-207-168-7 with ID 636376E0.000 by FangMail milter!
X-FangMail-Envelope: 1667462881/4N2xFs4kncz9tyW5/636376E0.000/192.168.250.137/[192.168.250.137]/mxhk.zte.com.cn/<zhang.songyi@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 636376E0.000/4N2xFs4kncz9tyW5
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: zhang songyi <zhang.songyi@zte.com.cn>

Return value from npcm_i2c_get_slave_addr() directly instead of taking
this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index bbc7359e67f7..772967862003 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -858,14 +858,10 @@ static void npcm_i2c_master_abort(struct npcm_i2c *bus)
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 static u8 npcm_i2c_get_slave_addr(struct npcm_i2c *bus, enum i2c_addr addr_type)
 {
-   u8 slave_add;
-
    if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10)
        dev_err(bus->dev, "get slave: try to use more than 2 SA not supported\n");

-   slave_add = ioread8(bus->reg + npcm_i2caddr[(int)addr_type]);
-
-   return slave_add;
+   return ioread8(bus->reg + npcm_i2caddr[(int)addr_type]);
 }

 static int npcm_i2c_remove_slave_addr(struct npcm_i2c *bus, u8 slave_add)
--
2.15.2
