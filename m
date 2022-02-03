Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1BD4A8699
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 15:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240094AbiBCOfU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 09:35:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351529AbiBCOec (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 09:34:32 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F44C06174A
        for <linux-i2c@vger.kernel.org>; Thu,  3 Feb 2022 06:34:31 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:15aa:ab80:d2f:edb])
        by michel.telenet-ops.be with bizsmtp
        id qeaW2600C4dXKBW06eaWxk; Thu, 03 Feb 2022 15:34:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFdBu-00D0Ya-3l; Thu, 03 Feb 2022 15:34:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFdBt-002sv0-Cw; Thu, 03 Feb 2022 15:34:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779f0: Add I2C clocks
Date:   Thu,  3 Feb 2022 15:34:28 +0100
Message-Id: <e4dcee5f6f521dccd7ac7f2fb6c86cfe4a24d032.1643898820.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the module clocks used by the I2C Bus Interfaces on the Renesas
R-Car S4-8 (R8A779F0) SoC.

Extracted from a larger patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk-for-v5.18.

 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 16271b8c3ed8ea31..76b441965037798d 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -115,6 +115,12 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
+	DEF_MOD("i2c0",		518,	R8A779F0_CLK_S0D6_PER),
+	DEF_MOD("i2c1",		519,	R8A779F0_CLK_S0D6_PER),
+	DEF_MOD("i2c2",		520,	R8A779F0_CLK_S0D6_PER),
+	DEF_MOD("i2c3",		521,	R8A779F0_CLK_S0D6_PER),
+	DEF_MOD("i2c4",		522,	R8A779F0_CLK_S0D6_PER),
+	DEF_MOD("i2c5",		523,	R8A779F0_CLK_S0D6_PER),
 	DEF_MOD("scif0",	702,	R8A779F0_CLK_S0D12_PER),
 	DEF_MOD("scif1",	703,	R8A779F0_CLK_S0D12_PER),
 	DEF_MOD("scif3",	704,	R8A779F0_CLK_S0D12_PER),
-- 
2.25.1

