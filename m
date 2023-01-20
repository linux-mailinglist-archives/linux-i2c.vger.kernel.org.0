Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C92E67557A
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 14:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjATNSn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 08:18:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbjATNSg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 08:18:36 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB76BC41F7
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 05:15:03 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id kt14so13894213ejc.3
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 05:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwOqzf9R7uT7rGnQwy0vwJjfAeAuPeUDIWBIETds350=;
        b=OjovKzTl0s7/JFX7HiitnHEZbspdX38IUG1ceXIElPZKDkRS+eA34Vabe3tRlINfKY
         K5sxHSkmWsIVY5e0OUjACmtZi1xLfUrc+4mE4D4XNc+PEkhb3m8FoX4F1djXtXSp7xz7
         NIBu2PLX7zirMHAbm180RpXt+N/zM1CzQ+bj1tBMOaYJsCVYNJCmujv1D8wTpkK1+LyK
         fIKLvF3sBdwuSzikosEuHDtmnIcAFvmH1jaXKggHzmpjDORUf3DQ/XgXUYn4ljO/Rvfz
         FBaHmsxeET5pNU4/NI7ECdceoeeh1muHBhbc+5tUz1mSaHBbp28ZtBjV+MA3kr7oFtS0
         WjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwOqzf9R7uT7rGnQwy0vwJjfAeAuPeUDIWBIETds350=;
        b=Ky1geBnjIyEZn7qt1Y77cd9DhIuYdhGOcFsqmrUNE7kMiGOX1SwEnGCCtbHnDnxPOr
         E2aHI6G9iy0QfcZvSGcK6P/UqpFtAZuxnPcFPQty5nmrHtoRto9r9Ybc0yHPIWv6LHA/
         9rqVR0TumYyOoy5RugZoS/2dx44v4m3aRjDRBgmYbJyh03g31h6n48C1JrtLXc74HMaW
         EPHT7hngBniNIMuSMu7eAaDaqxY0U91EGI++LkDn0JS1VuNLgyGRtRLgTg5F4K3fH+PL
         rs51sLnG6ie+fwxQ9YxnsI44Wq6W7XTQjQ9qF7p01jrjl+iJjwl6I30vg6WhFUFQmsED
         8lMg==
X-Gm-Message-State: AFqh2kog3mk3U3+c6avEtX+MyTe+u3a6Miz8z/fJOxVYLYh3FV2U+eYo
        fV0rginquWGhzuU58BkjORkavfsvKEFlC13wgYOr0Q==
X-Google-Smtp-Source: AMrXdXvL7IOr4H2KuxOoBPBNi6gt8ip/qp3X831ZZU8m1YHLRc4xw18f1Jf0RLbF06drPMGSU3EO0A==
X-Received: by 2002:a17:906:60d0:b0:877:612e:516e with SMTP id f16-20020a17090660d000b00877612e516emr29754553ejk.61.1674220493307;
        Fri, 20 Jan 2023 05:14:53 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm8063276ejg.223.2023.01.20.05.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 05:14:53 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 20 Jan 2023 14:13:46 +0100
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm6350: Add CCI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221213-sm6350-cci-v2-3-15c2c14c34bb@fairphone.com>
References: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
In-Reply-To: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12-dev-78462
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add nodes for the two CCI blocks found on SM6350.

The first contains two i2c busses and while the second one might also
contains two busses, the downstream kernel only has one configured, and
some boards use the GPIOs for the potential cci1_i2c1 one other
purposes, so leave that one unconfigured.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 132 +++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 300ced5cda57..802d7f494162 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/clock/qcom,gcc-sm6350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm6350-camcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -1435,6 +1436,95 @@ usb_1_dwc3: usb@a600000 {
 			};
 		};
 
+		cci0: cci@ac4a000 {
+			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac4a000 0 0x1000>;
+			interrupts = <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
+				 <&camcc CAMCC_SOC_AHB_CLK>,
+				 <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAMCC_CPAS_AHB_CLK>,
+				 <&camcc CAMCC_CCI_0_CLK>,
+				 <&camcc CAMCC_CCI_0_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "soc_ahb",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+
+			assigned-clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
+					  <&camcc CAMCC_CCI_0_CLK>;
+			assigned-clock-rates = <80000000>, <37500000>;
+
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac4b000 {
+			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac4b000 0 0x1000>;
+			interrupts = <GIC_SPI 462 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
+				 <&camcc CAMCC_SOC_AHB_CLK>,
+				 <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAMCC_CPAS_AHB_CLK>,
+				 <&camcc CAMCC_CCI_1_CLK>,
+				 <&camcc CAMCC_CCI_1_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "soc_ahb",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+
+			assigned-clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
+					  <&camcc CAMCC_CCI_1_CLK>;
+			assigned-clock-rates = <80000000>, <37500000>;
+
+			pinctrl-0 = <&cci2_default>;
+			pinctrl-1 = <&cci2_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			/* SM6350 seems to have cci1_i2c1 on gpio2 & gpio3 but unused downstream */
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sm6350-camcc";
 			reg = <0 0x0ad00000 0 0x16000>;
@@ -1522,6 +1612,48 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 157>;
 
+			cci0_default: cci0-default-state {
+				pins = "gpio39", "gpio40";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				pins = "gpio39", "gpio40";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_default: cci1-default-state {
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci2_default: cci2-default-state {
+				pins = "gpio43", "gpio44";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci2_sleep: cci2-sleep-state {
+				pins = "gpio43", "gpio44";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc2_off_state: sdc2-off-state {
 				clk-pins {
 					pins = "sdc2_clk";

-- 
2.39.1

