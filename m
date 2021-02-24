Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30ACA323965
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Feb 2021 10:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234497AbhBXJYL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Feb 2021 04:24:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:40982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234349AbhBXJYK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Feb 2021 04:24:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7955C64EA4;
        Wed, 24 Feb 2021 09:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614158609;
        bh=quLNwVGYDdUprmUP50N1T39NELsBp/AdEVI6ysGqlMs=;
        h=From:To:Cc:Subject:Date:From;
        b=bnPoRVE/HM1m0aFAxBPcxv0B6b9SztMw9zm37tkOSQrpusrD8OdCTUcBaNsenDWHV
         t5I7atSQYJ4smwoi0ZC8CDC0ujH83HoBYW2laZifX/YCFAE5THY8oumPgtJEYM6Saj
         h5ggNBs7qPijfWMGu9EhafoNrqhizAaLNZN9gmsU1CudfdzCzKjLE2SoceJwGRC80T
         2hOP1ZHJVJT5NJLlcooy1x6y4xW/kwU1LxoLpynAvyX76wKqYQvsSqOBRrLSlPGnMd
         Jjf6Cc92TcMJjuM56VT/PR8WQNSAfJpbz/UmmLkSq7UOMvWg2SLk/MzpUPNkHt92k5
         q0iFe6ztHFitg==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] Revert "i2c: i2c-qcom-geni: Add shutdown callback for i2c"
Date:   Wed, 24 Feb 2021 10:23:13 +0100
Message-Id: <20210224092313.2238-1-wsa@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This reverts commit e0371298ddc51761be257698554ea507ac8bf831. It was
accidently applied despite discussion still going on.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 34 ------------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index c3f584795911..214b4c913a13 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -375,32 +375,6 @@ static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c,
 	}
 }
 
-static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
-{
-	int ret;
-	u32 geni_status;
-	struct i2c_msg *cur;
-
-	/* Resume device, as runtime suspend can happen anytime during transfer */
-	ret = pm_runtime_get_sync(gi2c->se.dev);
-	if (ret < 0) {
-		dev_err(gi2c->se.dev, "Failed to resume device: %d\n", ret);
-		return;
-	}
-
-	geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
-	if (geni_status & M_GENI_CMD_ACTIVE) {
-		cur = gi2c->cur;
-		geni_i2c_abort_xfer(gi2c);
-		if (cur->flags & I2C_M_RD)
-			geni_i2c_rx_msg_cleanup(gi2c, cur);
-		else
-			geni_i2c_tx_msg_cleanup(gi2c, cur);
-	}
-
-	pm_runtime_put_sync_suspend(gi2c->se.dev);
-}
-
 static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
@@ -676,13 +650,6 @@ static int geni_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static void  geni_i2c_shutdown(struct platform_device *pdev)
-{
-	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
-
-	geni_i2c_stop_xfer(gi2c);
-}
-
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
 	int ret;
@@ -747,7 +714,6 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
 static struct platform_driver geni_i2c_driver = {
 	.probe  = geni_i2c_probe,
 	.remove = geni_i2c_remove,
-	.shutdown = geni_i2c_shutdown,
 	.driver = {
 		.name = "geni_i2c",
 		.pm = &geni_i2c_pm_ops,
-- 
2.29.2

