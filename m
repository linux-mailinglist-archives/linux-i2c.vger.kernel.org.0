Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D411199522
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 13:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730436AbgCaLNA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 07:13:00 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:21738 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730418AbgCaLNA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 07:13:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585653179; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=h+Q2JHKRe7Lkk3FcZazURrfwOWzYXqsAHNSlfpO4WMQ=; b=rdW51H7K0KTomWAaRj0Y60qksKrV7GPf3tbRWUzJb9Ec9jS4D/BPibdMI8tNuwMdUQdcHJf6
 vz6+sA87GbdXSDThP58vFf2HHF85O7dE14iUw4sWv5kmQJ6kITs3CevDFKDzvZDYtR5eBOTf
 0VYIbPPaOb0mON84y7xy0ZMQ+l0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8325bb.7f3256e2a6f8-smtp-out-n04;
 Tue, 31 Mar 2020 11:12:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4490AC00451; Tue, 31 Mar 2020 11:12:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72D09C494AD;
        Tue, 31 Mar 2020 11:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 72D09C494AD
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, georgi.djakov@linaro.org
Cc:     linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V3 8/8] arm64: dts: sc7180: Add interconnect for QUP and QSPI
Date:   Tue, 31 Mar 2020 16:39:36 +0530
Message-Id: <1585652976-17481-9-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add interconnect ports for GENI QUPs and QSPI to set bus capabilities.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V2:
 - As per Bjorn's comment, ignoring 80 char limit in defining interconnects
   paths.

Changes in V3:
 - No change.

Note: This won't compile without patch@patchwork.kernel.org/patch/11430403
	[arm64: dts: sc7180: Include interconnect definitions]

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 127 +++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 998f101..65d5c85 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -427,6 +427,8 @@
 			#size-cells = <2>;
 			ranges;
 			iommus = <&apps_smmu 0x43 0x0>;
+			interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>;
+			interconnect-names = "qup-core";
 			status = "disabled";
 
 			i2c0: i2c@880000 {
@@ -439,6 +441,11 @@
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>,
+						<&aggre1_noc MASTER_QUP_0 &mc_virt SLAVE_EBI1>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
 				status = "disabled";
 			};
 
@@ -452,6 +459,9 @@
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -463,6 +473,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart0_default>;
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -476,6 +489,11 @@
 				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>,
+						<&aggre1_noc MASTER_QUP_0 &mc_virt SLAVE_EBI1>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
 				status = "disabled";
 			};
 
@@ -489,6 +507,9 @@
 				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -500,6 +521,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart1_default>;
 				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -513,6 +537,11 @@
 				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>,
+						<&aggre1_noc MASTER_QUP_0 &mc_virt SLAVE_EBI1>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
 				status = "disabled";
 			};
 
@@ -524,6 +553,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart2_default>;
 				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -537,6 +569,11 @@
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>,
+						<&aggre1_noc MASTER_QUP_0 &mc_virt SLAVE_EBI1>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
 				status = "disabled";
 			};
 
@@ -550,6 +587,9 @@
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -561,6 +601,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart3_default>;
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -574,6 +617,11 @@
 				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>,
+						<&aggre1_noc MASTER_QUP_0 &mc_virt SLAVE_EBI1>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
 				status = "disabled";
 			};
 
@@ -585,6 +633,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart4_default>;
 				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -598,6 +649,11 @@
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>,
+						<&aggre1_noc MASTER_QUP_0 &mc_virt SLAVE_EBI1>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
 				status = "disabled";
 			};
 
@@ -611,6 +667,9 @@
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -622,6 +681,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart5_default>;
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 		};
@@ -636,6 +698,8 @@
 			#size-cells = <2>;
 			ranges;
 			iommus = <&apps_smmu 0x4c3 0x0>;
+			interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>;
+			interconnect-names = "qup-core";
 			status = "disabled";
 
 			i2c6: i2c@a80000 {
@@ -648,6 +712,11 @@
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>,
+						<&aggre2_noc MASTER_QUP_1 &mc_virt SLAVE_EBI1>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
 				status = "disabled";
 			};
 
@@ -661,6 +730,9 @@
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -672,6 +744,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart6_default>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -685,6 +760,11 @@
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>,
+						<&aggre2_noc MASTER_QUP_1 &mc_virt SLAVE_EBI1>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
 				status = "disabled";
 			};
 
@@ -696,6 +776,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart7_default>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -709,6 +792,11 @@
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>,
+						<&aggre2_noc MASTER_QUP_1 &mc_virt SLAVE_EBI1>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
 				status = "disabled";
 			};
 
@@ -722,6 +810,9 @@
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -733,6 +824,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart8_default>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -746,6 +840,11 @@
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>,
+						<&aggre2_noc MASTER_QUP_1 &mc_virt SLAVE_EBI1>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
 				status = "disabled";
 			};
 
@@ -757,6 +856,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart9_default>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -770,6 +872,11 @@
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>,
+						<&aggre2_noc MASTER_QUP_1 &mc_virt SLAVE_EBI1>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
 				status = "disabled";
 			};
 
@@ -783,6 +890,9 @@
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -794,6 +904,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart10_default>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -807,6 +920,11 @@
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>,
+						<&aggre2_noc MASTER_QUP_1 &mc_virt SLAVE_EBI1>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
 				status = "disabled";
 			};
 
@@ -820,6 +938,9 @@
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -831,6 +952,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart11_default>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 		};
@@ -1335,6 +1459,9 @@
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
+			interconnects = <&gem_noc MASTER_APPSS_PROC
+					&config_noc SLAVE_QSPI_0>;
+			interconnect-names = "qspi-config";
 			status = "disabled";
 		};
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
