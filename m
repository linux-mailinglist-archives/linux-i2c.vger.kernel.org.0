Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196E011F8C4
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2019 17:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfLOQGS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Dec 2019 11:06:18 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:53084 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfLOQGR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Dec 2019 11:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nhI4WOnfcRjOXumghUArWnaYrb/WIbBSfeK1KQYaOfs=; b=kox3FYb/Z+S3CUDO/0JiWoJG2G
        HNuhLJsdXxhVb87ihcRsA+IDaXBZ+Ogrb2Pa5ZGpl96OAYW7q5LVsHFYVqPbdROMvnNAelWbdi4PM
        caBnacevFmZmbvKKVjw07WFg4mG145IvdRSG9Oq36rnNzFUAwEbPIIAkZTTaJpVxfgwg3vA3uk8sy
        bYacXqYi+s9uWIMh1f8RxxDKXEqQS1CmYoyI5m30vku5/6qnYwctUgVN3BkIfnlD7u9OgC9kPYMk4
        C5GnhqIoB8kla5JFOLvX/e9i8ZgpJj73pFbSwXsi+EsVMy/K1Qw1m6mxMgISP1NB7HQ+vji/BYE69
        IojwyHuQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:55892 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWPO-0001hP-SP; Sun, 15 Dec 2019 16:06:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWPO-0005F7-CE; Sun, 15 Dec 2019 16:06:14 +0000
In-Reply-To: <20191215160444.GB25745@shell.armlinux.org.uk>
References: <20191215160444.GB25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 12/12] i2c: pxa: fix i2c_pxa_wait_bus_not_busy() boundary
 condition
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1igWPO-0005F7-CE@rmk-PC.armlinux.org.uk>
Date:   Sun, 15 Dec 2019 16:06:14 +0000
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix i2c_pxa_wait_bus_not_busy()'s boundary conditions, so that a
coincidental success and timeout results in the function returning
success.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index b2c7765756e2..19505ffbb8f1 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -417,19 +417,26 @@ static void i2c_pxa_abort(struct pxa_i2c *i2c)
 static int i2c_pxa_wait_bus_not_busy(struct pxa_i2c *i2c)
 {
 	int timeout = DEF_TIMEOUT;
+	u32 isr;
 
-	while (timeout-- && readl(_ISR(i2c)) & (ISR_IBB | ISR_UB)) {
-		if ((readl(_ISR(i2c)) & ISR_SAD) != 0)
+	while (1) {
+		isr = readl(_ISR(i2c));
+		if (!(isr & (ISR_IBB | ISR_UB)))
+			return 0;
+
+		if (isr & ISR_SAD)
 			timeout += 4;
 
+		if (!timeout--)
+			break;
+
 		msleep(2);
 		show_state(i2c);
 	}
 
-	if (timeout < 0)
-		show_state(i2c);
+	show_state(i2c);
 
-	return timeout < 0 ? I2C_RETRY : 0;
+	return I2C_RETRY;
 }
 
 static int i2c_pxa_wait_master(struct pxa_i2c *i2c)
-- 
2.20.1

