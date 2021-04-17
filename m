Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD5B36324A
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 22:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237017AbhDQU7z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Apr 2021 16:59:55 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:59118 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236143AbhDQU7y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Apr 2021 16:59:54 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru B67D620C841D
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH 2/2] i2c: synquacer: fix deferred probing
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
To:     <linux-i2c@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>
References: <dfa042b7-8b80-ee2b-451b-7cedaeadfd02@omprussia.ru>
Organization: Open Mobile Platform, LLC
Message-ID: <0f65c68a-8457-8bae-086a-e473130cf4bb@omprussia.ru>
Date:   Sat, 17 Apr 2021 23:59:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dfa042b7-8b80-ee2b-451b-7cedaeadfd02@omprussia.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1908.lancloud.ru (fd00:f066::208)
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

