Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F783EABE2
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Aug 2021 22:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhHLUjm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Aug 2021 16:39:42 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:57128 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhHLUjl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Aug 2021 16:39:41 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru F0B6220C59C0
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 2/2] i2c: synquacer: fix deferred probing
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-i2c@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>
References: <07588701-4f82-2390-8781-5e6965e87eb4@omp.ru>
Organization: Open Mobile Platform
Message-ID: <1ab424b2-95b8-76ab-9d18-9362d1595887@omp.ru>
Date:   Thu, 12 Aug 2021 23:39:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <07588701-4f82-2390-8781-5e6965e87eb4@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver overrides the error codes returned by platform_get_irq() to
-ENODEV, so if it returns -EPROBE_DEFER, the driver will fail the probe
permanently instead of the deferred probing. Switch to propagating the
error codes upstream...

Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C controller")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
 drivers/i2c/busses/i2c-synquacer.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/i2c/busses/i2c-synquacer.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-synquacer.c
+++ linux/drivers/i2c/busses/i2c-synquacer.c
@@ -578,7 +578,7 @@ static int synquacer_i2c_probe(struct pl
 
 	i2c->irq = platform_get_irq(pdev, 0);
 	if (i2c->irq < 0)
-		return -ENODEV;
+		return i2c->irq;
 
 	ret = devm_request_irq(&pdev->dev, i2c->irq, synquacer_i2c_isr,
 			       0, dev_name(&pdev->dev), i2c);
