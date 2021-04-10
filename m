Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508C035B050
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 22:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235079AbhDJUOx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 16:14:53 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:49808 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235096AbhDJUOx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Apr 2021 16:14:53 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 28C9A209B12F
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 1/6] i2c: cadence: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
To:     <linux-i2c@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>
References: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
Organization: Open Mobile Platform, LLC
Message-ID: <7166579b-c058-5c45-2f62-d9610d41a00f@omprussia.ru>
Date:   Sat, 10 Apr 2021 23:14:35 +0300
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

Fixes: df8eb5691c48 ("i2c: Add driver for Cadence I2C controller")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
Changes in version 2:
- new patch.

 drivers/i2c/busses/i2c-cadence.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Index: linux/drivers/i2c/busses/i2c-cadence.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-cadence.c
+++ linux/drivers/i2c/busses/i2c-cadence.c
@@ -1200,7 +1200,10 @@ static int cdns_i2c_probe(struct platfor
 	if (IS_ERR(id->membase))
 		return PTR_ERR(id->membase);
 
-	id->irq = platform_get_irq(pdev, 0);
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+	id->irq = ret;
 
 	id->adap.owner = THIS_MODULE;
 	id->adap.dev.of_node = pdev->dev.of_node;
