Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C52235B05F
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 22:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234668AbhDJUVH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 16:21:07 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:39144 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbhDJUVG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Apr 2021 16:21:06 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru AFD4020751F9
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 4/6] i2c: mlxbf: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
To:     <linux-i2c@vger.kernel.org>, Khalil Blaiech <kblaiech@nvidia.com>
References: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
Organization: Open Mobile Platform, LLC
Message-ID: <b3b8464d-9912-886f-b5d3-32b3bc2fa3bf@omprussia.ru>
Date:   Sat, 10 Apr 2021 23:20:49 +0300
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

Fixes: b5b5b32081cd ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueField SoC")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
Changes in version 2:
- new patch.

 drivers/i2c/busses/i2c-mlxbf.c |    2 ++
 1 file changed, 2 insertions(+)

Index: linux/drivers/i2c/busses/i2c-mlxbf.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-mlxbf.c
+++ linux/drivers/i2c/busses/i2c-mlxbf.c
@@ -2376,6 +2376,8 @@ static int mlxbf_i2c_probe(struct platfo
 	mlxbf_i2c_init_slave(pdev, priv);
 
 	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 	ret = devm_request_irq(dev, irq, mlxbf_smbus_irq,
 			       IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED,
 			       dev_name(dev), priv);
