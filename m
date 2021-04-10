Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8E435B056
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 22:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbhDJUQ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 16:16:58 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:39086 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234708AbhDJUQ6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Apr 2021 16:16:58 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 526022075200
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 2/6] i2c: emev2: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
To:     <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
Organization: Open Mobile Platform, LLC
Message-ID: <143f8d66-eb9e-20aa-ad6f-6927194e1012@omprussia.ru>
Date:   Sat, 10 Apr 2021 23:16:41 +0300
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

Fixes: 5faf6e1f58b4 ("i2c: emev2: add driver")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
Changes in version 2:
- new patch.

 drivers/i2c/busses/i2c-emev2.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Index: linux/drivers/i2c/busses/i2c-emev2.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-emev2.c
+++ linux/drivers/i2c/busses/i2c-emev2.c
@@ -395,7 +395,10 @@ static int em_i2c_probe(struct platform_
 
 	em_i2c_reset(&priv->adap);
 
-	priv->irq = platform_get_irq(pdev, 0);
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		goto err_clk;
+	priv->irq = ret;
 	ret = devm_request_irq(&pdev->dev, priv->irq, em_i2c_irq_handler, 0,
 				"em_i2c", priv);
 	if (ret)


