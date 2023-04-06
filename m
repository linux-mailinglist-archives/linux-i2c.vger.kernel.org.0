Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF6DF6D9CA7
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Apr 2023 17:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbjDFPtN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Apr 2023 11:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239192AbjDFPs4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Apr 2023 11:48:56 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE719EF3;
        Thu,  6 Apr 2023 08:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=uIV2iuXAASTILMO9i6nkpUZmefD3wibU1X4gzsjLG9U=; b=WbL07Tf9NEWOOncqsl9rOc0+9b
        o4joOmgigJzjiHETvwoNZirLXUH7j2Gejki4kDXjVORP/DKhp+E29TzSdvl4syVkZ4M+TRf5r+0X9
        SQolVLwqw575lLWwWIXX9cUy/kXG1MvHok+MlYAOJcY/PdmDJKokZai/rHxM0eZa/KmH+q+IfaekN
        LaHxuTp64q5HV10V0ArOxMX+DIxxMa7Nli/IoTHC7ulZExfCCiV1weLjZ++qzhQG/CFlZVvz0u13i
        kc+awsYcn3riibWPrRgIguJW6hYhW8k9aK33NXEzmFfG2b7xHOIavsZW03Ho3NsVMsd6AbxGc4HqV
        rFyrmX9Q==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pkRr1-0005z6-6n; Thu, 06 Apr 2023 17:48:51 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pkRr0-000IQf-JV; Thu, 06 Apr 2023 17:48:50 +0200
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH v2 2/2] i2c: cadence: Add reset controller support
Date:   Thu,  6 Apr 2023 08:48:34 -0700
Message-Id: <20230406154834.171577-2-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230406154834.171577-1-lars@metafoo.de>
References: <20230406154834.171577-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26867/Thu Apr  6 09:24:29 2023)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Cadence I2C controller has an external reset signal that needs to be
de-asserted before the I2C controller can be used.

Add support to the driver to be able to take the peripheral out of reset
using the reset controller API. The reset is optional in the driver for
compatibility to systems where the reset managed by the bootloader.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
Changes since v1:
  * Fix indentation
---
 drivers/i2c/busses/i2c-cadence.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 8f61a633c42c..f1a67c410ad3 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/reset.h>
 
 /* Register offsets for the I2C device. */
 #define CDNS_I2C_CR_OFFSET		0x00 /* Control Register, RW */
@@ -178,6 +179,7 @@ enum cdns_i2c_slave_state {
  * @bus_hold_flag:	Flag used in repeated start for clearing HOLD bit
  * @clk:		Pointer to struct clk
  * @clk_rate_change_nb:	Notifier block for clock rate changes
+ * @reset:		Reset control for the device
  * @quirks:		flag for broken hold bit usage in r1p10
  * @ctrl_reg:		Cached value of the control register.
  * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
@@ -204,6 +206,7 @@ struct cdns_i2c {
 	unsigned int bus_hold_flag;
 	struct clk *clk;
 	struct notifier_block clk_rate_change_nb;
+	struct reset_control *reset;
 	u32 quirks;
 	u32 ctrl_reg;
 	struct i2c_bus_recovery_info rinfo;
@@ -1325,10 +1328,22 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(id->clk),
 				     "input clock not found.\n");
 
+	id->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
+	if (IS_ERR(id->reset))
+		return dev_err_probe(&pdev->dev, PTR_ERR(id->reset),
+				     "Failed to request reset.\n");
+
 	ret = clk_prepare_enable(id->clk);
 	if (ret)
 		dev_err(&pdev->dev, "Unable to enable clock.\n");
 
+	ret = reset_control_deassert(id->reset);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret,
+			      "Failed to de-assert reset.\n");
+		goto err_clk_dis;
+	}
+
 	pm_runtime_set_autosuspend_delay(id->dev, CNDS_I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(id->dev);
 	pm_runtime_set_active(id->dev);
@@ -1360,28 +1375,30 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "invalid SCL clock: %u Hz\n", id->i2c_clk);
 		ret = -EINVAL;
-		goto err_clk_dis;
+		goto err_clk_notifier_unregister;
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq, cdns_i2c_isr, 0,
 				 DRIVER_NAME, id);
 	if (ret) {
 		dev_err(&pdev->dev, "cannot get irq %d\n", irq);
-		goto err_clk_dis;
+		goto err_clk_notifier_unregister;
 	}
 	cdns_i2c_init(id);
 
 	ret = i2c_add_adapter(&id->adap);
 	if (ret < 0)
-		goto err_clk_dis;
+		goto err_clk_notifier_unregister;
 
 	dev_info(&pdev->dev, "%u kHz mmio %08lx irq %d\n",
 		 id->i2c_clk / 1000, (unsigned long)r_mem->start, irq);
 
 	return 0;
 
-err_clk_dis:
+err_clk_notifier_unregister:
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
+	reset_control_assert(id->reset);
+err_clk_dis:
 	clk_disable_unprepare(id->clk);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
@@ -1406,6 +1423,7 @@ static int cdns_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&id->adap);
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
+	reset_control_assert(id->reset);
 	clk_disable_unprepare(id->clk);
 
 	return 0;
-- 
2.30.2

