Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 456096C9E41
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbjC0IlC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233115AbjC0Ikg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:40:36 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBDF59E0;
        Mon, 27 Mar 2023 01:37:05 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4A808660308B;
        Mon, 27 Mar 2023 09:37:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679906224;
        bh=torr26qWRhLp7GlQbJK2hxugth9DFBivC+4DPBvc1uc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wk0z7cSA+5QH6UO0SEtwj5YV+Q6ghHgeIvbWzRnlrSRVgFuCoA7Jb9SylJQdrTpnX
         ywbaUylFeF0dTGp5h6RGvzQsR0qj7eo/CHNDszdhZrhVC4Y2noSuOA6InfrTnGIX7h
         EsoP0ivO2rk42ZBBi0mIJc5ixiUnUxjafIGrxdmPTZ6QesDwJ3J8DB96+CGJo53jEA
         JksamVJlgMJDbQsnjJMk1njEbDqGsyyAfbYVoZS5PncSU+QZGOG8C7KEq+KKAomlMF
         fAh2w8keakcSz3ifevBsAs3zBsD17rOoTasMfxyeR/WAMsOBTbp0W00PWaAI62Gz7a
         UbASQolZxo8Vw==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     matthias.bgg@gmail.com
Cc:     qii.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 11/17] arm64: dts: mediatek: mt6795: Add support for IOMMU and LARBs
Date:   Mon, 27 Mar 2023 10:36:41 +0200
Message-Id: <20230327083647.22017-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add nodes for the multimedia IOMMU and its LARBs: this includes all but
the MJC LARB, which cannot currently be used and will be added later.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 59 ++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index a8b2c4517e79..a580ddb51a0e 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -390,6 +390,17 @@ systimer: timer@10200670 {
 			clock-names = "clk13m";
 		};
 
+		iommu: iommu@10205000 {
+			compatible = "mediatek,mt6795-m4u";
+			reg = <0 0x10205000 0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_M4U>;
+			clock-names = "bclk";
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larbs = <&larb0 &larb1 &larb2 &larb3>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			#iommu-cells = <1>;
+		};
+
 		apmixedsys: syscon@10209000 {
 			compatible = "mediatek,mt6795-apmixedsys", "syscon";
 			reg = <0 0x10209000 0 0x1000>;
@@ -648,16 +659,64 @@ mmsys: syscon@14000000 {
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
 
+		larb0: larb@14021000 {
+			compatible = "mediatek,mt6795-smi-larb";
+			reg = <0 0x14021000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_SMI_COMMON>, <&mmsys CLK_MM_SMI_LARB0>;
+			clock-names = "apb", "smi";
+			mediatek,smi = <&smi_common>;
+			mediatek,larb-id = <0>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+		};
+
+		smi_common: smi@14022000 {
+			compatible = "mediatek,mt6795-smi-common";
+			reg = <0 0x14022000 0 0x1000>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&infracfg CLK_INFRA_SMI>, <&mmsys CLK_MM_SMI_COMMON>;
+			clock-names = "apb", "smi";
+		};
+
+		larb2: larb@15001000 {
+			compatible = "mediatek,mt6795-smi-larb";
+			reg = <0 0x15001000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_SMI_COMMON>, <&infracfg CLK_INFRA_SMI>;
+			clock-names = "apb", "smi";
+			mediatek,smi = <&smi_common>;
+			mediatek,larb-id = <2>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_ISP>;
+		};
+
 		vdecsys: clock-controller@16000000 {
 			compatible = "mediatek,mt6795-vdecsys";
 			reg = <0 0x16000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb1: larb@16010000 {
+			compatible = "mediatek,mt6795-smi-larb";
+			reg = <0 0x16010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			mediatek,larb-id = <1>;
+			clocks = <&vdecsys CLK_VDEC_CKEN>, <&vdecsys CLK_VDEC_LARB_CKEN>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT6795_POWER_DOMAIN_VDEC>;
+		};
+
 		vencsys: clock-controller@18000000 {
 			compatible = "mediatek,mt6795-vencsys";
 			reg = <0 0x18000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		larb3: larb@18001000 {
+			compatible = "mediatek,mt6795-smi-larb";
+			reg = <0 0x18001000 0 0x1000>;
+			clocks = <&vencsys CLK_VENC_VENC>, <&vencsys CLK_VENC_LARB>;
+			clock-names = "apb", "smi";
+			mediatek,smi = <&smi_common>;
+			mediatek,larb-id = <3>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_VENC>;
+		};
 	};
 };
-- 
2.40.0

