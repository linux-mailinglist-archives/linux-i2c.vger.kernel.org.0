Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40C135304B6
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 18:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349801AbiEVQaF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 12:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349889AbiEVQ3I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 12:29:08 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14753BA54;
        Sun, 22 May 2022 09:28:54 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 18F5ACCD46;
        Sun, 22 May 2022 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1653236898; bh=u1MZC2pnHpWAI6AtgxHiNKZYOM6dKJrEx8uX2bfSBSs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=rFmkBXx0WlcC2JCL2QT04mcGu4/M3hH+NLStUSVk6M8v2FhZwr9jXUpoz7oibl3rq
         +ETKPF6Cm7MbFZ+4vHi9pWklXp2p8nhULI4VecVxZiBzkjaCPx+MLae36YQfvxFCQi
         98Qym7d7h+7UK/iIq2keSzz4ysuXC4w+9/CVqcjk=
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
Subject: [RFC PATCH 08/14] media: camss: Add 8x74 resources
Date:   Sun, 22 May 2022 18:27:56 +0200
Message-Id: <20220522162802.208275-9-luca@z3ntu.xyz>
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

Add structs with 8x74 resources. The number of CSIPHY, CSID
and VFE hardware modules is the same as 8x96 but the support
is otherwise different.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/media/platform/qcom/camss/camss.c | 161 ++++++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 79ad82e233cb..5a69ce48c792 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -126,6 +126,154 @@ static const struct resources vfe_res_8x16[] = {
 	}
 };
 
+static const struct resources csiphy_res_8974[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { NULL },
+		.clock = { "top_ahb", "ispif_ahb", "csiphy0_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 100000000, 200000000 } },
+		.reg = { "csiphy0", "csiphy0_clk_mux" },
+		.interrupt = { "csiphy0" }
+	},
+
+	/* CSIPHY1 */
+	{
+		.regulators = { NULL },
+		.clock = { "top_ahb", "ispif_ahb", "csiphy1_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 100000000, 200000000 } },
+		.reg = { "csiphy1", "csiphy1_clk_mux" },
+		.interrupt = { "csiphy1" }
+	},
+
+	/* CSIPHY2 */
+	{
+		.regulators = { NULL },
+		.clock = { "top_ahb", "ispif_ahb", "csiphy2_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 100000000, 200000000 } },
+		.reg = { "csiphy2", "csiphy2_clk_mux" },
+		.interrupt = { "csiphy2" }
+	}
+};
+
+static const struct resources csid_res_8974[] = {
+	/* CSID0 */
+	{
+		.regulators = { "vdda" },
+		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb",
+			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" }
+	},
+
+	/* CSID1 */
+	{
+		.regulators = { "vdda" },
+		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb",
+			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" }
+	},
+
+	/* CSID2 */
+	{
+		.regulators = { "vdda" },
+		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb",
+			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" }
+	},
+
+	/* CSID3 */
+	{
+		.regulators = { "vdda" },
+		.clock = { "top_ahb", "ispif_ahb", "csi3_ahb",
+			   "csi3", "csi3_phy", "csi3_pix", "csi3_rdi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid3" },
+		.interrupt = { "csid3" }
+	}
+};
+
+static const struct resources_ispif ispif_res_8974 = {
+	/* ISPIF */
+	.clock = { "top_ahb", "ispif_ahb",
+		   "csi0", "csi0_pix", "csi0_rdi",
+		   "csi1", "csi1_pix", "csi1_rdi",
+		   "csi2", "csi2_pix", "csi2_rdi",
+		   "csi3", "csi3_pix", "csi3_rdi" },
+	.clock_for_reset = { "vfe0", "csi_vfe0",
+		   "vfe1", "csi_vfe1" },
+	.reg = { "ispif", "csi_clk_mux" },
+	.interrupt = "ispif"
+
+};
+
+static const struct resources vfe_res_8974[] = {
+	/* VFE0 */
+	{
+		.regulators = { NULL },
+		.clock = { "top_ahb", "vfe0", "csi_vfe0",
+			   "iface", "bus" },
+		.clock_rate = { { 0 },
+				{ 50000000, 80000000, 100000000, 160000000,
+				  177780000, 200000000, 266670000, 320000000,
+				  400000000, 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" }
+	},
+	/* VFE1 */
+	{
+		.regulators = { NULL },
+		.clock = { "top_ahb", "vfe1", "csi_vfe1",
+			   "iface", "bus" },
+		.clock_rate = { { 0 },
+				{ 50000000, 80000000, 100000000, 160000000,
+				  177780000, 200000000, 266670000, 320000000,
+				  400000000, 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" }
+	}
+};
+
 static const struct resources csiphy_res_8x96[] = {
 	/* CSIPHY0 */
 	{
@@ -1132,6 +1280,11 @@ static int camss_init_subdevices(struct camss *camss)
 		csid_res = csid_res_8x16;
 		ispif_res = &ispif_res_8x16;
 		vfe_res = vfe_res_8x16;
+	} else if (camss->version == CAMSS_8x74) {
+		csiphy_res = csiphy_res_8974;
+		csid_res = csid_res_8974;
+		ispif_res = &ispif_res_8974;
+		vfe_res = vfe_res_8974;
 	} else if (camss->version == CAMSS_8x96) {
 		csiphy_res = csiphy_res_8x96;
 		csid_res = csid_res_8x96;
@@ -1542,6 +1695,12 @@ static int camss_probe(struct platform_device *pdev)
 		camss->csiphy_num = 2;
 		camss->csid_num = 2;
 		camss->vfe_num = 1;
+	} else if (of_device_is_compatible(dev->of_node,
+					   "qcom,msm8974-camss")) {
+		camss->version = CAMSS_8x74;
+		camss->csiphy_num = 3;
+		camss->csid_num = 4;
+		camss->vfe_num = 2;
 	} else if (of_device_is_compatible(dev->of_node,
 					   "qcom,msm8996-camss")) {
 		camss->version = CAMSS_8x96;
@@ -1586,6 +1745,7 @@ static int camss_probe(struct platform_device *pdev)
 	}
 
 	if (camss->version == CAMSS_8x16 ||
+	    camss->version == CAMSS_8x74 ||
 	    camss->version == CAMSS_8x96) {
 		camss->ispif = devm_kcalloc(dev, 1, sizeof(*camss->ispif), GFP_KERNEL);
 		if (!camss->ispif) {
@@ -1735,6 +1895,7 @@ static int camss_remove(struct platform_device *pdev)
 
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss" },
+	{ .compatible = "qcom,msm8974-camss" },
 	{ .compatible = "qcom,msm8996-camss" },
 	{ .compatible = "qcom,sdm660-camss" },
 	{ .compatible = "qcom,sdm845-camss" },
-- 
2.36.0

