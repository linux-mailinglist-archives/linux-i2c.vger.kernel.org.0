Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7516B2EF4
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 21:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbjCIUpn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 15:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbjCIUpe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 15:45:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2249BFC7D9;
        Thu,  9 Mar 2023 12:45:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BE128B82049;
        Thu,  9 Mar 2023 20:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0991EC433EF;
        Thu,  9 Mar 2023 20:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678394717;
        bh=EqM4N+uahcUA8b1+1yYauk84ymvGggxZFX8ZE/rCH9k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZZn0fByttXZuee6z1n2ArTUuSQdH+WLLSyJwXGczq0hKTjc3X1wGoqyituiUK2E/V
         uJmXSy3F2x+YJ7X3Yfrba42Jdfo1hcosI4VOKZCkPaFepzI/I1ANb3ZFVyIGExlonn
         9xWGd7op2Q+r2XLY3Qg6YBuT4U4xBlqZwFen/ImEdobIsq87Y2HtjjGz5iPQ5gpzAa
         eYuWJZDsMzcIlZybaYYf4gMEPu5TdnXvft8DaPDQJLVNpVTjNa0bvNq0vyn4QvFC/G
         VOPGBvq5r/9l1It0qnRTYxVO0kmP5HteHGmRDCmrvSjzvJF1Z4Ju7NvyxDytYf4Bbh
         XXNw8V0qJorwA==
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
Subject: [PATCH v1 4/5] rtc: mpfs: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Date:   Thu,  9 Mar 2023 20:44:51 +0000
Message-Id: <20230309204452.969574-5-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309204452.969574-1-conor@kernel.org>
References: <20230309204452.969574-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=791; i=conor.dooley@microchip.com; h=from:subject; bh=QXBAn8m/iPA0EANCEPLU1qNAdCRUvWn9mLls1w6rYNk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClcrs7e235f4PGXdW/Z8L7ZKPmu7eyDaRL60y6cLjTIy 2swePa6o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOJy2FkeHu0xS3vw5qd/785 HPre3zX/Y94xp7WuO55396j7n5r1+SXDH14Fu3X/9vinK6bXbaiwsr113Si8a7eOZeeZXIuDCpM EGQA=
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
RTC driver to use the new symbol.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 5a71579af0a1..753872408615 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1970,7 +1970,7 @@ config RTC_DRV_MSC313
 
 config RTC_DRV_POLARFIRE_SOC
 	tristate "Microchip PolarFire SoC built-in RTC"
-	depends on SOC_MICROCHIP_POLARFIRE
+	depends on ARCH_MICROCHIP_POLARFIRE
 	help
 	  If you say yes here you will get support for the
 	  built-in RTC on Polarfire SoC.
-- 
2.39.2

