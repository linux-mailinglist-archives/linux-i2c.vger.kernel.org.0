Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B555411F8C1
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2019 17:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfLOQGC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Dec 2019 11:06:02 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:53068 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfLOQGC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Dec 2019 11:06:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+5Rs6v4WoQ+GCsjvYyQM3WE086ynhM1HY48NCH6/zzo=; b=XWhaSWEu9eNCAuKH/NEoMJPzmV
        6qGkNWBkzci+BBbSngeBAEeXwT4z4/qBlEvz7TmFQOmJALF9AKK4Td0xZ2WAyePSnDlspfOxtFDa0
        edqZ7LuGfZf6HCkqnbeEw+W+uEoHuqp07b8bl+3UEb5H3Mk74PrGDcpQMisO9QGXxUKfd9NDLNQlx
        CLrT6DSEdaGS2rAdcCSP0h9ea4CD+2lPJ0KKJ9nL6HF7UBpnJrMEBWx1Eqivzrz4csWAN27uuXo0r
        CSMH7QsZQ6hY/dv9odGcDd5obZ44dGMqvSazHmEq+JXkEjvsCPS1+mMhcofWcRpdgixP5LUG1pdVi
        E5fS3W2g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:55886 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWP9-0001gv-FP; Sun, 15 Dec 2019 16:05:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWP8-0005Em-Vm; Sun, 15 Dec 2019 16:05:59 +0000
In-Reply-To: <20191215160444.GB25745@shell.armlinux.org.uk>
References: <20191215160444.GB25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 09/12] i2c: pxa: move DT IDs along side platform IDs
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1igWP8-0005Em-Vm@rmk-PC.armlinux.org.uk>
Date:   Sun, 15 Dec 2019 16:05:58 +0000
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
index 482768a9fdd2..760a29fb6af5 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -200,6 +200,15 @@ static struct pxa_reg_layout pxa_reg_layout[] = {
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
@@ -1184,15 +1193,6 @@ static const struct i2c_algorithm i2c_pxa_pio_algorithm = {
 	.functionality	= i2c_pxa_functionality,
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

