Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D2A2F1977
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 16:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387892AbhAKPSi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 10:18:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:54186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727180AbhAKPSh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 10:18:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 701B622B30;
        Mon, 11 Jan 2021 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610378276;
        bh=oPteTSWipDkKpk/yH9fnINrwtd3mWP6TTK/9xr6Tb/I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RDM4+HGrBN6pKYIIKA68wDw7niouvszWFjD1fg74+UnX6bcm/aGSGClxx9jlST6/u
         Tiebu1ftuv7XSFN2eLW1lnMGiXngzx6YwkO0zX5qBTsEJvAHKG/s8iYuXqn8bfPyny
         GY/P5hlj8XC5iexuFMNuyI2WhsyQQ4hmVigowqUqKZf1xCYaF5wz31hY+POAuQ1kZd
         rQl067wUo+UoRcc64HybIr9auJpk0YMqRJmHYkV7Sh+j2Z6Hyzge+YGDq0MQLjMRyZ
         KJjyjP4i3itKCB9Jw0ws57wfaz7nVXBuwAFad/me1TcpH8UgVa5TRCzq8GHnMfOd9D
         zT67wUznY4p0Q==
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
Subject: [PATCH 6/7] arm64: dts: qcom: sdm845: Add gpi dma node
Date:   Mon, 11 Jan 2021 20:46:50 +0530
Message-Id: <20210111151651.1616813-7-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111151651.1616813-1-vkoul@kernel.org>
References: <20210111151651.1616813-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This add the device node for gpi dma0 instances found in sdm845.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bcf888381f14..c9a127bbd606 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1114,6 +1114,29 @@ opp-128000000 {
 			};
 		};
 
+		gpi_dma0: dma-controller@800000 {
+			#dma-cells = <3>;
+			compatible = "qcom,sdm845-gpi-dma";
+			reg = <0 0x00800000 0 0x60000>;
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <13>;
+			dma-channel-mask = <0xfa>;
+			iommus = <&apps_smmu 0x0016 0x0>;
+			status = "disabled";
+		};
+
 		qupv3_id_0: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x008c0000 0 0x6000>;
@@ -1533,6 +1556,29 @@ uart7: serial@89c000 {
 			};
 		};
 
+		gpi_dma1: dma-controller@0xa00000 {
+			#dma-cells = <3>;
+			compatible = "qcom,sdm845-gpi-dma";
+			reg = <0 0x00a00000 0 0x60000>;
+			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <13>;
+			dma-channel-mask = <0xfa>;
+			iommus = <&apps_smmu 0x06d6 0x0>;
+			status = "disabled";
+		};
+
 		qupv3_id_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x00ac0000 0 0x6000>;
-- 
2.26.2

