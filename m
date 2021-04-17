Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240583631EC
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 21:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235234AbhDQTFi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Apr 2021 15:05:38 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:56088 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbhDQTFi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Apr 2021 15:05:38 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru D79BF2077B6F
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
Subject: [PATCH] i2c: sh7760: fix IRQ error path
To:     <linux-i2c@vger.kernel.org>
References: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
Organization: Open Mobile Platform, LLC
Message-ID: <5b81bf63-edc4-bb62-3aff-4ae9432e339b@omprussia.ru>
Date:   Sat, 17 Apr 2021 22:05:05 +0300
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

While adding the invalid IRQ check after calling platform_get_irq(),
I managed to overlook that the driver has a complex error path in its
probe() method, thus a simple *return* couldn't be used.  Use a proper
*goto* instead!

Fixes: e5b2e3e74201 ("i2c: sh7760: add IRQ check")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
This patch is against the '2c/for-next' branch of Wolfram's 'linux.git' repo.
I wasn't even able to complie-test it though...

 drivers/i2c/busses/i2c-sh7760.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/i2c/busses/i2c-sh7760.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-sh7760.c
+++ linux/drivers/i2c/busses/i2c-sh7760.c
@@ -473,7 +473,7 @@ static int sh7760_i2c_probe(struct platf
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		return ret;
+		goto out3;
 	id->irq = ret;
 
 	id->adap.nr = pdev->id;
