Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27FA42F1979
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 16:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388123AbhAKPSq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 10:18:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:54238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387696AbhAKPSp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 10:18:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E671B22795;
        Mon, 11 Jan 2021 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610378284;
        bh=1k/dDAFiDUWxTSUPTCRsR3hrQeA+upFSBkz9fiRxVQQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pJoA99L7F+nG63Gzc0eukLFTRCbMhaInrZAtZrdKHoRTuZk016tuk6fOKhl6bKhmR
         quDgj+P2ql+3OrLljdEUsNLZdxDDhQXY8bCpAptXRRvoIuEqfYTRYbRRWwhBzxcoTd
         HewvUnmhB5CRzAwsl/7hyqF2fghJn+4uuFWyL0earuxwK33V23l0XHavJdcSsrcrYf
         lS39IeFA/YfEqKuBLXTwC8JIE6uqv0R55FE6OtL85V7xVM25xOGbzzLXij4Gwzd/y3
         wJWvQl3ngiD9zT1vmiGmUMYeloGNwt7OVLFtZHpRE3oNeZ+MtNmBgrOHStN1t7nhnv
         CpMI0HlSfAiag==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: qcom: sdm845: enable dma for spi
Date:   Mon, 11 Jan 2021 20:46:51 +0530
Message-Id: <20210111151651.1616813-8-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111151651.1616813-1-vkoul@kernel.org>
References: <20210111151651.1616813-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add dmas property for spi@880000 and pinconf setting so that we can use
dma for this spi device. Also, add iommu properties for qup and spi.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts |  4 ++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 7cc236575ee2..0653468f26ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -418,6 +418,10 @@ &gcc {
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
 &gpu {
 	zap-shader {
 		memory-region = <&gpu_mem>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index c9a127bbd606..bd9952f54721 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/clock/qcom,lpass-sdm845.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sdm845.h>
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sdm845.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -1183,6 +1184,9 @@ spi0: spi@880000 {
 				interconnects = <&aggre1_noc MASTER_QUP_1 0 &config_noc SLAVE_BLSP_1 0>,
 						<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_BLSP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -2622,6 +2626,13 @@ pinmux {
 					       "gpio2", "gpio3";
 					function = "qup0";
 				};
+
+				config {
+					pins = "gpio0", "gpio1",
+					       "gpio2", "gpio3";
+					drive-strength = <6>;
+					bias-disable;
+				};
 			};
 
 			qup_spi1_default: qup-spi1-default {
-- 
2.26.2

