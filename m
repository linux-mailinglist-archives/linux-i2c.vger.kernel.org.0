Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBF66C83F0
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 18:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbjCXR4y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 13:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbjCXR4l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 13:56:41 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433A21A4BA;
        Fri, 24 Mar 2023 10:56:22 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 845D96603131;
        Fri, 24 Mar 2023 17:55:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679680506;
        bh=JgYNzYY/JT/ZxbQnRLMlhIx1cKKvJaqNQPrMZEWb9yg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GOSa+0CU0oFtU7GYaAHdanaai5ki08N7IqjNt2o708HST2kpjGeyod96NZ1q9JgWU
         KThCNzCr6LBjhW5gt3eNMreI1cZiR4WbCASz4Bmrt/UsNRDl7U/qCo1g4r4yKtdrn9
         EqsLirIpqBPH7easvc0Cljh1pUyW89I/BKgHTvHvCNsw6RSuWkSsFQrXgsm+FQSU7J
         FQAFwI18TjBxasdzEaO9T5KBaT6TkNNfbLJshIcuKGzweposrxrO0QbgLH80HDahZ0
         34i4ICHZGPKUej7QqNkFDTrejyStZIga91g9VGWtSlePv8Fy+sTMO90gTtUAK1UG3C
         bDKlZRfjmFveA==
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
Subject: [PATCH v1 06/18] arm64: dts: mediatek: mt6795: Add SoC power domains
Date:   Fri, 24 Mar 2023 18:54:44 +0100
Message-Id: <20230324175456.219954-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
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

Add power domain tree for various hardware blocks on MT6795.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 79 ++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index ceb6fc948d8a..d63efb32e6bb 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/mediatek,mt6795-clk.h>
 #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
+#include <dt-bindings/power/mt6795-power.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 
 / {
@@ -264,6 +265,84 @@ pericfg: syscon@10003000 {
 			#reset-cells = <1>;
 		};
 
+		scpsys: syscon@10006000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0 0x10006000 0 0x1000>;
+			#power-domain-cells = <1>;
+
+			/* System Power Manager */
+			spm: power-controller {
+				compatible = "mediatek,mt6795-power-controller";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#power-domain-cells = <1>;
+
+				/* power domains of the SoC */
+				power-domain@MT6795_POWER_DOMAIN_VDEC {
+					reg = <MT6795_POWER_DOMAIN_VDEC>;
+					clocks = <&topckgen CLK_TOP_MM_SEL>;
+					clock-names = "mm";
+					#power-domain-cells = <0>;
+				};
+				power-domain@MT6795_POWER_DOMAIN_VENC {
+					reg = <MT6795_POWER_DOMAIN_VENC>;
+					clocks = <&topckgen CLK_TOP_MM_SEL>,
+						 <&topckgen CLK_TOP_VENC_SEL>;
+					clock-names = "mm", "venc";
+					#power-domain-cells = <0>;
+				};
+				power-domain@MT6795_POWER_DOMAIN_ISP {
+					reg = <MT6795_POWER_DOMAIN_ISP>;
+					clocks = <&topckgen CLK_TOP_MM_SEL>;
+					clock-names = "mm";
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT6795_POWER_DOMAIN_MM {
+					reg = <MT6795_POWER_DOMAIN_MM>;
+					clocks = <&topckgen CLK_TOP_MM_SEL>;
+					clock-names = "mm";
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+				};
+
+				power-domain@MT6795_POWER_DOMAIN_MJC {
+					reg = <MT6795_POWER_DOMAIN_MJC>;
+					clocks = <&topckgen CLK_TOP_MM_SEL>,
+						 <&topckgen CLK_TOP_MJC_SEL>;
+					clock-names = "mm", "mjc";
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT6795_POWER_DOMAIN_AUDIO {
+					reg = <MT6795_POWER_DOMAIN_AUDIO>;
+					#power-domain-cells = <0>;
+				};
+
+				mfg_async: power-domain@MT6795_POWER_DOMAIN_MFG_ASYNC {
+					reg = <MT6795_POWER_DOMAIN_MFG_ASYNC>;
+					clocks = <&clk26m>;
+					clock-names = "mfg";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#power-domain-cells = <1>;
+
+					power-domain@MT6795_POWER_DOMAIN_MFG_2D {
+						reg = <MT6795_POWER_DOMAIN_MFG_2D>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						#power-domain-cells = <1>;
+
+						power-domain@MT6795_POWER_DOMAIN_MFG {
+							reg = <MT6795_POWER_DOMAIN_MFG>;
+							#power-domain-cells = <0>;
+							mediatek,infracfg = <&infracfg>;
+						};
+					};
+				};
+			};
+		};
+
 		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt6795-pinctrl";
 			reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
-- 
2.40.0

