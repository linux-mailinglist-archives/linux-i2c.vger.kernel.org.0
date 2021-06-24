Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0930A3B37B9
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jun 2021 22:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbhFXUYH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Jun 2021 16:24:07 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:35490 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232475AbhFXUYG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Jun 2021 16:24:06 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 7543A20DF7C0
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 1/3] i2c: iop3xx: fix deferred probing
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-i2c@vger.kernel.org>
References: <f50837d5-9eb0-61c1-6d3a-5f7d1e17b9ae@omp.ru>
Organization: Open Mobile Platform
Message-ID: <ca5278f3-9d4e-9cd0-7f0e-91b48d20735a@omp.ru>
Date:   Thu, 24 Jun 2021 23:21:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f50837d5-9eb0-61c1-6d3a-5f7d1e17b9ae@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When adding the code to handle platform_get_irq*() errors in the commit
489447380a29 ("[PATCH] handle errors returned by platform_get_irq*()"),
the actual error code was enforced to be -ENXIO in the driver for some
strange reason.  This didn't matter much until the deferred probing was
introduced -- which requires an actual error code to be propagated
upstream from the failure site.

While fixing this, also stop overriding the errors from request_irq() to
-EIO (done since the pre-git era).

Fixes: 489447380a29 ("[PATCH] handle errors returned by platform_get_irq*()")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
Changed in version 2:
- added an article and a space to the patch description;
- updated domain in the OMP email addresses.

 drivers/i2c/busses/i2c-iop3xx.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

Index: linux/drivers/i2c/busses/i2c-iop3xx.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-iop3xx.c
+++ linux/drivers/i2c/busses/i2c-iop3xx.c
@@ -467,16 +467,14 @@ iop3xx_i2c_probe(struct platform_device
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		ret = -ENXIO;
+		ret = irq;
 		goto unmap;
 	}
 	ret = request_irq(irq, iop3xx_i2c_irq_handler, 0,
 				pdev->name, adapter_data);
 
-	if (ret) {
-		ret = -EIO;
+	if (ret)
 		goto unmap;
-	}
 
 	memcpy(new_adapter->name, pdev->name, strlen(pdev->name));
 	new_adapter->owner = THIS_MODULE;
