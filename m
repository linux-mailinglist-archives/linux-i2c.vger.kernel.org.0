Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCED21F33DB
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 07:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgFIF6H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 01:58:07 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:52616 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727940AbgFIF6G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jun 2020 01:58:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591682285; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=q8kzs4UYKNSlF4zri7yR6KOe1GLU0CqeSa6RNRVZDfs=; b=oLFO/UQlehC/5AehEYN2319Mi7f4mWBSJO7R1K20tI0wOXBSO6lw2oplZKjVfaLc7p5JsoO7
 WAEyrRhhWQ8R9guTUCqU+t7I36X1ruMm/r/ut05TnVKu7oO0Hv8uDzHg/mu1jWKHy0avsod4
 vvO2TLnC8EYlhFcaF/FkHzpiaOc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5edf24d6d9f1a4ceef4d9ecd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 05:57:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 81A1CC433C6; Tue,  9 Jun 2020 05:57:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 150BFC433BA;
        Tue,  9 Jun 2020 05:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 150BFC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org,
        msavaliy@codeaurora.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V7 RESEND 7/7] arm64: dts: sc7180: Add interconnect for QUP and QSPI
Date:   Tue,  9 Jun 2020 11:26:34 +0530
Message-Id: <1591682194-32388-8-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591682194-32388-1-git-send-email-akashast@codeaurora.org>
References: <1591682194-32388-1-git-send-email-akashast@codeaurora.org>
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

Change in V4:
 - No change.

Changes in V5:
 - No change.

Chnages in V6:
 - No change.

Changes in V7:
 - No change.

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 127 +++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 31b9217..3624bde 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -547,6 +547,8 @@
 			#size-cells = <2>;
 			ranges;
 			iommus = <&apps_smmu 0x43 0x0>;
+			interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>;
+			interconnect-names = "qup-core";
 			status = "disabled";
 
 			i2c0: i2c@880000 {
@@ -559,6 +561,11 @@
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
 
@@ -572,6 +579,9 @@
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -583,6 +593,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart0_default>;
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -596,6 +609,11 @@
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
 
@@ -609,6 +627,9 @@
 				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -620,6 +641,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart1_default>;
 				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -633,6 +657,11 @@
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
 
@@ -644,6 +673,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart2_default>;
 				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -657,6 +689,11 @@
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
 
@@ -670,6 +707,9 @@
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -681,6 +721,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart3_default>;
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -694,6 +737,11 @@
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
 
@@ -705,6 +753,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart4_default>;
 				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -718,6 +769,11 @@
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
 
@@ -731,6 +787,9 @@
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -742,6 +801,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart5_default>;
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 		};
@@ -756,6 +818,8 @@
 			#size-cells = <2>;
 			ranges;
 			iommus = <&apps_smmu 0x4c3 0x0>;
+			interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>;
+			interconnect-names = "qup-core";
 			status = "disabled";
 
 			i2c6: i2c@a80000 {
@@ -768,6 +832,11 @@
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
 
@@ -781,6 +850,9 @@
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -792,6 +864,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart6_default>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -805,6 +880,11 @@
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
 
@@ -816,6 +896,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart7_default>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -829,6 +912,11 @@
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
 
@@ -842,6 +930,9 @@
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -853,6 +944,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart8_default>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -866,6 +960,11 @@
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
 
@@ -877,6 +976,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart9_default>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -890,6 +992,11 @@
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
 
@@ -903,6 +1010,9 @@
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -914,6 +1024,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart10_default>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -927,6 +1040,11 @@
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
 
@@ -940,6 +1058,9 @@
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -951,6 +1072,9 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart11_default>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
+						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 		};
@@ -2132,6 +2256,9 @@
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

