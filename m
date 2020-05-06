Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDD91C6CEF
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 11:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728892AbgEFJ32 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 05:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728663AbgEFJ31 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 05:29:27 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336B0C061A0F
        for <linux-i2c@vger.kernel.org>; Wed,  6 May 2020 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=usnZlGd0l7S0YVKgRXpMoxnirBndOK1pwVhbbD7tdcE=; b=PbhAGW9TECatmV0jlZ5o35kYNi
        n9n85XAM1enIQOW7ZCyuBOLUvpmGCdbSiHLfZce1hMp/Stzvh0jua5szYH4TWxi9e+7sS+RvITJHO
        pbR2oOhz3kx5pjDTeEakZgis/D3AF1zPJmxyhWa8ffObf0ZjtsXtxlfchy3mzVhKQJCx9n8mKTvP7
        evG+mhoXevRkCjnaEbx1Sx7cY1W4QvmqIhY5gj2VbNIkcStuHJN7/v1r3tpfB9nT39IaIvNOe+0pU
        /WvPHBxR9t7Lw/XHJiGbRGPKgvYOaa4uan623e2zgtO2UY0LTcziFoZyKaU8IHnYq63iPSx7SMahm
        6zVAsT4g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:58836 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jWGMl-0007li-ID; Wed, 06 May 2020 10:29:23 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jWGMk-0000NP-Vi; Wed, 06 May 2020 10:29:23 +0100
In-Reply-To: <20200506092831.GN1551@shell.armlinux.org.uk>
References: <20200506092831.GN1551@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 3/4] i2c: pxa: ensure timeout messages are unique
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jWGMk-0000NP-Vi@rmk-PC.armlinux.org.uk>
Date:   Wed, 06 May 2020 10:29:22 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ensure that the various timeout messages can identify where in the code
they were produced from to aid debugging.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index f20f8b905793..0becab239476 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1095,7 +1095,7 @@ static int i2c_pxa_do_xfer(struct pxa_i2c *i2c, struct i2c_msg *msg, int num)
 	ret = i2c->msg_idx;
 
 	if (!timeout && i2c->msg_num) {
-		i2c_pxa_scream_blue_murder(i2c, "timeout");
+		i2c_pxa_scream_blue_murder(i2c, "timeout with active message");
 		ret = I2C_RETRY;
 	}
 
@@ -1169,7 +1169,7 @@ static int i2c_pxa_pio_set_master(struct pxa_i2c *i2c)
 	if (timeout < 0) {
 		show_state(i2c);
 		dev_err(&i2c->adap.dev,
-			"i2c_pxa: timeout waiting for bus free\n");
+			"i2c_pxa: timeout waiting for bus free (set_master)\n");
 		return I2C_RETRY;
 	}
 
@@ -1213,7 +1213,7 @@ static int i2c_pxa_do_pio_xfer(struct pxa_i2c *i2c,
 
 out:
 	if (timeout == 0) {
-		i2c_pxa_scream_blue_murder(i2c, "timeout");
+		i2c_pxa_scream_blue_murder(i2c, "timeout (do_pio_xfer)");
 		ret = I2C_RETRY;
 	}
 
-- 
2.20.1

