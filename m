Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA7222035C
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jul 2020 06:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgGOET0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jul 2020 00:19:26 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11959 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbgGOETZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jul 2020 00:19:25 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0e83920000>; Tue, 14 Jul 2020 21:18:27 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 21:19:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 14 Jul 2020 21:19:25 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 04:19:24 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 15 Jul 2020 04:19:23 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0e83ca0002>; Tue, 14 Jul 2020 21:19:23 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v3 02/18] arm64: tegra: Add missing clocks and power-domains to Tegra210 VI I2C
Date:   Tue, 14 Jul 2020 21:20:39 -0700
Message-ID: <1594786855-26506-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594786707; bh=v4jvA2ws+jGeq8HdlC90J3dYqc1EOn/BsdDD724mHAI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Ps9SuL2oJb6j75CIHNyrdHhd8UbkFrZxe1WCcnOux6mjctjrGze2iciHUErXkDdqB
         CIj1unXhv4hoWgrj2gNEQmqNym3te8EAgNc1asHC3vkbrk0g9u/XIncj2LMv9avzMa
         WOM8vrkTAtimHYPNevpW6qC8nwAtQpYgMo9uDcZH9zjOxIGk01laX7cPjGek+GTLQi
         2hu7Jm1tRwG6Z1ppc69lKOrRvNTT0VJdCzCkIh2t1TaIBYdbOLl0nZV49BxpDDROFq
         v34Z86aRTBjucbb/52qeeIX/S7+zcPHJc+qP1vwVQqbkhXwyRurq7Hlrwp3utxOoGw
         wmQ0jAxNnxo7Q==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tegra210 VI I2C is in VE power domain and i2c-vi node should have
power-domains property.

Current Tegra210 i2c-vi device node is missing both VI I2C clocks
and power-domains property.

This patch adds them.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index f4e0cc2..3827e43 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -375,6 +375,12 @@
 			compatible = "nvidia,tegra210-i2c-vi";
 			reg = <0x0 0x546c0000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA210_CLK_VI_I2C>,
+				 <&tegra_car TEGRA210_CLK_I2CSLOW>;
+			clock-names = "div-clk", "slow";
+			resets = <&tegra_car TEGRA210_CLK_VI_I2C>;
+			reset-names = "i2c";
+			power-domains = <&pd_venc>;
 			status = "disabled";
 		};
 	};
-- 
2.7.4

