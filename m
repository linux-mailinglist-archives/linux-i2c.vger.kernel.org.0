Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8C84210BD
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Oct 2021 15:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238806AbhJDNyP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 09:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238744AbhJDNyK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Oct 2021 09:54:10 -0400
X-Greylist: delayed 1118 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Oct 2021 06:34:32 PDT
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D8CC0BC432
        for <linux-i2c@vger.kernel.org>; Mon,  4 Oct 2021 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
        Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
        In-Reply-To:References; bh=aBKViVwxrne8/nI+LpCjdGBYvf+4z+itXq4lpS3vaIE=; b=Dq
        AkZ9Ijru7UYL+QQsowVqfN4QiHt64munsKe9WNk8R+CAKE/cKjHX2AbGk93UTaTfd/rz5THgMuyIy
        7/BHQSYr1HMrqL0Zbfh1AkdyX5mU5D0p16DurXq/7bVHIMBrkSF/Bkm+QL61m6EVEXG+LavO441Va
        4JesPDB6mmxTeR94TZ6w+3TBfNymVCo4BRNsCn7P12QDgx/eC74dLgNc+vvVrOevSxYgpgiobKu3Y
        nr/5W71H9S9DPoMg4dIOVDy0sxU165QBxScLklbpmurEZ2qtTq1yfcNDz2ywlVhBYMmBeSKYSKT6h
        kxUBhMbN6DJkzR/2YJbEM6CrsgHUR9xg==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1mXNot-0006Z4-GV; Mon, 04 Oct 2021 14:15:51 +0100
From:   John Keeping <john@metanate.com>
To:     linux-i2c@vger.kernel.org
Cc:     John Keeping <john@metanate.com>, Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: rk3x: enable clock before getting rate
Date:   Mon,  4 Oct 2021 14:15:39 +0100
Message-Id: <20211004131539.1253195-1-john@metanate.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

clk_get_rate() is documented as requiring the clock to be enabled.
Ensure that the bus clock is enabled before calling clk_get_rate() in
rk3x_i2c_probe() to satisfy this requirement.

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/i2c/busses/i2c-rk3x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 819ab4ee517e..332755fab2a1 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1338,8 +1338,15 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 		goto err_pclk;
 	}
 
+	ret = clk_enable(i2c->clk);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Can't enable bus clk: %d\n", ret);
+		goto err_clk_notifier;
+	}
+
 	clk_rate = clk_get_rate(i2c->clk);
 	rk3x_i2c_adapt_div(i2c, clk_rate);
+	clk_disable(i2c->clk);
 
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret < 0)
-- 
2.33.0

