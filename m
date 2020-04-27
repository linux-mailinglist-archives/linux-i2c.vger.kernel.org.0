Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4661BAD2C
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 20:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgD0Sth (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 14:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbgD0Stg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 14:49:36 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7BCC0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 11:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7rp1VWvU8MuJnY7NlG2T1c85vDHwrU+eMhPceX4oTGs=; b=ieYSWlsGd4vO0e0HdGim8tQZfZ
        e79AjHESWCmxkCzRs212rCdt7cz4E1F0zMHUzxeyJ5wik2Z5R0zD6yiGJDwVFxcB52VNZ7ULb+Z+g
        dw3e+hi4yOw4l6Y3exN2S/yorpoS+1vEh9V162H6Jtw2VcfazDDR4livRZ9h4WU9NlHqw5dS7kCUs
        UJhPZI5KlG1LpFjMgGQRtJzfki3T8ZbhtbrdbFCBDox5hUKmch9tK7D8qCEok8T5BnuokUtPDPO94
        /HBHDO0ZzjzqgbW8AIyE7g9t7qJcqFhIvoVfkhcCc7SGbcSJ1zCpMXFYNDj5WtHyhMnuriIxINc9n
        k8rXw6Rg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58380 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT8ov-0004TD-3t; Mon, 27 Apr 2020 19:49:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT8ou-0002vu-Jj; Mon, 27 Apr 2020 19:49:32 +0100
In-Reply-To: <20200427184658.GM25745@shell.armlinux.org.uk>
References: <20200427184658.GM25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH v2 12/12] i2c: pxa: fix i2c_pxa_wait_bus_not_busy() boundary
 condition
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT8ou-0002vu-Jj@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 19:49:32 +0100
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
index f0205c47286c..e6bc21ece5e0 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -416,19 +416,26 @@ static void i2c_pxa_abort(struct pxa_i2c *i2c)
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

