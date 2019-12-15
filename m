Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB82F11F8BF
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2019 17:10:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfLOQFw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Dec 2019 11:05:52 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:53056 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfLOQFw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Dec 2019 11:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=zIbB3YDsKxGal6YsQ8KhKTNUfU+aZv98nt8f6ggS5uk=; b=B4eAOvZDnyfQYpuqOPG8egqS1Q
        b9kh3wpVC7EVcXP6DeQG78OMSUU2I5kwy7PMv/753MImHzwExBubInmHv7PEXUIfstM4UiH3IP2X9
        2rAh0NuQZUMM+CQlPquXbokozRdDAq/UtoW0LYWxu4GqoqlFew7EP20lfORqdY8NP3eEDHr16WiVb
        RY+P85lLMdOw+iYZ7I2+xEil7tOoENwdRB+r6jfU/H0uoXG+GGl2cYnHjyvGbRO2OKN82uBBXg+c1
        OmHE+dUaNedvqoHIGJf2yadrDA4f+K24/C4KWeuj/jXR+1II2v4XLS407i3OdPuaWkwpB3kR6E868
        xuu9yFdw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60124 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWOz-0001gj-88; Sun, 15 Dec 2019 16:05:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWOy-0005EW-Nm; Sun, 15 Dec 2019 16:05:48 +0000
In-Reply-To: <20191215160444.GB25745@shell.armlinux.org.uk>
References: <20191215160444.GB25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 07/12] i2c: pxa: always set fm and hs members for each type
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1igWOy-0005EW-Nm@rmk-PC.armlinux.org.uk>
Date:   Sun, 15 Dec 2019 16:05:48 +0000
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Always set the fm and hs members of struct pxa_reg_layout. These
members are already taking space, we don't need code as well.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index b3286d7ab75d..05dbe6bf4633 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -114,6 +114,8 @@ static struct pxa_reg_layout pxa_reg_layout[] = {
 		.icr =	0x10,
 		.isr =	0x18,
 		.isar =	0x20,
+		.fm = ICR_FM,
+		.hs = ICR_HS,
 	},
 	[REGS_PXA3XX] = {
 		.ibmr =	0x00,
@@ -121,6 +123,8 @@ static struct pxa_reg_layout pxa_reg_layout[] = {
 		.icr =	0x08,
 		.isr =	0x0c,
 		.isar =	0x10,
+		.fm = ICR_FM,
+		.hs = ICR_HS,
 	},
 	[REGS_CE4100] = {
 		.ibmr =	0x14,
@@ -128,6 +132,8 @@ static struct pxa_reg_layout pxa_reg_layout[] = {
 		.icr =	0x00,
 		.isr =	0x04,
 		/* no isar register */
+		.fm = ICR_FM,
+		.hs = ICR_HS,
 	},
 	[REGS_PXA910] = {
 		.ibmr = 0x00,
@@ -137,6 +143,8 @@ static struct pxa_reg_layout pxa_reg_layout[] = {
 		.isar = 0x20,
 		.ilcr = 0x28,
 		.iwcr = 0x30,
+		.fm = ICR_FM,
+		.hs = ICR_HS,
 	},
 	[REGS_A3700] = {
 		.ibmr =	0x00,
@@ -1235,8 +1243,8 @@ static int i2c_pxa_probe(struct platform_device *dev)
 	i2c->reg_idbr = i2c->reg_base + pxa_reg_layout[i2c_type].idbr;
 	i2c->reg_icr = i2c->reg_base + pxa_reg_layout[i2c_type].icr;
 	i2c->reg_isr = i2c->reg_base + pxa_reg_layout[i2c_type].isr;
-	i2c->fm_mask = pxa_reg_layout[i2c_type].fm ? : ICR_FM;
-	i2c->hs_mask = pxa_reg_layout[i2c_type].hs ? : ICR_HS;
+	i2c->fm_mask = pxa_reg_layout[i2c_type].fm;
+	i2c->hs_mask = pxa_reg_layout[i2c_type].hs;
 
 	if (i2c_type != REGS_CE4100)
 		i2c->reg_isar = i2c->reg_base + pxa_reg_layout[i2c_type].isar;
-- 
2.20.1

