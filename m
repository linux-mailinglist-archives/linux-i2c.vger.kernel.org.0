Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE00C353947
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Apr 2021 19:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhDDR6x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Apr 2021 13:58:53 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:59166 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhDDR6w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Apr 2021 13:58:52 -0400
X-Greylist: delayed 354 seconds by postgrey-1.27 at vger.kernel.org; Sun, 04 Apr 2021 13:58:52 EDT
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 17E0A206FFD0
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
Subject: [PATCH] i2c: rcar: add IRQ check
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <linux-i2c@vger.kernel.org>
Organization: Open Mobile Platform, LLC
CC:     <linux-renesas-soc@vger.kernel.org>
Message-ID: <8a05ea84-28e6-4d76-4f6d-55fb0a0cdf24@omprussia.ru>
Date:   Sun, 4 Apr 2021 20:52:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
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

The driver neglects to check the result of platform_get_irq()'s call and
blithely passes the negative error codes to devm_request_irq() (which
takes *unsigned* IRQ #), causing it to fail with -EINVAL, overriding
an original error code.  Stop calling devm_request_irq() with the
invalid IRQ #s.

Fixes: 6ccbe607132b ("i2c: add Renesas R-Car I2C driver")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
 drivers/i2c/busses/i2c-rcar.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: linux/drivers/i2c/busses/i2c-rcar.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-rcar.c
+++ linux/drivers/i2c/busses/i2c-rcar.c
@@ -1027,7 +1027,9 @@ static int rcar_i2c_probe(struct platfor
 	if (of_property_read_bool(dev->of_node, "smbus"))
 		priv->flags |= ID_P_HOST_NOTIFY;
 
-	priv->irq = platform_get_irq(pdev, 0);
+	priv->irq = ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		goto out_pm_disable;
 	ret = devm_request_irq(dev, priv->irq, irqhandler, irqflags, dev_name(dev), priv);
 	if (ret < 0) {
 		dev_err(dev, "cannot get irq %d\n", priv->irq);
