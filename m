Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCE1C3754D2
	for <lists+linux-i2c@lfdr.de>; Thu,  6 May 2021 15:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234140AbhEFNgz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 May 2021 09:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234100AbhEFNgy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 May 2021 09:36:54 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1F7C061761
        for <linux-i2c@vger.kernel.org>; Thu,  6 May 2021 06:35:55 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:f434:20f9:aa9e:b80c])
        by albert.telenet-ops.be with bizsmtp
        id 1Rbs250020ZPnBx06RbsPu; Thu, 06 May 2021 15:35:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1leeAR-003HD6-Lq; Thu, 06 May 2021 15:35:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lebyp-00Gwx8-65; Thu, 06 May 2021 13:15:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: sh_mobile: Use new clock calculation formulas for RZ/G2E
Date:   Thu,  6 May 2021 13:15:40 +0200
Message-Id: <2a1f0271cc00bf2821aa8b6609c452a9823980f6.1620299581.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When switching the Gen3 SoCs to the new clock calculation formulas, the
match entry for RZ/G2E added in commit 51243b73455f2d12 ("i2c:
sh_mobile: Add support for r8a774c0 (RZ/G2E)") was forgotten.

Fixes: e8a27567509b2439 ("i2c: sh_mobile: use new clock calculation formulas for Gen3")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 3ae6ca21a02c6b9f..2d2e630fd438712f 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -807,7 +807,7 @@ static const struct sh_mobile_dt_config r8a7740_dt_config = {
 static const struct of_device_id sh_mobile_i2c_dt_ids[] = {
 	{ .compatible = "renesas,iic-r8a73a4", .data = &fast_clock_dt_config },
 	{ .compatible = "renesas,iic-r8a7740", .data = &r8a7740_dt_config },
-	{ .compatible = "renesas,iic-r8a774c0", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,iic-r8a774c0", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,iic-r8a7790", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,iic-r8a7791", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,iic-r8a7792", .data = &v2_freq_calc_dt_config },
-- 
2.25.1

