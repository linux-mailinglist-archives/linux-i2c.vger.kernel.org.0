Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09D0A53049B
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 18:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349845AbiEVQ3R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 12:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349493AbiEVQ3L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 12:29:11 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12813BA52;
        Sun, 22 May 2022 09:28:54 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id ABE17CCD48;
        Sun, 22 May 2022 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1653236898; bh=NwhpmevNUU2gq+eDnD+yz+ZmjE9TKPUK+80uSILSa24=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=EtlqUowxpcRSB7A+wmr/ig8CW8R3ymUErisirN1xMvfb2w+UIfk6zIaQozo3mXtu5
         HKGpfvkhdKw7yy1omR93Nt88DpyAUX3dGPeDcYGVdvcd8wxuJC83fjmYVe6pM8xNB1
         aK4eqqiPIHPIQdYbR9QNi9HPMsC6w5vVGa6kXtBE=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com, Luca Weiss <luca@z3ntu.xyz>
Subject: [RFC PATCH 10/14] i2c: qcom-cci: add msm8974 compatible
Date:   Sun, 22 May 2022 18:27:58 +0200
Message-Id: <20220522162802.208275-11-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220522162802.208275-1-luca@z3ntu.xyz>
References: <20220522162802.208275-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

MSM8974 CCI is the same as MSM8916 except it has two masters.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
To note, the cci_v1_5_data variable name is just a bit arbitrary and
isn't meant to reflect IP version "1.5". I'd be happy to change the
variable name to something else.

 drivers/i2c/busses/i2c-qcom-cci.c | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 5c7cc862f08f..a68f17eb9dd0 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -725,6 +725,40 @@ static const struct cci_data cci_v1_data = {
 	},
 };
 
+static const struct cci_data cci_v1_5_data = {
+	.num_masters = 2,
+	.queue_size = { 64, 16 },
+	.quirks = {
+		.max_write_len = 10,
+		.max_read_len = 12,
+	},
+	.cci_clk_rate =  19200000,
+	.params[I2C_MODE_STANDARD] = {
+		.thigh = 78,
+		.tlow = 114,
+		.tsu_sto = 28,
+		.tsu_sta = 28,
+		.thd_dat = 10,
+		.thd_sta = 77,
+		.tbuf = 118,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 1
+	},
+	.params[I2C_MODE_FAST] = {
+		.thigh = 20,
+		.tlow = 28,
+		.tsu_sto = 21,
+		.tsu_sta = 21,
+		.thd_dat = 13,
+		.thd_sta = 18,
+		.tbuf = 32,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 3
+	},
+};
+
 static const struct cci_data cci_v2_data = {
 	.num_masters = 2,
 	.queue_size = { 64, 16 },
@@ -773,6 +807,7 @@ static const struct cci_data cci_v2_data = {
 
 static const struct of_device_id cci_dt_match[] = {
 	{ .compatible = "qcom,msm8916-cci", .data = &cci_v1_data},
+	{ .compatible = "qcom,msm8974-cci", .data = &cci_v1_5_data},
 	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
 	{ .compatible = "qcom,sdm845-cci", .data = &cci_v2_data},
 	{ .compatible = "qcom,sm8250-cci", .data = &cci_v2_data},
-- 
2.36.0

