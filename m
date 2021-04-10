Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D706435B05D
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 22:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbhDJUSt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 16:18:49 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:39104 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbhDJUSt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Apr 2021 16:18:49 -0400
X-Greylist: delayed 388 seconds by postgrey-1.27 at vger.kernel.org; Sat, 10 Apr 2021 16:18:48 EDT
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 2C3612075205
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 3/6] i2c: jz4780: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
To:     <linux-i2c@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>
CC:     <linux-mips@vger.kernel.org>
References: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
Organization: Open Mobile Platform, LLC
Message-ID: <8416a7d9-2260-b3d1-b14d-4b1ed377c51c@omprussia.ru>
Date:   Sat, 10 Apr 2021 23:18:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver neglects to check the result of platform_get_irq()'s call and
blithely passes the negative error codes to devm_request_irq() (which
takes *unsigned* IRQ #), causing it to fail with -EINVAL, overriding
an original error code.  Stop calling devm_request_irq() with invalid
IRQ #s.

Fixes: ba92222ed63a ("i2c: jz4780: Add i2c bus controller driver for Ingenic JZ4780")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
Changes in version 2:
- new patch.

 drivers/i2c/busses/i2c-jz4780.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Index: linux/drivers/i2c/busses/i2c-jz4780.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-jz4780.c
+++ linux/drivers/i2c/busses/i2c-jz4780.c
@@ -825,7 +825,10 @@ static int jz4780_i2c_probe(struct platf
 
 	jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, 0x0);
 
-	i2c->irq = platform_get_irq(pdev, 0);
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		goto err;
+	i2c->irq = ret;
 	ret = devm_request_irq(&pdev->dev, i2c->irq, jz4780_i2c_irq, 0,
 			       dev_name(&pdev->dev), i2c);
 	if (ret)
