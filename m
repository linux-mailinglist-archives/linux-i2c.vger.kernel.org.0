Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D71B6EC796
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 10:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjDXIGp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 04:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjDXIGn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 04:06:43 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A7F10C4
        for <linux-i2c@vger.kernel.org>; Mon, 24 Apr 2023 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682323601; x=1713859601;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=scnAd3dZROF54U3/5AvscerxaUPXYqMOCngEnPDazqU=;
  b=Cy/YQwcngQ/D9MvjDN05EqL8RpREWQjEO2k24fAP0rEwPGLluk8EdwuK
   sMyh8AEy0pDlyXrPqvwktHnHsWmyQQx+j22nPv34HwQUG2vqGiSF+jthk
   4O3LG+wUXjDE7bTgrffJ50SSv4AFZpe2WqUqvIUrDyV7ABB3QjYrSEksV
   JEngglHlGNOs+HUKFssK2vteDw8K2a9j6Kxo9nmzvm3lLt3Exj3xomtV0
   SW2a6nTuZ1DKcxgjDysDPNSmVxdZMuLvEBKuKiGDMUJrhftahLfLhBtXp
   4XkYdFJM1COL1PsWvyFSPCycbOzscQmwZSNnvryoMHwnbhZAbM5KcM+dH
   A==;
X-IronPort-AV: E=Sophos;i="5.99,222,1677538800"; 
   d="scan'208";a="30508005"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Apr 2023 10:06:39 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 24 Apr 2023 10:06:39 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 24 Apr 2023 10:06:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682323599; x=1713859599;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=scnAd3dZROF54U3/5AvscerxaUPXYqMOCngEnPDazqU=;
  b=RYOd09THqsMsG3cwGtjbc9x4ZckghninMcqjlj48j9UqqHqOX1DJHsZw
   g73jcL7P7k6HE4mhG8M5hzKclDUlR8Qz5bungiom+XzVCbPZbWNep0FjV
   zErBAyorhtLAaoxWn5cNEs/VBkZ0aGLy5k4xI7VbKGgsDpUznOyIlMaQs
   uO7C/w/TtYrhxhIfDQvQTTNFi1D+eHn61ehzsiVSJu9JBABLPEIedaDJC
   GP0QZgaaWQv93AlWo+fIAyR+wvO67yYHtDAN0zEGKPl6y/0412QOtt+Lm
   WZgY9jETck8Tpt+g3myjl2Mb4nJ2T1okjskYcvy7MXDSDSZtoM+bOzD1n
   g==;
X-IronPort-AV: E=Sophos;i="5.99,222,1677538800"; 
   d="scan'208";a="30508004"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Apr 2023 10:06:39 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BB96C280056;
        Mon, 24 Apr 2023 10:06:38 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Subject: [PATCH 1/1] i2c: imx-lpi2c: avoid taking clk_prepare mutex in PM callbacks
Date:   Mon, 24 Apr 2023 10:06:27 +0200
Message-Id: <20230424080627.20564-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is unsafe, as the runtime PM callbacks are called from the PM
workqueue, so this may deadlock when handling an i2c attached clock,
which may already hold the clk_prepare mutex from another context.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This is the imx-lpi2c equivalent to commit d9a22d713acb ("i2c: imx: avoid
taking clk_prepare mutex in PM callbacks"). This patch needs to be used
together with [1] in order to fix the deadlock conditions.

Commit message is shamlessly taken from commit d9a22d713acb.

Best regards,
Alexander

[1] https://patchwork.ozlabs.org/project/linux-i2c/patch/20230310130815.562418-1-alexander.sverdlin@siemens.com/

 drivers/i2c/busses/i2c-imx-lpi2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index a49b14d52a98..1af0a637d7f1 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -639,7 +639,7 @@ static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
 
-	clk_bulk_disable_unprepare(lpi2c_imx->num_clks, lpi2c_imx->clks);
+	clk_bulk_disable(lpi2c_imx->num_clks, lpi2c_imx->clks);
 	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
@@ -651,7 +651,7 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 	int ret;
 
 	pinctrl_pm_select_default_state(dev);
-	ret = clk_bulk_prepare_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
+	ret = clk_bulk_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
 	if (ret) {
 		dev_err(dev, "failed to enable I2C clock, ret=%d\n", ret);
 		return ret;
-- 
2.34.1

