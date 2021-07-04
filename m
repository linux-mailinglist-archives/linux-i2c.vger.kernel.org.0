Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AED43BAD74
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Jul 2021 16:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhGDOlY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jul 2021 10:41:24 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:47854 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhGDOlX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Jul 2021 10:41:23 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru C25A420F1D4C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 2/5] i2c: mt65xx: fix IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-i2c@vger.kernel.org>
CC:     Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
Organization: Open Mobile Platform
Message-ID: <bab29007-8d74-0a68-2378-9db6ba0bc576@omp.ru>
Date:   Sun, 4 Jul 2021 17:38:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Iff platform_get_irq() returns 0, the driver's probe() method will return 0
early (as if the method's call was successful).  Let's consider IRQ0 valid
for simplicity -- devm_request_irq() can always override that decision...

Fixes: ce38815d39ea ("I2C: mediatek: Add driver for MediaTek I2C controller")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
 drivers/i2c/busses/i2c-mt65xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/i2c/busses/i2c-mt65xx.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-mt65xx.c
+++ linux/drivers/i2c/busses/i2c-mt65xx.c
@@ -1211,7 +1211,7 @@ static int mtk_i2c_probe(struct platform
 		return PTR_ERR(i2c->pdmabase);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
+	if (irq < 0)
 		return irq;
 
 	init_completion(&i2c->msg_complete);
