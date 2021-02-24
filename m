Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5D8032445F
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Feb 2021 20:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235745AbhBXTG3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Feb 2021 14:06:29 -0500
Received: from mga05.intel.com ([192.55.52.43]:47725 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235770AbhBXTGS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Feb 2021 14:06:18 -0500
IronPort-SDR: wxQ0j6zbmIlUg8RZ0PzjNRKYG8jj5G67HbQaWm1I79rR9b2zLM6Ls6NPRildiM+wrHuVCke2zm
 7JPyBVjk2qtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="270243427"
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; 
   d="scan'208";a="270243427"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2021 11:04:31 -0800
IronPort-SDR: AZpPr18JmMZMHZ62/FIp9wAuQDpySyX+dhaOvE+3yY16rmLIlalEJEwjD0dvudF8xAFGIGz892
 stlXlZG3HLhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; 
   d="scan'208";a="367098917"
Received: from maru.jf.intel.com ([10.54.51.77])
  by orsmga006.jf.intel.com with ESMTP; 24 Feb 2021 11:04:31 -0800
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
Subject: [PATCH v4 1/4] dt-bindings: i2c: aspeed: add transfer mode support
Date:   Wed, 24 Feb 2021 11:17:17 -0800
Message-Id: <20210224191720.7724-2-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Append bindings to support transfer mode.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
---
Changes since v3:
- None

Changes since v2:
- Moved SRAM resources back to default dtsi and added mode selection
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

