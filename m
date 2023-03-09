Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 083CF6B2EE2
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 21:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjCIUpT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 15:45:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbjCIUpS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 15:45:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A07F223D;
        Thu,  9 Mar 2023 12:45:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5870461CCE;
        Thu,  9 Mar 2023 20:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD14C4339E;
        Thu,  9 Mar 2023 20:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678394705;
        bh=4IfoY/bbroiP53DxnZ4NNZvrfCSorep2t6Qs0c/sebU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c4Yhr/ZNbaRVfUI7lGwd7L24ItwpYq9Fr8sgkGLb0YwqrqAhFmA2isyafBmoDNUV+
         4oGJQrQdID49/2AgDEli4k2WWpwIyj0WFNwQCB41GwIS4VwvpTaxMRtkgDjuH9jr7o
         R5/GhH6HusIDuunoIHR3CZsHjWaCM7EdGfVUmu18+PJlRwoBSqlviL8sfcQfgqqjNF
         dSJH6EM0O/4aDAyQuN8Wok2s8il9L9kuraP5efamv0i3qVdXjJ3BEMbF/lI/BPVeeB
         KZt65J+CLtJuXm7+xF6OHkhlb+FyisskbvKrFrH/ocpOZaGNRsdt1TmbDKjIHpdmAZ
         JnL4rBlwk744g==
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
Subject: [PATCH v1 1/5] clk: microchip: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Date:   Thu,  9 Mar 2023 20:44:48 +0000
Message-Id: <20230309204452.969574-2-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309204452.969574-1-conor@kernel.org>
References: <20230309204452.969574-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=913; i=conor.dooley@microchip.com; h=from:subject; bh=GLo98GdmfUkBToAEl5LLBzwXzoe49NY0BWaVOVDKKCk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClcrs5aoZWqWxYXpSrenh1SsebEvB9XW9WvSzS+794QI 9ZXfSCio5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABMRDGdkaL3rN1n5bb9loa+z ZdBVl1Oy8futXfjnHckMrbDa8PB0NcP/MnVz+/P3Fq9M3LZj6trNWRN2b1FS9Jznsd2d/+vxy88 j+AA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
use of such symbols on other architectures, convert the Microchip FPGA
clock drivers to use the new symbol.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
index e33e51978938..0724ce65898f 100644
--- a/drivers/clk/microchip/Kconfig
+++ b/drivers/clk/microchip/Kconfig
@@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
 
 config MCHP_CLK_MPFS
 	bool "Clk driver for PolarFire SoC"
-	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
-	default SOC_MICROCHIP_POLARFIRE
+	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
+	default ARCH_MICROCHIP_POLARFIRE
 	select AUXILIARY_BUS
 	help
 	  Supports Clock Configuration for PolarFire SoC
-- 
2.39.2

