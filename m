Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53A1553047A
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 18:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349224AbiEVQ2e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 12:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344417AbiEVQ20 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 12:28:26 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C26140AE;
        Sun, 22 May 2022 09:28:24 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 47E78CCD4B;
        Sun, 22 May 2022 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1653236899; bh=4TTxOmR2wLD3TeNU2SiNXSl4p2JhyoECNe34bUMzQIg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=l/cbL+zaC68xLzqKUyYLHx7IVtKrbMU80WFEw3IwVKuFiIdHMuvanw5PDpzyb665q
         V+uqjXo12iGkdy6OYU1OXe6le5yZ1dVMKfyy/Rzh4gxmMRrwroqnyiYv3amtPrD4uU
         FpuYkJAxvAJ+qbrCElrsPGFB0kugBw59ghMFPGJc=
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
Subject: [RFC PATCH 12/14] ARM: dts: qcom: msm8974: add CAMSS node
Date:   Sun, 22 May 2022 18:28:00 +0200
Message-Id: <20220522162802.208275-13-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220522162802.208275-1-luca@z3ntu.xyz>
References: <20220522162802.208275-1-luca@z3ntu.xyz>
MIME-Version: 1.0
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

Add a node for the camera subsystem found on msm8974.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 122 ++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index a80b4ae71745..e684a9229f8c 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1615,6 +1615,128 @@ dsi0_phy: dsi-phy@fd922a00 {
 			};
 		};
 
+		camss: camss@fda00000 {
+			compatible = "qcom,msm8974-camss";
+			reg = <0xfda0ac00 0x200>,
+			      <0xfda00030 0x4>,
+			      <0xfda0b000 0x200>,
+			      <0xfda00038 0x4>,
+			      <0xfda0b400 0x200>,
+			      <0xfda00040 0x4>,
+			      <0xfda08000 0x100>,
+			      <0xfda08400 0x100>,
+			      <0xfda08800 0x100>,
+			      <0xfda08c00 0x100>,
+			      <0xfda0a000 0x800>,
+			      <0xfda00020 0x10>,
+			      <0xfda10000 0x1000>,
+			      <0xfda14000 0x1000>;
+			reg-names = "csiphy0",
+				    "csiphy0_clk_mux",
+				    "csiphy1",
+				    "csiphy1_clk_mux",
+				    "csiphy2",
+				    "csiphy2_clk_mux",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid3",
+				    "ispif",
+				    "csi_clk_mux",
+				    "vfe0",
+				    "vfe1";
+			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 53 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 54 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 58 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid3",
+					  "ispif",
+					  "vfe0",
+					  "vfe1";
+			power-domains = <&mmcc CAMSS_VFE_GDSC>;
+			clocks = <&mmcc CAMSS_TOP_AHB_CLK>,
+				 <&mmcc CAMSS_ISPIF_AHB_CLK>,
+				 <&mmcc CAMSS_PHY0_CSI0PHYTIMER_CLK>,
+				 <&mmcc CAMSS_PHY1_CSI1PHYTIMER_CLK>,
+				 <&mmcc CAMSS_PHY2_CSI2PHYTIMER_CLK>,
+				 <&mmcc CAMSS_CSI0_AHB_CLK>,
+				 <&mmcc CAMSS_CSI0_CLK>,
+				 <&mmcc CAMSS_CSI0PHY_CLK>,
+				 <&mmcc CAMSS_CSI0PIX_CLK>,
+				 <&mmcc CAMSS_CSI0RDI_CLK>,
+				 <&mmcc CAMSS_CSI1_AHB_CLK>,
+				 <&mmcc CAMSS_CSI1_CLK>,
+				 <&mmcc CAMSS_CSI1PHY_CLK>,
+				 <&mmcc CAMSS_CSI1PIX_CLK>,
+				 <&mmcc CAMSS_CSI1RDI_CLK>,
+				 <&mmcc CAMSS_CSI2_AHB_CLK>,
+				 <&mmcc CAMSS_CSI2_CLK>,
+				 <&mmcc CAMSS_CSI2PHY_CLK>,
+				 <&mmcc CAMSS_CSI2PIX_CLK>,
+				 <&mmcc CAMSS_CSI2RDI_CLK>,
+				 <&mmcc CAMSS_CSI3_AHB_CLK>,
+				 <&mmcc CAMSS_CSI3_CLK>,
+				 <&mmcc CAMSS_CSI3PHY_CLK>,
+				 <&mmcc CAMSS_CSI3PIX_CLK>,
+				 <&mmcc CAMSS_CSI3RDI_CLK>,
+				 <&mmcc CAMSS_VFE_VFE0_CLK>,
+				 <&mmcc CAMSS_VFE_VFE1_CLK>,
+				 <&mmcc CAMSS_CSI_VFE0_CLK>,
+				 <&mmcc CAMSS_CSI_VFE1_CLK>,
+				 <&mmcc CAMSS_VFE_VFE_AHB_CLK>,
+				 <&mmcc CAMSS_VFE_VFE_AXI_CLK>;
+			clock-names = "top_ahb",
+				      "ispif_ahb",
+				      "csiphy0_timer",
+				      "csiphy1_timer",
+				      "csiphy2_timer",
+				      "csi0_ahb",
+				      "csi0",
+				      "csi0_phy",
+				      "csi0_pix",
+				      "csi0_rdi",
+				      "csi1_ahb",
+				      "csi1",
+				      "csi1_phy",
+				      "csi1_pix",
+				      "csi1_rdi",
+				      "csi2_ahb",
+				      "csi2",
+				      "csi2_phy",
+				      "csi2_pix",
+				      "csi2_rdi",
+				      "csi3_ahb",
+				      "csi3",
+				      "csi3_phy",
+				      "csi3_pix",
+				      "csi3_rdi",
+				      "vfe0",
+				      "vfe1",
+				      "csi_vfe0",
+				      "csi_vfe1",
+				      "iface",
+				      "bus";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		cci: cci@fda0c000 {
 			compatible = "qcom,msm8974-cci";
 			#address-cells = <1>;
-- 
2.36.0

