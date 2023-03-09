Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 133FF6B2EF7
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 21:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbjCIUpo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 15:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbjCIUpi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 15:45:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158EAF222B;
        Thu,  9 Mar 2023 12:45:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BC7CCB8208A;
        Thu,  9 Mar 2023 20:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E694CC4339B;
        Thu,  9 Mar 2023 20:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678394721;
        bh=69cMqall9ySx9R5xXzMB2/T+YDWmm6o9YXNbjv3RYmQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=doG+ooEVvhghSuy3xmfVYkqGfZsYRIZmobvE6daPQDekROCM/vdBLNWB53oOyxq8v
         uLp4Hunt6kZ2ikvm/vNbxA+j8ApIUnZmaGI9rmSirLCplLPKo7eDP2FDscSLGKk1aj
         rIiiCJSEHF5zKia+z+Db4oASRNLRZuYt0h6AHs9yaIpwVZv+hBkiz38seuTHfmPa2Z
         FKIw5xcfEb8IyJCq8HCnt6s7hcRmlN2jnB6G3JiXeh8bUtorsUm9rsYfaS7lIig5xz
         y5Edku6QuBInyWAMVL++zfXQQ3FYr95SHSvx4jz5pkulYH3TZFQbyTG5THlxECaL8h
         crb9NdE/9QWBQ==
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
Subject: [PATCH v1 5/5] usb: musb: mpfs: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Date:   Thu,  9 Mar 2023 20:44:52 +0000
Message-Id: <20230309204452.969574-6-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309204452.969574-1-conor@kernel.org>
References: <20230309204452.969574-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=825; i=conor.dooley@microchip.com; h=from:subject; bh=ul3OSqO/d4GMmYQrlW57NLjBDlDK4kMBe+YtWdntPBE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClcri4Tg0KdO75ernl0V2oP577eig86pm6uk0uz1mV1l lSoeD/vKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwEROX2Fk6L6ywa+rfynbhi5t g79SvndjfvT9W6AQF790ycVnHj3vshn+V091U3+3NuX2Ej5V6Ru8Fid5Oy9OqDp62Ewm64pm/DU 7LgA=
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
usb glue layer driver to use the new symbol.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/usb/musb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index 3a1f4bcea80c..9a8cf3de0617 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -113,7 +113,7 @@ config USB_MUSB_MEDIATEK
 
 config USB_MUSB_POLARFIRE_SOC
 	tristate "Microchip PolarFire SoC platforms"
-	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
 	depends on NOP_USB_XCEIV
 	select USB_MUSB_DUAL_ROLE
 	help
-- 
2.39.2

