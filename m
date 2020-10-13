Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61F0628CFEC
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Oct 2020 16:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388449AbgJMOMF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Oct 2020 10:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388446AbgJMOMF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Oct 2020 10:12:05 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25CB9C0613D2
        for <linux-i2c@vger.kernel.org>; Tue, 13 Oct 2020 07:12:04 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id fSC22300U4C55Sk06SC26L; Tue, 13 Oct 2020 16:12:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kSL22-00064A-MP; Tue, 13 Oct 2020 16:12:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kSL22-0007Nq-K8; Tue, 13 Oct 2020 16:12:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: sh_mobile: Mark adapter suspended during suspend
Date:   Tue, 13 Oct 2020 16:12:01 +0200
Message-Id: <20201013141201.28338-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When a driver tries to send an I2C message while the adapter is
suspended, this typically fails with:

    i2c-sh_mobile e60b0000.i2c: Transfer request timed out

Avoid accessing the adapter while it is suspended by marking it
suspended during suspend.  This allows the I2C core to catch this, and
print a warning:

    WARNING: CPU: 1 PID: 13 at drivers/i2c/i2c-core.h:54
__i2c_transfer+0x4a4/0x4e4
    i2c i2c-6: Transfer while suspended

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This follows the same approach as commit 18569fa89a4db9ed ("i2c: rcar:
add suspend/resume support").
Exposed by commit dc279ac6e5b4e06e ("cpufreq: dt: Refactor
initialization to handle probe deferral properly") in linux-next, which
tries to talk to the PMIC on r8a7791/koelsch while the I2C controller is
suspended.
---
 drivers/i2c/busses/i2c-sh_mobile.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index bdd60770779ad523..3ae6ca21a02c6b9f 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -956,10 +956,38 @@ static int sh_mobile_i2c_remove(struct platform_device *dev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int sh_mobile_i2c_suspend(struct device *dev)
+{
+	struct sh_mobile_i2c_data *pd = dev_get_drvdata(dev);
+
+	i2c_mark_adapter_suspended(&pd->adap);
+	return 0;
+}
+
+static int sh_mobile_i2c_resume(struct device *dev)
+{
+	struct sh_mobile_i2c_data *pd = dev_get_drvdata(dev);
+
+	i2c_mark_adapter_resumed(&pd->adap);
+	return 0;
+}
+
+static const struct dev_pm_ops sh_mobile_i2c_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(sh_mobile_i2c_suspend,
+				      sh_mobile_i2c_resume)
+};
+
+#define DEV_PM_OPS (&sh_mobile_i2c_pm_ops)
+#else
+#define DEV_PM_OPS NULL
+#endif /* CONFIG_PM_SLEEP */
+
 static struct platform_driver sh_mobile_i2c_driver = {
 	.driver		= {
 		.name		= "i2c-sh_mobile",
 		.of_match_table = sh_mobile_i2c_dt_ids,
+		.pm	= DEV_PM_OPS,
 	},
 	.probe		= sh_mobile_i2c_probe,
 	.remove		= sh_mobile_i2c_remove,
-- 
2.17.1

