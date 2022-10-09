Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2A775F8A8E
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Oct 2022 12:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiJIKYU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Oct 2022 06:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbiJIKYR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Oct 2022 06:24:17 -0400
Received: from mxout2.routing.net (mxout2.routing.net [IPv6:2a03:2900:1:a::b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4FA2D765
        for <linux-i2c@vger.kernel.org>; Sun,  9 Oct 2022 03:24:15 -0700 (PDT)
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
        by mxout2.routing.net (Postfix) with ESMTP id 0F4C25FF91;
        Sun,  9 Oct 2022 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
        s=20200217; t=1665310601;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UvX5JZ3bRps1L5sLKCfsTQTlmDO/mXO5YN2RtdaxIBM=;
        b=MOdHhfKXcvq4XKXfTBYUtQIVY8JT5DNuGCzThIZ4oxr311CtMPUbYozvXeGiWbpVX/01dF
        iYHVXAWanNasveWEuBgthHPS5D73E2LQJgKaGA+mT+7a9bQv50gBET3+8A9/yaAHYJiQAb
        QsePUUY3LBmUHTm2krLE2XgpbhzA41Q=
Received: from frank-G5.. (fttx-pool-217.61.145.235.bambit.de [217.61.145.235])
        by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 646791005FA;
        Sun,  9 Oct 2022 10:16:40 +0000 (UTC)
From:   Frank Wunderlich <linux@fw-web.de>
To:     linux-mediatek@lists.infradead.org
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] i2c: mediatek: add mt7986 support
Date:   Sun,  9 Oct 2022 12:16:31 +0200
Message-Id: <20221009101631.82380-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009101631.82380-1-linux@fw-web.de>
References: <20221009101631.82380-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: a3c6661a-5cf1-4138-9773-e2eb642628db
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Frank Wunderlich <frank-w@public-files.de>

Add i2c support for MT7986 SoC.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index fc7bfd98156b..d80e59340d97 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -431,6 +431,19 @@ static const struct mtk_i2c_compatible mt8168_compat = {
 	.max_dma_support = 33,
 };
 
+static const struct mtk_i2c_compatible mt7986_compat = {
+	.quirks = &mt7622_i2c_quirks,
+	.regs = mt_i2c_regs_v1,
+	.pmic_i2c = 0,
+	.dcm = 1,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 0,
+	.dma_sync = 1,
+	.ltiming_adjust = 0,
+	.max_dma_support = 32,
+};
+
 static const struct mtk_i2c_compatible mt8173_compat = {
 	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 0,
@@ -503,6 +516,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
 	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
 	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
+	{ .compatible = "mediatek,mt7986-i2c", .data = &mt7986_compat },
 	{ .compatible = "mediatek,mt8168-i2c", .data = &mt8168_compat },
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
 	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat },
-- 
2.34.1

