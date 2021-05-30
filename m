Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF2F3952A2
	for <lists+linux-i2c@lfdr.de>; Sun, 30 May 2021 21:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhE3TPa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 May 2021 15:15:30 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:57414 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhE3TP3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 May 2021 15:15:29 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru C2238209EA01
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] i2c: highlander: add IRQ check
To:     <linux-i2c@vger.kernel.org>
Organization: Open Mobile Platform
Message-ID: <4be958f5-3e6c-e536-9d51-1de8664ccaaa@omp.ru>
Date:   Sun, 30 May 2021 22:13:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver is written as if platform_get_irq() returns 0 on errors (while
actually it returns a negative error code), blithely passing these error
codes to request_irq() (which takes *unsigned* IRQ #) -- which fails with
-EINVAL. Add the necessary error check to the pre-existing *if* statement
forcing the driver into the polling mode...

Fixes: 4ad48e6ab18c ("i2c: Renesas Highlander FPGA SMBus support")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'i2c/for-current' branch of Wolfram Sang's
'linux.git' repo.
Sorry, I realized just now that this patch should have been a part of
the 6-patch series (already merged)...

 drivers/i2c/busses/i2c-highlander.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/i2c/busses/i2c-highlander.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-highlander.c
+++ linux/drivers/i2c/busses/i2c-highlander.c
@@ -379,7 +379,7 @@ static int highlander_i2c_probe(struct p
 	platform_set_drvdata(pdev, dev);
 
 	dev->irq = platform_get_irq(pdev, 0);
-	if (iic_force_poll)
+	if (dev->irq < 0 || iic_force_poll)
 		dev->irq = 0;
 
 	if (dev->irq) {
