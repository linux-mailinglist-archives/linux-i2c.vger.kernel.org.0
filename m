Return-Path: <linux-i2c+bounces-999-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B44D781E3D7
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Dec 2023 01:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C85DA1C213BE
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Dec 2023 00:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D925B1FD;
	Tue, 26 Dec 2023 00:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HO4eJZN5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C9D5B1F6;
	Tue, 26 Dec 2023 00:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAF4C433C7;
	Tue, 26 Dec 2023 00:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703550291;
	bh=wEme5zOXjNS4jm4i7jwulhr8cvuV5k7DomlCN/6/p40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HO4eJZN5coauanQ5u5psBlD5OsWEdN2F1lnM4ILOpN0V3IK2D1H67jeU2OMBDB7KT
	 VZpDs2F5muEEzL0BWRLJp+4mLdg5GXrAdFzp84dC4GXxTqxCm72GHwOEYejuqh8fJ3
	 fy227KSPuS7qoKcNBySzsZQ55yUjPgv/NwE24GwUKXPDGJST6zCMeNE0VUSDsQF9DW
	 7PCzru3iPCk5blK+JD+ndh6xFsly5OZUE6F1/wYXsY45SKnPDTYh9CTPzQ0I51Pdpb
	 Io79uIbVnCSvwH733q7oEnI3t6cmboWKvsqlr9EvE7NK0XQLWIaM4dp1PZ6cP0vXYk
	 ezf/OPw6luqxw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jensen Huang <jensenhuang@friendlyarm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 10/11] i2c: rk3x: fix potential spinlock recursion on poll
Date: Mon, 25 Dec 2023 19:23:59 -0500
Message-ID: <20231226002420.6303-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226002420.6303-1-sashal@kernel.org>
References: <20231226002420.6303-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.145
Content-Transfer-Encoding: 8bit

From: Jensen Huang <jensenhuang@friendlyarm.com>

[ Upstream commit 19cde9c92b8d3b7ee555d0da3bcb0232d3a784f4 ]

Possible deadlock scenario (on reboot):
rk3x_i2c_xfer_common(polling)
    -> rk3x_i2c_wait_xfer_poll()
        -> rk3x_i2c_irq(0, i2c);
            --> spin_lock(&i2c->lock);
            ...
        <rk3x i2c interrupt>
        -> rk3x_i2c_irq(0, i2c);
            --> spin_lock(&i2c->lock); (deadlock here)

Store the IRQ number and disable/enable it around the polling transfer.
This patch has been tested on NanoPC-T4.

Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-rk3x.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 13c14eb175e94..6abcf975a2db9 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -178,6 +178,7 @@ struct rk3x_i2c_soc_data {
  * @clk: function clk for rk3399 or function & Bus clks for others
  * @pclk: Bus clk for rk3399
  * @clk_rate_nb: i2c clk rate change notify
+ * @irq: irq number
  * @t: I2C known timing information
  * @lock: spinlock for the i2c bus
  * @wait: the waitqueue to wait for i2c transfer
@@ -200,6 +201,7 @@ struct rk3x_i2c {
 	struct clk *clk;
 	struct clk *pclk;
 	struct notifier_block clk_rate_nb;
+	int irq;
 
 	/* Settings */
 	struct i2c_timings t;
@@ -1087,13 +1089,18 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 
 		spin_unlock_irqrestore(&i2c->lock, flags);
 
-		rk3x_i2c_start(i2c);
-
 		if (!polling) {
+			rk3x_i2c_start(i2c);
+
 			timeout = wait_event_timeout(i2c->wait, !i2c->busy,
 						     msecs_to_jiffies(WAIT_TIMEOUT));
 		} else {
+			disable_irq(i2c->irq);
+			rk3x_i2c_start(i2c);
+
 			timeout = rk3x_i2c_wait_xfer_poll(i2c);
+
+			enable_irq(i2c->irq);
 		}
 
 		spin_lock_irqsave(&i2c->lock, flags);
@@ -1301,6 +1308,8 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	i2c->irq = irq;
+
 	platform_set_drvdata(pdev, i2c);
 
 	if (i2c->soc_data->calc_timings == rk3x_i2c_v0_calc_timings) {
-- 
2.43.0


