Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF13F6B2EE7
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 21:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbjCIUpa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 15:45:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbjCIUpV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 15:45:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F92FB254;
        Thu,  9 Mar 2023 12:45:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4176B61CE3;
        Thu,  9 Mar 2023 20:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CABC4339B;
        Thu,  9 Mar 2023 20:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678394709;
        bh=HsFTEd+4CiDfECqFQk8kXUcjRJImRoE7fMRjjaDmibM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fl44tUFNVaRpFEDDYTLSBygqDRH01I09ZWmPXKS164eBuZ89FlprKvhK1aF4hHiAQ
         dZExTiSYIHWLwxmqy4lyDf8KP2hxKugYsIquGyPZ43Twu3E8m+HSLA1gqlmpMM9k1r
         wgDeHmqc2vIHBcbvzSwzL5EMwzslvTbgPyocFflDWkiXBMo10L8NwXXHUGuhDS0Zmt
         sUWMKCCIWY9LQr7mnRB1nCQ5+VR6y5eGUzpsJ8gAjK22Cju27w+N/zftYn61HgWLJj
         y4D2TxEfptH0I7m4zzFY9/az0qQSErYKlKqgNF6Z+7wHyEB6NyoED8yeAoUeaZ7qYI
         xa4QZSPfwNTUQ==
From:   Conor Dooley <conor@kernel.org>
To:     linux-riscv@lists.infradead.org
Cc:     conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-clk@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
        linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 2/5] i2c: microchip-core: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Date:   Thu,  9 Mar 2023 20:44:49 +0000
Message-Id: <20230309204452.969574-3-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309204452.969574-1-conor@kernel.org>
References: <20230309204452.969574-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=conor.dooley@microchip.com; h=from:subject; bh=hwharPwRsHrvTL39HSSbppqDJfB2r7S5Li90f2LrzlI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClcrs46c8pFn0y2Ocp+7O5L00P3b1SFsRa19GlYv6w38 OQ8YKXTUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIl86mdkOD93xeT0XO+Tx09k JhlOWLXRMyiMff5OvYylck7rTt//c4rhn3nVG12e59rqez/o/Dd436f1mOP8y9WnC9PrRG7O+h3 8gg8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
use of such symbols on other architectures, convert the Microchip FPGA
i2c drivers to use the new symbol.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 25eb4e8fd22f..9fa4a7bb5c8b 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -804,7 +804,7 @@ config I2C_MESON
 
 config I2C_MICROCHIP_CORE
 	tristate "Microchip FPGA I2C controller"
-	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
 	depends on OF
 	help
 	  If you say yes to this option, support will be included for the
-- 
2.39.2

