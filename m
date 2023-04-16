Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2AF26E3A52
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Apr 2023 18:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbjDPQmg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Apr 2023 12:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjDPQmg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 16 Apr 2023 12:42:36 -0400
Received: from hust.edu.cn (unknown [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D361FFF;
        Sun, 16 Apr 2023 09:42:34 -0700 (PDT)
Received: from localhost.localdomain ([172.16.0.254])
        (user=d202180596@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 33GGfmCE024620-33GGfmCF024620
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Mon, 17 Apr 2023 00:41:49 +0800
From:   Shuai Jiang <d202180596@hust.edu.cn>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        hust-os-kernel-patches@googlegroups.com,
        Shuai Jiang <d202180596@hust.edu.cn>
Subject: [PATCH] Subject: drivers:i2c:busses:i2c-qup.c: Add missing unwind goto in qup_i2c_probe()
Date:   Mon, 17 Apr 2023 00:41:46 +0800
Message-Id: <20230416164146.7750-1-d202180596@hust.edu.cn>
X-Mailer: git-send-email 2.17.1
X-FEAS-AUTH-USER: d202180596@hust.edu.cn
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Smatch Warns:
	drivers/i2c/busses/i2c-qup.c:1784 qup_i2c_probe()
	warn: missing unwind goto?

The goto label "fail_runtime" and "fail" will disable qup->pclk,
but here qup->pclk failed to obtain, in order to be consistent,
change the direct return to goto label "fail_dma". No functional change.

Signed-off-by: Shuai Jiang <d202180596@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/i2c/busses/i2c-qup.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 2e153f2f71b6d..ea7bceadb9cfb 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1752,16 +1752,21 @@ static int qup_i2c_probe(struct platform_device *pdev)
 	if (!clk_freq || clk_freq > I2C_MAX_FAST_MODE_PLUS_FREQ) {
 		dev_err(qup->dev, "clock frequency not supported %d\n",
 			clk_freq);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto fail_dma;
 	}
 
 	qup->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qup->base))
-		return PTR_ERR(qup->base);
+		dev_err(qup->dev, "Could not get qup_i2c_dev base ptr\n");
+		ret = PTR_ERR(qup->base);
+		goto fail_dma;
 
 	qup->irq = platform_get_irq(pdev, 0);
 	if (qup->irq < 0)
-		return qup->irq;
+		dev_err(qup->dev, "qup_i2c_dev irq ptr less than zero\n");
+		ret = PTR_ERR(qup->irq);
+		goto fail_dma;
 
 	if (has_acpi_companion(qup->dev)) {
 		ret = device_property_read_u32(qup->dev,
@@ -1775,13 +1780,15 @@ static int qup_i2c_probe(struct platform_device *pdev)
 		qup->clk = devm_clk_get(qup->dev, "core");
 		if (IS_ERR(qup->clk)) {
 			dev_err(qup->dev, "Could not get core clock\n");
-			return PTR_ERR(qup->clk);
+			ret = PTR_ERR(qup->clk);
+			goto fail_dma;
 		}
 
 		qup->pclk = devm_clk_get(qup->dev, "iface");
 		if (IS_ERR(qup->pclk)) {
 			dev_err(qup->dev, "Could not get iface clock\n");
-			return PTR_ERR(qup->pclk);
+			ret = PTR_ERR(qup->pclk);
+			goto fail_dma;
 		}
 		qup_i2c_enable_clocks(qup);
 		src_clk_freq = clk_get_rate(qup->clk);
-- 
2.17.1

