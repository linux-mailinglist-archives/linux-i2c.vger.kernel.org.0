Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 644A06611D4
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jan 2023 22:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjAGVl4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Jan 2023 16:41:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjAGVll (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Jan 2023 16:41:41 -0500
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6397A271AC
        for <linux-i2c@vger.kernel.org>; Sat,  7 Jan 2023 13:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=swwFChQDdP70hQq9FeJyayvyCrQSNXQZ/YSXmNS+G2k=; b=mkB/ss+/Lz6JXrkMnuADofbVOH
        wIdKssY0Aol0ATYWPaRyXkLt9zVkmAews8QtHRc/DPP4XsBtd6YI2/33bnJDXPUyQBW56NBr9Rg8b
        JyHINz2ov8CGoMOq0yCSpQLj1ZW37FG/fW59+Ny7CVdueseN24Fy1i28SwbHZKFQ8fdiMr17KZ1xQ
        RjyfphjwKkQmO7adeXGAUm3E214K2+vFkoU4A3qiN92AubyinRzM8lUJdPGF9GJl0cEJdm5zz/9mJ
        qdEPZJrmCms57D9sefwCHaWalnl/fBCDLDMvUcixHPuYu65lhYXJzK1xW/QMfVIdt5cDAwxzBKbkV
        5RCzd20Q==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pEGb8-000ITi-Ef; Sat, 07 Jan 2023 22:19:26 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pEGb7-000KM5-VJ; Sat, 07 Jan 2023 22:19:26 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 2/5] i2c: cadence: Remove `irq` field from driver state struct
Date:   Sat,  7 Jan 2023 13:18:11 -0800
Message-Id: <20230107211814.1179438-3-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230107211814.1179438-1-lars@metafoo.de>
References: <20230107211814.1179438-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26774/Sat Jan  7 09:54:43 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The irq field of the driver state struct is only used in the probe
function. There is no need to keep it around. Remove it from the state
struct and use a on-stack variable instead.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/i2c/busses/i2c-cadence.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 71ea658f4bd3..e2a4cb694cfb 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -173,7 +173,6 @@ enum cdns_i2c_slave_state {
  * @send_count:		Number of bytes still expected to send
  * @recv_count:		Number of bytes still expected to receive
  * @curr_recv_count:	Number of bytes to be received in current transfer
- * @irq:		IRQ number
  * @input_clk:		Input clock to I2C controller
  * @i2c_clk:		Maximum I2C clock speed
  * @bus_hold_flag:	Flag used in repeated start for clearing HOLD bit
@@ -198,7 +197,6 @@ struct cdns_i2c {
 	unsigned int send_count;
 	unsigned int recv_count;
 	unsigned int curr_recv_count;
-	int irq;
 	unsigned long input_clk;
 	unsigned int i2c_clk;
 	unsigned int bus_hold_flag;
@@ -1244,7 +1242,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 {
 	struct resource *r_mem;
 	struct cdns_i2c *id;
-	int ret;
+	int ret, irq;
 	const struct of_device_id *match;
 
 	id = devm_kzalloc(&pdev->dev, sizeof(*id), GFP_KERNEL);
@@ -1275,10 +1273,9 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(id->membase))
 		return PTR_ERR(id->membase);
 
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		return ret;
-	id->irq = ret;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	id->adap.owner = THIS_MODULE;
 	id->adap.dev.of_node = pdev->dev.of_node;
@@ -1329,10 +1326,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		goto err_clk_dis;
 	}
 
-	ret = devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
+	ret = devm_request_irq(&pdev->dev, irq, cdns_i2c_isr, 0,
 				 DRIVER_NAME, id);
 	if (ret) {
-		dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);
+		dev_err(&pdev->dev, "cannot get irq %d\n", irq);
 		goto err_clk_dis;
 	}
 	cdns_i2c_init(id);
@@ -1342,7 +1339,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		goto err_clk_dis;
 
 	dev_info(&pdev->dev, "%u kHz mmio %08lx irq %d\n",
-		 id->i2c_clk / 1000, (unsigned long)r_mem->start, id->irq);
+		 id->i2c_clk / 1000, (unsigned long)r_mem->start, irq);
 
 	return 0;
 
-- 
2.30.2

