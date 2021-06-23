Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624A83B2220
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 22:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhFWVBT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 17:01:19 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:59696 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWVBT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Jun 2021 17:01:19 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 4E1FA20BBB08
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH 3/5] i2c: pmcmsp: fix-IRQ-check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-i2c@vger.kernel.org>
References: <e51f8c48-a63e-57e4-ffc7-157c2534611b@omp.ru>
Organization: Open Mobile Platform
Message-ID: <31a2d0c2-8069-6a73-ef7e-40e1146d5c56@omp.ru>
Date:   Wed, 23 Jun 2021 23:58:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e51f8c48-a63e-57e4-ffc7-157c2534611b@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver's probe() method is written as if platform_get_irq() returns 0
on error, while actually it returns a negative error code (with all the
other values considered valid IRQs).  Rewrite the driver's IRQ checking
code to pass the positive IRQ #s to request_irq(), propagate -EPROBE_DEFER
upstream, and use the polling mode when platform_get_irq() returns negative
error code or 0...

Fixes: 1b144df1d7d6 ("i2c: New PMC MSP71xx TWI bus driver")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
 drivers/i2c/busses/i2c-pmcmsp.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

Index: linux/drivers/i2c/busses/i2c-pmcmsp.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-pmcmsp.c
+++ linux/drivers/i2c/busses/i2c-pmcmsp.c
@@ -291,8 +291,13 @@ static int pmcmsptwi_probe(struct platfo
 	}
 
 	/* request the irq */
-	pmcmsptwi_data.irq = platform_get_irq(pldev, 0);
-	if (pmcmsptwi_data.irq) {
+	rc = platform_get_irq(pldev, 0);
+	if (rc == -EPROBE_DEFER)
+		return rc;
+	if (rc <= 0) {
+		pmcmsptwi_data.irq = 0;
+	} else {
+		pmcmsptwi_data.irq = rc;
 		rc = request_irq(pmcmsptwi_data.irq, &pmcmsptwi_interrupt,
 				 IRQF_SHARED, pldev->name, &pmcmsptwi_data);
 		if (rc == 0) {


