Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4603CCEF68
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2019 01:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729504AbfJGXNT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Oct 2019 19:13:19 -0400
Received: from mga05.intel.com ([192.55.52.43]:35426 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728980AbfJGXNS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Oct 2019 19:13:18 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Oct 2019 16:13:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,269,1566889200"; 
   d="scan'208";a="218109571"
Received: from maru.jf.intel.com ([10.54.51.77])
  by fmsmga004.fm.intel.com with ESMTP; 07 Oct 2019 16:13:15 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 1/5] dt-bindings: i2c: aspeed: add buffer and DMA mode transfer support
Date:   Mon,  7 Oct 2019 16:13:09 -0700
Message-Id: <20191007231313.4700-2-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Append bindings to support buffer mode and DMA mode transfer.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 .../devicetree/bindings/i2c/i2c-aspeed.txt    | 67 +++++++++++++++++--
 1 file changed, 60 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
index 8fbd8633a387..e40dcc108307 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
@@ -3,7 +3,10 @@ Device tree configuration for the I2C busses on the AST24XX and AST25XX SoCs.
 Required Properties:
 - #address-cells	: should be 1
 - #size-cells		: should be 0
-- reg			: address offset and range of bus
+- reg			: Address offset and range of bus registers.
+			  An additional SRAM buffer address offset and range is
+			  optional in case of enabling I2C dedicated SRAM for
+			  buffer mode transfer support.
 - compatible		: should be "aspeed,ast2400-i2c-bus"
 			  or "aspeed,ast2500-i2c-bus"
 - clocks		: root clock of bus, should reference the APB
@@ -16,6 +19,18 @@ Optional Properties:
 - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
 		  specified
 - multi-master	: states that there is another master active on this bus.
+- aspeed,dma-buf-size	: size of DMA buffer (from 2 to 4095 in case of AST2500
+			  or later versions).
+			  Only AST2500 and later versions support DMA mode
+			  under some limitations:
+			  I2C is sharing the DMA H/W with UHCI host controller
+			  and MCTP controller. Since those controllers operate
+			  with DMA mode only, I2C has to use buffer mode or byte
+			  mode instead if one of those controllers is enabled.
+			  Also make sure that if SD/eMMC or Port80 snoop uses
+			  DMA mode instead of PIO or FIFO respectively, I2C
+			  can't use DMA mode. If both DMA and buffer modes are
+			  enabled, DMA mode will be selected.
 
 Example:
 
@@ -25,12 +40,21 @@ i2c {
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
@@ -38,11 +62,40 @@ i2c {
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
2.23.0

