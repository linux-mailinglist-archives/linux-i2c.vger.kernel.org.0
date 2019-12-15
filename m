Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 502F811F8BA
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2019 17:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfLOQF0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Dec 2019 11:05:26 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:53034 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfLOQF0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Dec 2019 11:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=31nq6o0FhJYVg4tewcxCpKbXaTot0YGBzegWm9+0Z4E=; b=txzlwyYTlE+vX8hOvhZwjg6h5B
        JhRCYWxn2sjoyDFLwUMsw4GRTgzV5AIldnXGSBEtJXNU+ED2jC5am20KQwAPJLbFDA/clKK158WCO
        zsY06mqKtdtdRo1aALIVbOynxYv++InN4N81YZZfs/oQOXOFD2FyACo0Xcp3cHOjYC+3NrsskxVYg
        qFNTHGKmjX5IeiX01DWxHrXpNY8K8myCF6MqZeXmIiAVJ9dghPy6VFVYijomJYnq2pfZH3rfYfc+h
        zJxYcpoSIgnJpQiz1bFfnapS0UgSU/ZCrLRtl/JUseRgnJQq4f3IlNrX9EqD9kczZcyBGHyj3JTvJ
        AxHOIDlA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:55872 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWOZ-0001gD-HC; Sun, 15 Dec 2019 16:05:23 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWOZ-0005Dw-1I; Sun, 15 Dec 2019 16:05:23 +0000
In-Reply-To: <20191215160444.GB25745@shell.armlinux.org.uk>
References: <20191215160444.GB25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 02/12] i2c: pxa: remove unneeded includes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1igWOZ-0005Dw-1I@rmk-PC.armlinux.org.uk>
Date:   Sun, 15 Dec 2019 16:05:23 +0000
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c-pxa does not need linux/sched.h nor linux/time.h includes, so
remove these.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 966000923e8e..eddb749c9eae 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -20,8 +20,6 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/time.h>
-#include <linux/sched.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
@@ -35,8 +33,6 @@
 #include <linux/io.h>
 #include <linux/platform_data/i2c-pxa.h>
 
-#include <asm/irq.h>
-
 struct pxa_reg_layout {
 	u32 ibmr;
 	u32 idbr;
-- 
2.20.1

