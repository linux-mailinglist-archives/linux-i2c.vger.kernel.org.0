Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E45D77CF2B
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Aug 2023 17:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238015AbjHOPaP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Aug 2023 11:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238069AbjHOP3d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Aug 2023 11:29:33 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769061BD9
        for <linux-i2c@vger.kernel.org>; Tue, 15 Aug 2023 08:29:15 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d0c:f209:12a7:4ce5])
        by michel.telenet-ops.be with bizsmtp
        id ZrVD2A00845ualL06rVDxq; Tue, 15 Aug 2023 17:29:13 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qVvyk-000j7z-Lt;
        Tue, 15 Aug 2023 17:29:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qVvyq-005clt-W4;
        Tue, 15 Aug 2023 17:29:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: Make I2C_ATR invisible
Date:   Tue, 15 Aug 2023 17:29:11 +0200
Message-Id: <588d302477cb7e6b30b52ee6448807324c57b88a.1692113321.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C Address Translator (ATR) support is not a stand-alone driver, but a
library.  All of its users select I2C_ATR.  Hence there is no need for
the user to enable this symbol manually, except when compile-testing.

Fixes: a076a860acae77bb ("media: i2c: add I2C Address Translator (ATR) support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Do we care yet about out-of-tree drivers that need this functionality?
---
 drivers/i2c/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index c6d1a345ea6d8aee..9388823bb0bb960c 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -72,7 +72,7 @@ config I2C_MUX
 source "drivers/i2c/muxes/Kconfig"
 
 config I2C_ATR
-	tristate "I2C Address Translator (ATR) support"
+	tristate "I2C Address Translator (ATR) support" if COMPILE_TEST
 	help
 	  Enable support for I2C Address Translator (ATR) chips.
 
-- 
2.34.1

