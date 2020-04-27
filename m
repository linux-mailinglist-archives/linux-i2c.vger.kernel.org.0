Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614171BAD25
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 20:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgD0StV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 14:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbgD0StV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 14:49:21 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6828EC0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 11:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=FvldgimPz2+7PD78mmDFbQDJkcV4arzOK7gtUhikkdw=; b=jgpu2Iu5VrA1obgDMLNTy+J7Sy
        skpNcO2bdTnhmYizBmimecUJ0X6wpn9pLaM2wmlSnbtgiV4J3YLtsPpBhw2CCMDevfWyRxmWS/5pJ
        rLlPRWP6yUvsDmQ2fs2UK82GKRv5h/pO4N+4kxUwevqzveo7OpVOsu7c7b1noLIgi2eytsnFyYPp8
        WcNvHkf8sEL0b8kZWQrDqRJ0rzNP8oejS2omHDHSOBF6hAmJNEElC7RlPZV5CjsIdwbGjMubUlNiu
        UlnyZxi1IOyGGUKpaE8fdJeho9QHsn6UL3TfJAD5PidLAwoayqXcBOsdFDlrHZc7UyGpTn2DbwwQQ
        JAuTTUyA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:43066 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT8of-0004Sv-QR; Mon, 27 Apr 2020 19:49:17 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT8of-0002vC-9O; Mon, 27 Apr 2020 19:49:17 +0100
In-Reply-To: <20200427184658.GM25745@shell.armlinux.org.uk>
References: <20200427184658.GM25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH v2 09/12] i2c: pxa: move DT IDs along side platform IDs
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT8of-0002vC-9O@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 19:49:17 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move the ID tables into one place, near the device dependent data.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 02e06f8bf247..49548908b076 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -199,6 +199,15 @@ static struct pxa_reg_layout pxa_reg_layout[] = {
 	},
 };
 
+static const struct of_device_id i2c_pxa_dt_ids[] = {
+	{ .compatible = "mrvl,pxa-i2c", .data = (void *)REGS_PXA2XX },
+	{ .compatible = "mrvl,pwri2c", .data = (void *)REGS_PXA3XX },
+	{ .compatible = "mrvl,mmp-twsi", .data = (void *)REGS_PXA910 },
+	{ .compatible = "marvell,armada-3700-i2c", .data = (void *)REGS_A3700 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, i2c_pxa_dt_ids);
+
 static const struct platform_device_id i2c_pxa_id_table[] = {
 	{ "pxa2xx-i2c",		REGS_PXA2XX },
 	{ "pxa3xx-pwri2c",	REGS_PXA3XX },
@@ -1230,15 +1239,6 @@ static const struct i2c_algorithm i2c_pxa_pio_algorithm = {
 #endif
 };
 
-static const struct of_device_id i2c_pxa_dt_ids[] = {
-	{ .compatible = "mrvl,pxa-i2c", .data = (void *)REGS_PXA2XX },
-	{ .compatible = "mrvl,pwri2c", .data = (void *)REGS_PXA3XX },
-	{ .compatible = "mrvl,mmp-twsi", .data = (void *)REGS_PXA910 },
-	{ .compatible = "marvell,armada-3700-i2c", .data = (void *)REGS_A3700 },
-	{}
-};
-MODULE_DEVICE_TABLE(of, i2c_pxa_dt_ids);
-
 static int i2c_pxa_probe_dt(struct platform_device *pdev, struct pxa_i2c *i2c,
 			    enum pxa_i2c_types *i2c_types)
 {
-- 
2.20.1

