Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345CC3BAD79
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Jul 2021 16:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhGDOoa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jul 2021 10:44:30 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:39428 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbhGDOo1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Jul 2021 10:44:27 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 1FAF920CDDCA
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 3/5] i2c: pmcmsp: fix IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-i2c@vger.kernel.org>
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
Organization: Open Mobile Platform
Message-ID: <fd0dd13c-2fe7-c954-ff0f-917067c8252c@omp.ru>
Date:   Sun, 4 Jul 2021 17:41:50 +0300
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

The driver's probe() method is written as if platform_get_irq() returns 0
on error, while actually it returns a negative error code (with all the
other values considered valid IRQs).  Rewrite the driver's IRQ checking
code to pass the positive IRQ #s to request_irq() and use polling mode
when platform_get_irq() returns negative error code (or IRQ0)...

Fixes: 1b144df1d7d6 ("i2c: New PMC MSP71xx TWI bus driver")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
Changes in version 2:
- fixed the IRQ validity check, assigning the result of platform_get_irq() call
  to the 'rc' variable first;
- merging the code enforcing the polling mode on bad IRQ in one place (after
  calling request_irq() and handling its result);
- removed explicit check for the deferred probe, fixed up the patch description
  accordingly;
- removed the dashes in the patch subject;
- refreshed the patch.

drivers/i2c/busses/i2c-pmcmsp.c |    8 +++++---
 drivers/i2c/busses/i2c-pmcmsp.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

Index: linux/drivers/i2c/busses/i2c-pmcmsp.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-pmcmsp.c
+++ linux/drivers/i2c/busses/i2c-pmcmsp.c
@@ -291,8 +291,9 @@ static int pmcmsptwi_probe(struct platfo
 	}
 
 	/* request the irq */
-	pmcmsptwi_data.irq = platform_get_irq(pldev, 0);
-	if (pmcmsptwi_data.irq) {
+	rc = platform_get_irq(pldev, 0);
+	pmcmsptwi_data.irq = rc;
+	if (rc > 0) {
 		rc = request_irq(pmcmsptwi_data.irq, &pmcmsptwi_interrupt,
 				 IRQF_SHARED, pldev->name, &pmcmsptwi_data);
 		if (rc == 0) {
@@ -312,9 +313,14 @@ static int pmcmsptwi_probe(struct platfo
 				"Could not assign TWI IRQ handler "
 				"to irq %d (continuing with poll)\n",
 				pmcmsptwi_data.irq);
-			pmcmsptwi_data.irq = 0;
 		}
 	}
+	/*
+	 * We only get here with a negative rc if either platform_get_irq() or
+	 * request_irq() call has failed; we have to enforce the polling mode...
+	 */
+	if (rc < 0)
+		pmcmsptwi_data.irq = 0;
 
 	init_completion(&pmcmsptwi_data.wait);
 	mutex_init(&pmcmsptwi_data.lock);
