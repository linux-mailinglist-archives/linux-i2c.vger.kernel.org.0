Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32DC678C586
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Aug 2023 15:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234377AbjH2Ndp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Aug 2023 09:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236208AbjH2Ndc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Aug 2023 09:33:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5D2CCE;
        Tue, 29 Aug 2023 06:33:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E027C6574D;
        Tue, 29 Aug 2023 13:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21693C433CD;
        Tue, 29 Aug 2023 13:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693315956;
        bh=8BJat/PnflBGy2w/90xhTxQ3qWxwanl2fKWzgHIxuY4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=htrP20m58TDxn/rMgMu01M+GIejvxVRGkXR/OlwBXw5WYsRptnoUMlSQGRulTAHJE
         MW7Y2cmddHebn2ExafjIsh//HZ4400+/gOpXJdmv6TLQ2XLYasqYCrlCCjRUGxJesm
         MD+O6Y1jBfI3jvdZnsclCpNt7w9IPQpmfROar3Qs1/UIXiK7nNVNfRzpTRWBkzH/o7
         wed5StNis6mSsNDaPX/7p0A2aRj/J68neKHqSdpenrSTKupRtrQb5bnAh1xq+YMWkP
         1BYCsQKKnbBWrIgc0Mctk5dON5v6+qx+g/eJRBeSyDoIPYMRjuHVHv2vnrLi5FD48s
         0BgnuE5uv+ONg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Carlos Song <carlos.song@nxp.com>,
        Dong Aisheng <Aisheng.dong@nxp.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Sasha Levin <sashal@kernel.org>,
        aisheng.dong@nxp.com, shawnguo@kernel.org,
        linux-i2c@vger.kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.4 13/17] i2c: imx-lpi2c: return -EINVAL when i2c peripheral clk doesn't work
Date:   Tue, 29 Aug 2023 09:32:00 -0400
Message-Id: <20230829133211.519957-13-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230829133211.519957-1-sashal@kernel.org>
References: <20230829133211.519957-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.12
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Carlos Song <carlos.song@nxp.com>

[ Upstream commit b610c4bbd153c2cde548db48559e170905d7c369 ]

On MX8X platforms, the default clock rate is 0 if without explicit
clock setting in dts nodes. I2c can't work when i2c peripheral clk
rate is 0.

Add a i2c peripheral clk rate check before configuring the clock
register. When i2c peripheral clk rate is 0 and directly return
-EINVAL.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Acked-by: Dong Aisheng <Aisheng.dong@nxp.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 4d24ceb57ee74..338171f76daf7 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -209,6 +209,9 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 	lpi2c_imx_set_mode(lpi2c_imx);
 
 	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
+	if (!clk_rate)
+		return -EINVAL;
+
 	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
 		filt = 0;
 	else
-- 
2.40.1

