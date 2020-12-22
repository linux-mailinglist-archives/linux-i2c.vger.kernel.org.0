Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 154942E0AC5
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Dec 2020 14:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgLVNcV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Dec 2020 08:32:21 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9471 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbgLVNcU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Dec 2020 08:32:20 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D0cfj6R67zhw4Y;
        Tue, 22 Dec 2020 21:30:53 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 22 Dec 2020 21:31:21 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <linux@rempel-privat.de>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        "Zheng Yongjun" <zhengyongjun3@huawei.com>
Subject: [PATCH -next] i2c: busses: use DIV_ROUND_UP macro to do calculation
Date:   Tue, 22 Dec 2020 21:31:31 +0800
Message-ID: <20201222133131.19525-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Don't open-code DIV_ROUND_UP() kernel macro.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/i2c/busses/i2c-imx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index e6f8d6e45a15..346c196cbce7 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -529,7 +529,7 @@ static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
 
 	i2c_imx->cur_clk = i2c_clk_rate;
 
-	div = (i2c_clk_rate + i2c_imx->bitrate - 1) / i2c_imx->bitrate;
+	div = DIV_ROUND_UP(i2c_clk_rate, i2c_imx->bitrate);
 	if (div < i2c_clk_div[0].div)
 		i = 0;
 	else if (div > i2c_clk_div[i2c_imx->hwdata->ndivs - 1].div)
@@ -547,8 +547,8 @@ static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
 	 * This delay is used in I2C bus disable function
 	 * to fix chip hardware bug.
 	 */
-	i2c_imx->disable_delay = (500000U * i2c_clk_div[i].div
-		+ (i2c_clk_rate / 2) - 1) / (i2c_clk_rate / 2);
+	i2c_imx->disable_delay = DIV_ROUND_UP(500000U * i2c_clk_div[i].div,
+					      i2c_clk_rate / 2);
 
 #ifdef CONFIG_I2C_DEBUG_BUS
 	dev_dbg(&i2c_imx->adapter.dev, "I2C_CLK=%d, REQ DIV=%d\n",
-- 
2.22.0

