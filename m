Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9C744E679
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 12:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbfFUKxT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 06:53:19 -0400
Received: from smtp127.iad3b.emailsrvr.com ([146.20.161.127]:47598 "EHLO
        smtp127.iad3b.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726218AbfFUKxT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jun 2019 06:53:19 -0400
Received: from smtp24.relay.iad3b.emailsrvr.com (localhost [127.0.0.1])
        by smtp24.relay.iad3b.emailsrvr.com (SMTP Server) with ESMTP id 6605C4014B;
        Fri, 21 Jun 2019 06:53:18 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1561114398;
        bh=drA647kOQx3Qy/hXufrYD6fGVPB9NJiYqLYUgqB2t/Q=;
        h=From:To:Subject:Date:From;
        b=IkmriXzHvteJZa2JQprZRtdaMBggXmTpoZyWcy4vxRT67cduTKkVSnzGx6usJbSBb
         nZFi9gUyTDOe5dy8944y60lJi5xYqFmnV//qoYjCuBphkYPJUiJasi05lyxQ5WDbuY
         H4656XNlxqIGflPxJDmkehUWEs9FW6RWQoqqABB4=
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp24.relay.iad3b.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id 1E59440127;
        Fri, 21 Jun 2019 06:53:17 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from commune.xenotropic.com (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256)
        by 0.0.0.0:25 (trex/5.7.12);
        Fri, 21 Jun 2019 06:53:18 -0400
From:   Annaliese McDermond <nh6z@nh6z.net>
To:     eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com,
        wsa@the-dreams.de, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Annaliese McDermond <nh6z@nh6z.net>, team@nwdigitalradio.com
Subject: [PATCH v2 2/2] i2c: bcm2835: Ensure clock exists when probing
Date:   Fri, 21 Jun 2019 03:52:50 -0700
Message-Id: <20190621105250.19858-3-nh6z@nh6z.net>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190621105250.19858-1-nh6z@nh6z.net>
References: <20190621105250.19858-1-nh6z@nh6z.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Probe function fails to recognize that upstream clock actually
doesn't yet exist because clock driver has not been initialized.
Actually try to go get the clock and test for its existence
before trying to set up a downstream clock based upon it.

This fixes a bug that causes the i2c driver not to work with
monolithic kernels.

Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")

Signed-off-by: Annaliese McDermond <nh6z@nh6z.net>
---
 drivers/i2c/busses/i2c-bcm2835.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 27b2f204c693..79d06286b926 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -244,15 +244,18 @@ static const struct clk_ops clk_bcm2835_i2c_ops = {
 };
 
 static struct clk *bcm2835_i2c_register_div(struct device *dev,
-					const char *mclk_name,
+					struct clk *mclk,
 					struct bcm2835_i2c_dev *i2c_dev)
 {
 	struct clk_init_data init;
 	struct clk_bcm2835_i2c *priv;
 	char name[32];
+	const char *mclk_name;
 
 	snprintf(name, sizeof(name), "%s_div", dev_name(dev));
 
+	mclk_name = __clk_get_name(mclk);
+
 	init.ops = &clk_bcm2835_i2c_ops;
 	init.name = name;
 	init.parent_names = (const char* []) { mclk_name };
@@ -505,8 +508,8 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	struct resource *mem, *irq;
 	int ret;
 	struct i2c_adapter *adap;
-	const char *mclk_name;
 	struct clk *bus_clk;
+	struct clk *mclk;
 	u32 bus_clk_rate;
 
 	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
@@ -521,9 +524,14 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c_dev->regs))
 		return PTR_ERR(i2c_dev->regs);
 
-	mclk_name = of_clk_get_parent_name(pdev->dev.of_node, 0);
+	mclk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(mclk)) {
+		if (PTR_ERR(mclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get clock\n");
+		return PTR_ERR(mclk);
+	}
 
-	bus_clk = bcm2835_i2c_register_div(&pdev->dev, mclk_name, i2c_dev);
+	bus_clk = bcm2835_i2c_register_div(&pdev->dev, mclk, i2c_dev);
 
 	if (IS_ERR(bus_clk)) {
 		dev_err(&pdev->dev, "Could not register clock\n");
-- 
2.19.1

