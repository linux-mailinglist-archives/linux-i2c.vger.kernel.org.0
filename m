Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0363BAD7C
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Jul 2021 16:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhGDOsD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jul 2021 10:48:03 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:47968 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhGDOsD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Jul 2021 10:48:03 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru EF26A20F200B
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 4/5] i2c: s3c2410: fix IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-i2c@vger.kernel.org>
CC:     <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
Organization: Open Mobile Platform
Message-ID: <771d94cf-5e82-0cb7-fb1f-5af2f0b10dd4@omp.ru>
Date:   Sun, 4 Jul 2021 17:45:25 +0300
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

Fixes: 2bbd681ba2b ("i2c-s3c2410: Change IRQ to be plain integer.")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
 drivers/i2c/busses/i2c-s3c2410.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/i2c/busses/i2c-s3c2410.c
===================================================================
--- linux.orig/drivers/i2c/busses/i2c-s3c2410.c
+++ linux/drivers/i2c/busses/i2c-s3c2410.c
@@ -1137,7 +1137,7 @@ static int s3c24xx_i2c_probe(struct plat
 	 */
 	if (!(i2c->quirks & QUIRK_POLL)) {
 		i2c->irq = ret = platform_get_irq(pdev, 0);
-		if (ret <= 0) {
+		if (ret < 0) {
 			dev_err(&pdev->dev, "cannot find IRQ\n");
 			clk_unprepare(i2c->clk);
 			return ret;


