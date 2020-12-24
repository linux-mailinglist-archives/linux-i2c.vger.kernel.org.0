Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66D62E2616
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Dec 2020 12:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgLXLOF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Dec 2020 06:14:05 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:1807 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgLXLOF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Dec 2020 06:14:05 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 24 Dec 2020 03:12:57 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Dec 2020 03:12:54 -0800
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Dec 2020 16:42:15 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 7BB972DC8; Thu, 24 Dec 2020 16:42:14 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, wsa@kernel.org
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        parashar@codeaurora.org, rnayak@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH 2/3] arm64: dts: sc7180: Add assigned-performance-states for i2c
Date:   Thu, 24 Dec 2020 16:42:09 +0530
Message-Id: <20201224111210.1214-3-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201224111210.1214-1-rojay@codeaurora.org>
References: <20201224111210.1214-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

qup-i2c devices on sc7180 are clocked with a fixed clock (19.2 MHz).
Though qup-i2c does not support DVFS, it still needs to vote for a
performance state on 'CX' to satisfy the 19.2 MHz clock frequency
requirement.

Use 'assigned-performance-states' to pass this information from
device tree, and also add the power-domains property to specify
the CX power-domain.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 22b832fc62e3..70d74215ba8b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -782,6 +782,8 @@ i2c0: i2c@880000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				power-domains = <&rpmhpd SC7180_CX>;
+				assigned-performance-states = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				status = "disabled";
 			};
 
@@ -834,6 +836,8 @@ i2c1: i2c@884000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				power-domains = <&rpmhpd SC7180_CX>;
+				assigned-performance-states = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				status = "disabled";
 			};
 
@@ -886,6 +890,8 @@ i2c2: i2c@888000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				power-domains = <&rpmhpd SC7180_CX>;
+				assigned-performance-states = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				status = "disabled";
 			};
 
@@ -920,6 +926,8 @@ i2c3: i2c@88c000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				power-domains = <&rpmhpd SC7180_CX>;
+				assigned-performance-states = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				status = "disabled";
 			};
 
@@ -972,6 +980,8 @@ i2c4: i2c@890000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				power-domains = <&rpmhpd SC7180_CX>;
+				assigned-performance-states = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				status = "disabled";
 			};
 
@@ -1006,6 +1016,8 @@ i2c5: i2c@894000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				power-domains = <&rpmhpd SC7180_CX>;
+				assigned-performance-states = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				status = "disabled";
 			};
 
@@ -1073,6 +1085,8 @@ i2c6: i2c@a80000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				power-domains = <&rpmhpd SC7180_CX>;
+				assigned-performance-states = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				status = "disabled";
 			};
 
@@ -1125,6 +1139,8 @@ i2c7: i2c@a84000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				power-domains = <&rpmhpd SC7180_CX>;
+				assigned-performance-states = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				status = "disabled";
 			};
 
@@ -1159,6 +1175,8 @@ i2c8: i2c@a88000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				power-domains = <&rpmhpd SC7180_CX>;
+				assigned-performance-states = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				status = "disabled";
 			};
 
@@ -1211,6 +1229,8 @@ i2c9: i2c@a8c000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				power-domains = <&rpmhpd SC7180_CX>;
+				assigned-performance-states = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				status = "disabled";
 			};
 
@@ -1245,6 +1265,8 @@ i2c10: i2c@a90000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				power-domains = <&rpmhpd SC7180_CX>;
+				assigned-performance-states = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				status = "disabled";
 			};
 
@@ -1297,6 +1319,8 @@ i2c11: i2c@a94000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				power-domains = <&rpmhpd SC7180_CX>;
+				assigned-performance-states = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				status = "disabled";
 			};
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

