Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D92994C9EF2
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 09:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234530AbiCBILw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 03:11:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiCBILu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 03:11:50 -0500
X-Greylist: delayed 440 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 02 Mar 2022 00:11:07 PST
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AAEBD7D008
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 00:11:07 -0800 (PST)
Received: from localhost.localdomain (unknown [124.16.138.126])
        by APP-01 (Coremail) with SMTP id qwCowADX3fHgJB9iOU0FAg--.4995S2;
        Wed, 02 Mar 2022 16:03:45 +0800 (CST)
From:   Jiasheng Jiang <jiasheng@iscas.ac.cn>
To:     wsa+renesas@sang-engineering.com, peda@axentia.se
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH] i2c: mux: demux-pinctrl: Handle error for devm_kstrdup
Date:   Wed,  2 Mar 2022 16:03:42 +0800
Message-Id: <20220302080342.71803-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADX3fHgJB9iOU0FAg--.4995S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr15uFW3Kw1DtryrtrW3GFg_yoWDXrXEka
        98Z3W7Xr1UCFnYyw12yFZayFyFkrWjvF40vF1vg3s5AFyYqw13WrWUXw4fG3y8W3yDKF98
        A34vqrWfZw17GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbz8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
        MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
        AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
        0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
        v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
        14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5WlkUUUUU
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

As the potential failure of the devm_kstrdup(),
it should be better to check it and return error
if fails.

Fixes: e35478eac030 ("i2c: mux: demux-pinctrl: run properly with multiple instances")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/i2c/muxes/i2c-demux-pinctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index 5365199a31f4..3203361b00f2 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -243,6 +243,10 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
 
 		props[i].name = devm_kstrdup(&pdev->dev, "status", GFP_KERNEL);
 		props[i].value = devm_kstrdup(&pdev->dev, "ok", GFP_KERNEL);
+		if (!props[i].name || !props[i].value) {
+			err = -ENOMEM;
+			goto err_rollback;
+		}
 		props[i].length = 3;
 
 		of_changeset_init(&priv->chan[i].chgset);
-- 
2.25.1

