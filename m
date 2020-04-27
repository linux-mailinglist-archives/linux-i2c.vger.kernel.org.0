Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F052B1BA763
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgD0PJN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727881AbgD0PJN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:09:13 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9197C0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hE0lCwUn74s457+Pi9y1JVQpI1P86DkWj5oQF/pmfVs=; b=VRvf787l4G2QPeZ9Wx6J1C3b1Y
        HqzTojzxtN9WjkUptx2/F6KF1EqNGkpAqTEP4tiT5MHu3EdXU5bVXh90vYYKiZS3A5Bc5QVyVaO9C
        v4G6Y0NBGz/CQfCNp+P1GeF9mKgdn5QOqY2S0BrOnulqWaSVJG1LYuIh/2Fd1diVxsT6jVNT4ne/e
        d/WBwohuFaPTvBDE1Fsu0G2VUiwyr4sCxin972JJ9XVv655+ASVXl/PfPhApHCoeydN1SfoMSnvhs
        raVP3WldVYVqcxaTA9RClWW4NG3bh2OE/hY+q+nSEKkNHHMxCZhKt5uP3S81DTsk023CY3Fo4mGo3
        jw789rew==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:54314 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5Nd-0003YG-5E; Mon, 27 Apr 2020 16:09:09 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5Nc-0001rQ-Ay; Mon, 27 Apr 2020 16:09:08 +0100
In-Reply-To: <20200427150755.GT5827@shell.armlinux.org.uk>
References: <20200427150755.GT5827@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH REPOST 07/12] i2c: pxa: always set fm and hs members for each
 type
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT5Nc-0001rQ-Ay@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 16:09:08 +0100
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
index 6a7e8e1f7ca3..91e0cccb3707 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -113,6 +113,8 @@ static struct pxa_reg_layout pxa_reg_layout[] = {
 		.icr =	0x10,
 		.isr =	0x18,
 		.isar =	0x20,
+		.fm = ICR_FM,
+		.hs = ICR_HS,
 	},
 	[REGS_PXA3XX] = {
 		.ibmr =	0x00,
@@ -120,6 +122,8 @@ static struct pxa_reg_layout pxa_reg_layout[] = {
 		.icr =	0x08,
 		.isr =	0x0c,
 		.isar =	0x10,
+		.fm = ICR_FM,
+		.hs = ICR_HS,
 	},
 	[REGS_CE4100] = {
 		.ibmr =	0x14,
@@ -127,6 +131,8 @@ static struct pxa_reg_layout pxa_reg_layout[] = {
 		.icr =	0x00,
 		.isr =	0x04,
 		/* no isar register */
+		.fm = ICR_FM,
+		.hs = ICR_HS,
 	},
 	[REGS_PXA910] = {
 		.ibmr = 0x00,
@@ -136,6 +142,8 @@ static struct pxa_reg_layout pxa_reg_layout[] = {
 		.isar = 0x20,
 		.ilcr = 0x28,
 		.iwcr = 0x30,
+		.fm = ICR_FM,
+		.hs = ICR_HS,
 	},
 	[REGS_A3700] = {
 		.ibmr =	0x00,
@@ -1282,8 +1290,8 @@ static int i2c_pxa_probe(struct platform_device *dev)
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

