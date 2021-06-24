Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B593E3B37BC
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jun 2021 22:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhFXU0X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Jun 2021 16:26:23 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:34432 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhFXU0W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Jun 2021 16:26:22 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 5718420D926F
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 2/3] i2c: pca-platform: fix deferred probing
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-i2c@vger.kernel.org>
References: <f50837d5-9eb0-61c1-6d3a-5f7d1e17b9ae@omp.ru>
Organization: Open Mobile Platform
Message-ID: <67f7fcd8-797f-b943-02f7-38a0685e96f9@omp.ru>
Date:   Thu, 24 Jun 2021 23:23:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f50837d5-9eb0-61c1-6d3a-5f7d1e17b9ae@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver's probe() method chooses the polling mode if an IRQ # returned
by platform_get_irq_optional() is 0 or  less.  We'll have to filter out
-EPROBE_DEFER earlier for the deferred probing to work...

Fixes: 0e8ce93bdceb ("i2c: pca-platform: add devicetree awareness")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
Changed in version 2:
- new patch.

 drivers/i2c/busses/i2c-pca-platform.c |    2 ++
 1 file changed, 2 insertions(+)

Index: linux/drivers/i2c/busses/i2c-pca-platform.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-pca-platform.c
+++ linux/drivers/i2c/busses/i2c-pca-platform.c
@@ -139,6 +139,8 @@ static int i2c_pca_pf_probe(struct platf
 	int irq;
 
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq == -EPROBE_DEFER)
+		return irq;
 	/* If irq is 0, we do polling. */
 	if (irq < 0)
 		irq = 0;
