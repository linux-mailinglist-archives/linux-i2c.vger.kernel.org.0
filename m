Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401892CE8D0
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Dec 2020 08:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgLDHuL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Dec 2020 02:50:11 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:45320 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726669AbgLDHuL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Dec 2020 02:50:11 -0500
X-Greylist: delayed 486 seconds by postgrey-1.27 at vger.kernel.org; Fri, 04 Dec 2020 02:50:11 EST
Received: from localhost.localdomain (unknown [124.16.141.242])
        by APP-01 (Coremail) with SMTP id qwCowABX9o0a6MlfsIDYAA--.25775S2;
        Fri, 04 Dec 2020 15:41:14 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     kblaiech@nvidia.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: mlxbf: Fix an error pointer vs NULL check
Date:   Fri,  4 Dec 2020 07:41:11 +0000
Message-Id: <20201204074111.1359-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowABX9o0a6MlfsIDYAA--.25775S2
X-Coremail-Antispam: 1UD129KBjvJXoWrtF13Ar1DtFyfArWftrW8Zwb_yoW8Jryfpr
        4ruFZ0k345KrW2qwsrX3Z5XFyYywnxtay0krW8uwsI9Fs8JrWDZF1rAFWj9r4SyrZ5uw45
        tF90yFW3CFWUZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkYb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GF4l42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0UGYPUUUUU==
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCwkAA1z4joXwngAAsA
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In case of error, the function devm_ioremap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-mlxbf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 33574d40ea9c..73a58beb7b82 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -1258,9 +1258,9 @@ static int mlxbf_i2c_get_gpio(struct platform_device *pdev,
 		return -EFAULT;
 
 	gpio_res->io = devm_ioremap(dev, params->start, size);
-	if (IS_ERR(gpio_res->io)) {
+	if (!gpio_res->io) {
 		devm_release_mem_region(dev, params->start, size);
-		return PTR_ERR(gpio_res->io);
+		return -ENOMEM;
 	}
 
 	return 0;
@@ -1323,9 +1323,9 @@ static int mlxbf_i2c_get_corepll(struct platform_device *pdev,
 		return -EFAULT;
 
 	corepll_res->io = devm_ioremap(dev, params->start, size);
-	if (IS_ERR(corepll_res->io)) {
+	if (!corepll_res->io) {
 		devm_release_mem_region(dev, params->start, size);
-		return PTR_ERR(corepll_res->io);
+		return -ENOMEM;
 	}
 
 	return 0;
-- 
2.17.1

