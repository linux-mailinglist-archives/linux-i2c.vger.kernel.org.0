Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AED02F23F3
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 01:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbhALA2s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 19:28:48 -0500
Received: from mga14.intel.com ([192.55.52.115]:7253 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729259AbhALA2r (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 19:28:47 -0500
IronPort-SDR: n/wHwSf8peDHRsPcBr7KL06qCjmcKEEkm6af+DDuHxmUGdb8SzZ0UQx4OfsU45aRgb/pVVqTEB
 DRWfc3ToYNAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="177184943"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; 
   d="scan'208";a="177184943"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 16:27:00 -0800
IronPort-SDR: Cr12xAVxE5lcUYkw/KRv/EOF1Xm1ELIKMEuQbRYXDb4S1Fj09ygeKe0mmX21u9VsuTBKkcX4vy
 6fbj0tUvToHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; 
   d="scan'208";a="348273530"
Received: from maru.jf.intel.com ([10.54.51.77])
  by orsmga003.jf.intel.com with ESMTP; 11 Jan 2021 16:26:59 -0800
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
Subject: [PATCH v2 1/4] dt-bindings: i2c: aspeed: add buffer and DMA mode transfer support
Date:   Mon, 11 Jan 2021 16:37:46 -0800
Message-Id: <20210112003749.10565-2-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
References: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Append bindings to support buffer mode and DMA mode transfer.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
Changes since v1:
- Removed buffer reg settings from default device tree and added the settings
  into here to show the predefined buffer range per each bus.

 .../devicetree/bindings/i2c/i2c-aspeed.txt    | 126 +++++++++++++++++-
 1 file changed, 119 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
index b47f6ccb196a..978e8402fdfc 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
@@ -3,7 +3,62 @@ Device tree configuration for the I2C busses on the AST24XX, AST25XX, and AST26X
 Required Properties:
 - #address-cells	: should be 1
 - #size-cells		: should be 0
-- reg			: address offset and range of bus
+- reg			: Address offset and range of bus registers.
+
+			  An additional SRAM buffer address offset and range is
+			  optional in case of enabling I2C dedicated SRAM for
+			  buffer mode transfer support. If the optional range
+			  is defined, buffer mode will be enabled.
+			  - AST2400
+			    &i2c0 { reg = <0x40 0x40>, <0x800 0x80>; };
+			    &i2c1 { reg = <0x80 0x40>, <0x880 0x80>; };
+			    &i2c2 { reg = <0xc0 0x40>, <0x900 0x80>; };
+			    &i2c3 { reg = <0x100 0x40>, <0x980 0x80>; };
+			    &i2c4 { reg = <0x140 0x40>, <0xa00 0x80>; };
+			    &i2c5 { reg = <0x180 0x40>, <0xa80 0x80>; };
+			    &i2c6 { reg = <0x1c0 0x40>, <0xb00 0x80>; };
+			    &i2c7 { reg = <0x300 0x40>, <0xb80 0x80>; };
+			    &i2c8 { reg = <0x340 0x40>, <0xc00 0x80>; };
+			    &i2c9 { reg = <0x380 0x40>, <0xc80 0x80>; };
+			    &i2c10 { reg = <0x3c0 0x40>, <0xd00 0x80>; };
+			    &i2c11 { reg = <0x400 0x40>, <0xd80 0x80>; };
+			    &i2c12 { reg = <0x440 0x40>, <0xe00 0x80>; };
+			    &i2c13 { reg = <0x480 0x40>, <0xe80 0x80>; };
+
+			  - AST2500
+			    &i2c0 { reg = <0x40 0x40>, <0x200 0x10>; };
+			    &i2c1 { reg = <0x80 0x40>, <0x210 0x10>; };
+			    &i2c2 { reg = <0xc0 0x40>, <0x220 0x10>; };
+			    &i2c3 { reg = <0x100 0x40>, <0x230 0x10>; };
+			    &i2c4 { reg = <0x140 0x40>, <0x240 0x10>; };
+			    &i2c5 { reg = <0x180 0x40>, <0x250 0x10>; };
+			    &i2c6 { reg = <0x1c0 0x40>, <0x260 0x10>; };
+			    &i2c7 { reg = <0x300 0x40>, <0x270 0x10>; };
+			    &i2c8 { reg = <0x340 0x40>, <0x280 0x10>; };
+			    &i2c9 { reg = <0x380 0x40>, <0x290 0x10>; };
+			    &i2c10 { reg = <0x3c0 0x40>, <0x2a0 0x10>; };
+			    &i2c11 { reg = <0x400 0x40>, <0x2b0 0x10>; };
+			    &i2c12 { reg = <0x440 0x40>, <0x2c0 0x10>; };
+			    &i2c13 { reg = <0x480 0x40>, <0x2d0 0x10>; };
+
+			  - AST2600
+			    &i2c0 { reg = <0x80 0x80>, <0xc00 0x20>; };
+			    &i2c1 { reg = <0x100 0x80>, <0xc20 0x20>; };
+			    &i2c2 { reg = <0x180 0x80>, <0xc40 0x20>; };
+			    &i2c3 { reg = <0x200 0x80>, <0xc60 0x20>; };
+			    &i2c4 { reg = <0x280 0x80>, <0xc80 0x20>; };
+			    &i2c5 { reg = <0x300 0x80>, <0xca0 0x20>; };
+			    &i2c6 { reg = <0x380 0x80>, <0xcc0 0x20>; };
+			    &i2c7 { reg = <0x400 0x80>, <0xce0 0x20>; };
+			    &i2c8 { reg = <0x480 0x80>, <0xd00 0x20>; };
+			    &i2c9 { reg = <0x500 0x80>, <0xd20 0x20>; };
+			    &i2c10 { reg = <0x580 0x80>, <0xd40 0x20>; };
+			    &i2c11 { reg = <0x600 0x80>, <0xd60 0x20>; };
+			    &i2c12 { reg = <0x680 0x80>, <0xd80 0x20>; };
+			    &i2c13 { reg = <0x700 0x80>, <0xda0 0x20>; };
+			    &i2c14 { reg = <0x780 0x80>, <0xdc0 0x20>; };
+			    &i2c15 { reg = <0x800 0x80>, <0xde0 0x20>; };
+
 - compatible		: should be "aspeed,ast2400-i2c-bus"
 			  or "aspeed,ast2500-i2c-bus"
 			  or "aspeed,ast2600-i2c-bus"
@@ -17,6 +72,25 @@ Optional Properties:
 - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
 		  specified
 - multi-master	: states that there is another master active on this bus.
+- aspeed,dma-buf-size	: size of DMA buffer.
+			    AST2400: N/A
+			    AST2500: 2 ~ 4095
+			    AST2600: 2 ~ 4096
+
+			  If both DMA and buffer modes are enabled in device
+			  tree, DMA mode will be selected.
+
+			  AST2500 has these restrictions:
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
 
@@ -26,12 +100,21 @@ i2c {
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
@@ -39,11 +122,40 @@ i2c {
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 		reg = <0x40 0x40>;
-		compatible = "aspeed,ast2400-i2c-bus";
+		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		bus-frequency = <100000>;
 		interrupts = <0>;
 		interrupt-parent = <&i2c_ic>;
 	};
+
+	/* buffer mode transfer enabled */
+	i2c1: i2c-bus@80 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+		reg = <0x80 0x40>, <0x210 0x10>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&syscon ASPEED_CLK_APB>;
+		resets = <&syscon ASPEED_RESET_I2C>;
+		bus-frequency = <100000>;
+		interrupts = <1>;
+		interrupt-parent = <&i2c_ic>;
+	};
+
+	/* DMA mode transfer enabled */
+	i2c2: i2c-bus@c0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+		reg = <0xc0 0x40>;
+		aspeed,dma-buf-size = <4095>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&syscon ASPEED_CLK_APB>;
+		resets = <&syscon ASPEED_RESET_I2C>;
+		bus-frequency = <100000>;
+		interrupts = <2>;
+		interrupt-parent = <&i2c_ic>;
+	};
 };
-- 
2.17.1

