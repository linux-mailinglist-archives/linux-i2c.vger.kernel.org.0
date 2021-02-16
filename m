Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3FDA31D010
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 19:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbhBPSRM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 13:17:12 -0500
Received: from mga06.intel.com ([134.134.136.31]:16491 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230216AbhBPSRK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Feb 2021 13:17:10 -0500
IronPort-SDR: oAHBjHdXFz/gliIWGLWaaj9sWBOtn1UGqC4BAPlP6NgmN5d8xEuxNhgTFvDKGWAu2+71YhKfx3
 iTX716M/xU7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="244445796"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="244445796"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 10:15:28 -0800
IronPort-SDR: Pr7zy6M4x7i/Dozg7fXObwU6czymybPFoVCbgcj/TyFv3Ex9VPYMuqtISEtSfMG6ifMV6hrETZ
 VtL5gheszH/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="493376023"
Received: from maru.jf.intel.com ([10.54.51.77])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2021 10:15:28 -0800
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v3 1/4] dt-bindings: i2c: aspeed: add transfer mode support
Date:   Tue, 16 Feb 2021 10:27:32 -0800
Message-Id: <20210216182735.11639-2-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210216182735.11639-1-jae.hyun.yoo@linux.intel.com>
References: <20210216182735.11639-1-jae.hyun.yoo@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Append bindings to support transfer mode.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
Changes since v2:
- Moved SRAM resources back to default dtsi and added a mode selection
  property.

Changes since v1:
- Removed buffer reg settings from default device tree and added the settings
  into here to show the predefined buffer range per each bus.

 .../devicetree/bindings/i2c/i2c-aspeed.txt    | 37 +++++++++++++++----
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
index b47f6ccb196a..242343177324 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
@@ -17,6 +17,20 @@ Optional Properties:
 - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
 		  specified
 - multi-master	: states that there is another master active on this bus.
+- aspeed,i2c-xfer-mode	: should be "byte", "buf" or "dma" to select transfer
+			  mode defaults to "byte" mode when not specified.
+
+			  I2C DMA mode on AST2500 has these restrictions:
+			    - If one of these controllers is enabled
+				* UHCI host controller
+				* MCTP controller
+			      I2C has to use buffer mode or byte mode instead
+			      since these controllers run only in DMA mode and
+			      I2C is sharing the same DMA H/W with them.
+			    - If one of these controllers uses DMA mode, I2C
+			      can't use DMA mode
+				* SD/eMMC
+				* Port80 snoop
 
 Example:
 
@@ -26,20 +40,29 @@ i2c {
 	#size-cells = <1>;
 	ranges = <0 0x1e78a000 0x1000>;
 
-	i2c_ic: interrupt-controller@0 {
-		#interrupt-cells = <1>;
-		compatible = "aspeed,ast2400-i2c-ic";
+	i2c_gr: i2c-global-regs@0 {
+		compatible = "aspeed,ast2500-i2c-gr", "syscon";
 		reg = <0x0 0x40>;
-		interrupts = <12>;
-		interrupt-controller;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x40>;
+
+		i2c_ic: interrupt-controller@0 {
+			#interrupt-cells = <1>;
+			compatible = "aspeed,ast2500-i2c-ic";
+			reg = <0x0 0x4>;
+			interrupts = <12>;
+			interrupt-controller;
+		};
 	};
 
 	i2c0: i2c-bus@40 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x40 0x40>;
-		compatible = "aspeed,ast2400-i2c-bus";
+		reg = <0x40 0x40>, <0x200 0x10>;
+		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		bus-frequency = <100000>;
-- 
2.17.1

