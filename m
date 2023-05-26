Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82AB971279E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 15:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243757AbjEZNeP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 09:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243656AbjEZNeK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 09:34:10 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C6C741BD;
        Fri, 26 May 2023 06:33:48 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,194,1681138800"; 
   d="scan'208";a="164481227"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 May 2023 22:33:14 +0900
Received: from localhost.localdomain (unknown [10.226.93.166])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 680E14216F12;
        Fri, 26 May 2023 22:33:09 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        William Zhang <william.zhang@broadcom.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Tyrone Ting <kfting@nuvoton.com>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
Subject: [PATCH v2 1/3] i2c: rzv2m: Drop extra space
Date:   Fri, 26 May 2023 14:33:01 +0100
Message-Id: <20230526133303.309582-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526133303.309582-1-biju.das.jz@bp.renesas.com>
References: <20230526133303.309582-1-biju.das.jz@bp.renesas.com>
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

Drop extra space from the I2C_RZV2M config help description.

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Added Rb tag from Geert.
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 87600b4aacb3..31c0f54b0b8c 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1025,7 +1025,7 @@ config I2C_RZV2M
 	depends on ARCH_RENESAS || COMPILE_TEST
 	help
 	  If you say yes to this option, support will be included for the
-	  Renesas RZ/V2M  I2C interface.
+	  Renesas RZ/V2M I2C interface.
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-rzv2m.
-- 
2.25.1

