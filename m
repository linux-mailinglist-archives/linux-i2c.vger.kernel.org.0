Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EADD675320
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 12:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjATLMc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 06:12:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjATLM3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 06:12:29 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D57439290
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 03:12:28 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ss4so12987684ejb.11
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 03:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9WLlPdieij4OuAezuKlLvHfYkHrpLddAFoHWcWPPXE=;
        b=3nR5nl2qOPfmf0muezQFGQzAG1VEB0NeSYa/15JuXXZ5b4aM472gLHhO1HjyhwaazP
         fUoF8AJpo/uosj3rl+3F/PijFG3TQ0+XHkTpZ1fcwFqNifirO5V43nFP/2e+2Sq9Zdux
         omIpvt3Jo0+cue6eav/ZiamT2pv8ZKzSmAnxIwt1WZy/UPxhTYZH4EhN9pHFTr2RycfH
         xYK4ZAVZz5wWz6n4mBhU4XoHxiUIuiGbRMKJ3uCKhQfTBSYENTBbRVl1pxnreT0+5Hbx
         BV2bCCGVb1o3M0NeYhc8Pwf4aNcD+HKUP8vPoZJrRyLJTvbKWYJ5OFJJwwS6oStYqyHU
         UWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9WLlPdieij4OuAezuKlLvHfYkHrpLddAFoHWcWPPXE=;
        b=IVA/omULuhr7oXUL245Vr+9ffSxbOq+xcRiKh2oy3c9WiLIKFXkF7Fja6kUZPSTaXi
         sgMhaTfBbtDQv4Eeiq+0LIeTiTjZ3xrtaOI0v2T6SnjGa3LDF65099rQYMs3Mc+ZFx0g
         rdGHxgpLMRh9Wbd8bTl9Qar/rsfvneL+sm9Mtultd5WW4Ghxy6hP6gIhihV16D2pWksq
         R2KQWibRNVrTJbJcBYIBcXNxxwamoz6FtYmehNt1PIAxenOPF/NoycjRtKDRUXgfNF5L
         MXCzElIUgpEAdQ2Zsr8BOOc7Jc68n52n7k76NbIBEDl/j35XHHhtRI17/yQIuZ68PNlD
         grdg==
X-Gm-Message-State: AFqh2kr7AycBJBSbIBPaIzUwl3/XQiwnR64EC+A0naYBDKOvp7w/2rzV
        PYWaLHYaD31WCSIwz/ezSh7OFA==
X-Google-Smtp-Source: AMrXdXs2k9XyQndBwwfHAo/3eao7qBDz22AyoYfy2kcscXU6U69Va0Xh8482o0jZoEJjAwojAz47/A==
X-Received: by 2002:a17:907:1759:b0:85e:c4e4:cfbf with SMTP id lf25-20020a170907175900b0085ec4e4cfbfmr14943435ejc.15.1674213147775;
        Fri, 20 Jan 2023 03:12:27 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id du1-20020a17090772c100b0084bfd56fb3bsm17667492ejc.162.2023.01.20.03.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 03:12:27 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 20 Jan 2023 12:11:55 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: sm6350: Add CCI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221213-sm6350-cci-v1-3-e5d0c36e0c4f@fairphone.com>
References: <20221213-sm6350-cci-v1-0-e5d0c36e0c4f@fairphone.com>
In-Reply-To: <20221213-sm6350-cci-v1-0-e5d0c36e0c4f@fairphone.com>
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
X-Mailer: b4 0.11.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
index 300ced5cda57..666c1c80e4e6 100644
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
+			#address-cells = <1>;
+			#size-cells = <0>;
+
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
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
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
+			#address-cells = <1>;
+			#size-cells = <0>;
+
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
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&cci2_default>;
+			pinctrl-1 = <&cci2_sleep>;
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
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				pins = "gpio39", "gpio40";
+				function = "cci_i2c";
+				bias-pull-down;
+				drive-strength = <2>;
+			};
+
+			cci1_default: cci1-default-state {
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c";
+				bias-pull-down;
+				drive-strength = <2>;
+			};
+
+			cci2_default: cci2-default-state {
+				pins = "gpio43", "gpio44";
+				function = "cci_i2c";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+
+			cci2_sleep: cci2-sleep-state {
+				pins = "gpio43", "gpio44";
+				function = "cci_i2c";
+				bias-pull-down;
+				drive-strength = <2>;
+			};
+
 			sdc2_off_state: sdc2-off-state {
 				clk-pins {
 					pins = "sdc2_clk";

-- 
2.39.1
