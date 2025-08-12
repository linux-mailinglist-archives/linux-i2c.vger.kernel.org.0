Return-Path: <linux-i2c+bounces-12256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E07B23AED
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Aug 2025 23:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 447F71AA6301
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Aug 2025 21:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987192D978A;
	Tue, 12 Aug 2025 21:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TinlylEd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2AD2D73BA;
	Tue, 12 Aug 2025 21:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035206; cv=none; b=IRpmpir/4l5piQsQ1re3PXKGswH3a05HUbHDC2l5EpLEcGkkc8L4a7+YCUiI7x02n1qZUimW5cQA8Fl6FB7uGI3dOcyiTKpeOqd6KzeIxpQOKtsOYYh9rVORGh0CyLimRdF8bZGn7LzVz10pk9RjF58xAF2WjLhSFmgsURCCb/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035206; c=relaxed/simple;
	bh=sKk/FGxnwZJf4eZPJqhVEBfQ8jRB3RY1TCG/Ftq6hFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7suqq1Kbc67cz6V+TO+oviD8BySlAMCWuBuNEo0G1OJRAHH0Ns3E8ET2S9RMjimUCHE18RmGzevriiadxMIrMeEhxm0Zc136su6tPMO+jfO8+sdROURyfT9e9+JgjGaC0YvFMqlgVAXQgXh1VS30AV27brGOF3xaY9T09N5awg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TinlylEd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8BDE6E92;
	Tue, 12 Aug 2025 23:45:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035147;
	bh=sKk/FGxnwZJf4eZPJqhVEBfQ8jRB3RY1TCG/Ftq6hFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TinlylEd/YK1hRK42GpJ3zRVB7Ts2MP19hS46DNGGgQ62qLTOmWuI5PjMs3PChod2
	 PvQMxG+Yoe6y1i3EB1HLl/GWeYnynKwKyr9permxynu/nn4SDCdn4TPRHoWISZkGRl
	 odsRdwA8GabVH9I1HJLW57xUeKVpOAvXBCIjclHM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Todor Tomov <todor.too@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 01/72] dt-bindings: media: Deprecate clock-frequency property for camera sensors
Date: Wed, 13 Aug 2025 00:45:09 +0300
Message-ID: <20250812214620.30425-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usage of the clock-frequency property for camera sensors is discouraged
in favour of using assigned-clock-rates (and assigned-clock-parents
where needed). Mark the property as deprecated.

Update the examples accordingly. In DT examples where the sensor input
clock appears to come from a programmable clock generator, replace
clock-frequency by the assigned-clocks and assigned-clock-rates
properties. Otherwise, just drop clock-frequency.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:

- Adapt examples in bindings that reference sensors
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml    | 6 ++++--
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml  | 7 +++++--
 .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml        | 3 +--
 .../devicetree/bindings/media/i2c/ovti,ov5645.yaml         | 6 +++++-
 .../devicetree/bindings/media/i2c/ovti,ov7251.yaml         | 6 +++++-
 .../devicetree/bindings/media/i2c/ovti,ov8856.yaml         | 3 +--
 .../devicetree/bindings/media/i2c/samsung,s5k5baf.yaml     | 6 +++++-
 .../devicetree/bindings/media/i2c/samsung,s5k6a3.yaml      | 6 +++++-
 .../devicetree/bindings/media/i2c/sony,imx290.yaml         | 5 +++--
 .../bindings/media/samsung,exynos4212-fimc-is.yaml         | 4 ++--
 Documentation/devicetree/bindings/media/samsung,fimc.yaml  | 3 ++-
 11 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b2..1687b069e032 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -292,7 +292,8 @@ examples:
 
                 clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
                 clock-names = "xvclk";
-                clock-frequency = <19200000>;
+                assigned-clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
+                assigned-clock-rates = <19200000>;
 
                 dovdd-supply = <&vreg_lvs1a_1p8>;
                 avdd-supply = <&cam0_avdd_2v8>;
@@ -324,7 +325,8 @@ examples:
 
                 clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
                 clock-names = "xclk";
-                clock-frequency = <24000000>;
+                assigned-clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
+                assigned-clock-rates = <24000000>;
 
                 vdddo-supply = <&vreg_lvs1a_1p8>;
                 vdda-supply = <&cam3_avdd_2v8>;
diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index bc664a016396..217b08c8cbbd 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -55,6 +55,7 @@ properties:
 
   clock-frequency:
     description: Frequency of the external clock to the sensor in Hz.
+    deprecated: true
 
   reset-gpios:
     description: Reset GPIO. Also commonly called XSHUTDOWN in hardware
@@ -93,7 +94,6 @@ properties:
 required:
   - compatible
   - reg
-  - clock-frequency
   - clocks
 
 additionalProperties: false
@@ -114,8 +114,11 @@ examples:
             reg = <0x10>;
             reset-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
             vana-supply = <&vaux3>;
+
             clocks = <&omap3_isp 0>;
-            clock-frequency = <9600000>;
+            assigned-clocks = <&omap3_isp 0>;
+            assigned-clock-rates = <9600000>;
+
             port {
                 ccs_ep: endpoint {
                     data-lanes = <1 2>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
index 67c1c291327b..0e1d9c390180 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
@@ -39,6 +39,7 @@ properties:
   clock-frequency:
     description:
       Frequency of the eclk clock in Hz.
+    deprecated: true
 
   dovdd-supply:
     description:
@@ -100,7 +101,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - clock-frequency
   - dovdd-supply
   - avdd-supply
   - dvdd-supply
@@ -127,7 +127,6 @@ examples:
 
             clocks = <&ov02a10_clk>;
             clock-names = "eclk";
-            clock-frequency = <24000000>;
 
             rotation = <180>;
 
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
index bc9b27afe3ea..a583714b1ac7 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
@@ -21,6 +21,7 @@ properties:
 
   clock-frequency:
     description: Frequency of the xclk clock in Hz.
+    deprecated: true
 
   vdda-supply:
     description: Analog voltage supply, 2.8 volts
@@ -83,8 +84,11 @@ examples:
         camera@3c {
             compatible = "ovti,ov5645";
             reg = <0x3c>;
+
             clocks = <&clks 1>;
-            clock-frequency = <24000000>;
+            assigned-clocks = <&clks 1>;
+            assigned-clock-rates = <24000000>;
+
             vdddo-supply = <&ov5645_vdddo_1v8>;
             vdda-supply = <&ov5645_vdda_2v8>;
             vddd-supply = <&ov5645_vddd_1v5>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
index 2e5187acbbb8..922996da59b2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
@@ -29,6 +29,7 @@ properties:
 
   clock-frequency:
     description: Frequency of the xclk clock in Hz.
+    deprecated: true
 
   vdda-supply:
     description: Analog voltage supply, 2.8 volts
@@ -89,8 +90,11 @@ examples:
         camera@3c {
             compatible = "ovti,ov7251";
             reg = <0x3c>;
+
             clocks = <&clks 1>;
-            clock-frequency = <24000000>;
+            assigned-clocks = <&clks 1>;
+            assigned-clock-rates = <24000000>;
+
             vdddo-supply = <&ov7251_vdddo_1v8>;
             vdda-supply = <&ov7251_vdda_2v8>;
             vddd-supply = <&ov7251_vddd_1v5>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
index 3f6f72c35485..fa71f24823f2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
@@ -37,6 +37,7 @@ properties:
   clock-frequency:
     description:
       Frequency of the xvclk clock in Hertz.
+    deprecated: true
 
   dovdd-supply:
     description:
@@ -87,7 +88,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - clock-frequency
   - dovdd-supply
   - avdd-supply
   - dvdd-supply
@@ -114,7 +114,6 @@ examples:
 
             clocks = <&cam_osc>;
             clock-names = "xvclk";
-            clock-frequency = <19200000>;
 
             avdd-supply = <&mt6358_vcama2_reg>;
             dvdd-supply = <&mt6358_vcamd_reg>;
diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
index c8f2955e0825..ebd95a8d9b2f 100644
--- a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
@@ -26,6 +26,7 @@ properties:
   clock-frequency:
     default: 24000000
     description: mclk clock frequency
+    deprecated: true
 
   rstn-gpios:
     maxItems: 1
@@ -82,9 +83,12 @@ examples:
         sensor@2d {
             compatible = "samsung,s5k5baf";
             reg = <0x2d>;
+
             clocks = <&camera 0>;
+            assigned-clocks = <&camera 0>;
+            assigned-clock-rates = <24000000>;
+
             clock-names = "mclk";
-            clock-frequency = <24000000>;
             rstn-gpios = <&gpl2 1 GPIO_ACTIVE_LOW>;
             stbyn-gpios = <&gpl2 0 GPIO_ACTIVE_LOW>;
             vdda-supply = <&cam_io_en_reg>;
diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
index 7e83a94124b5..e563e35920c4 100644
--- a/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
@@ -30,6 +30,7 @@ properties:
   clock-frequency:
     default: 24000000
     description: extclk clock frequency
+    deprecated: true
 
   gpios:
     maxItems: 1
@@ -80,8 +81,11 @@ examples:
         sensor@10 {
             compatible = "samsung,s5k6a3";
             reg = <0x10>;
-            clock-frequency = <24000000>;
+
             clocks = <&camera 1>;
+            assigned-clocks = <&camera 1>;
+            assigned-clock-rates = <24000000>;
+
             clock-names = "extclk";
             gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
             afvdd-supply = <&ldo19_reg>;
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index 990acf89af8f..484039671cd1 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -51,6 +51,7 @@ properties:
 
   clock-frequency:
     description: Frequency of the xclk clock in Hz
+    deprecated: true
 
   vdda-supply:
     description: Analog power supply (2.9V)
@@ -100,7 +101,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - clock-frequency
   - vdda-supply
   - vddd-supply
   - vdddo-supply
@@ -125,7 +125,8 @@ examples:
 
             clocks = <&gcc 90>;
             clock-names = "xclk";
-            clock-frequency = <37125000>;
+            assigned-clocks = <&clks 1>;
+            assigned-clock-rates = <37125000>;
 
             vdddo-supply = <&camera_vdddo_1v8>;
             vdda-supply = <&camera_vdda_2v8>;
diff --git a/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml b/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
index 3a5ff3f47060..151290de6e87 100644
--- a/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
@@ -209,9 +209,9 @@ examples:
                 svdda-supply = <&cam_io_reg>;
                 svddio-supply = <&ldo19_reg>;
                 afvdd-supply = <&ldo19_reg>;
-                clock-frequency = <24000000>;
-                clocks = <&camera 1>;
                 clock-names = "extclk";
+                assigned-clocks = <&camera 1>;
+                assigned-clock-rates = <24000000>;
                 gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
 
                 port {
diff --git a/Documentation/devicetree/bindings/media/samsung,fimc.yaml b/Documentation/devicetree/bindings/media/samsung,fimc.yaml
index 7808d61f1fa3..2a54379d9509 100644
--- a/Documentation/devicetree/bindings/media/samsung,fimc.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,fimc.yaml
@@ -259,10 +259,11 @@ examples:
                     svdda-supply = <&cam_io_reg>;
                     svddio-supply = <&ldo19_reg>;
                     afvdd-supply = <&ldo19_reg>;
-                    clock-frequency = <24000000>;
                     /* CAM_B_CLKOUT */
                     clocks = <&camera 1>;
                     clock-names = "extclk";
+                    assigned-clocks = <&camera 1>;
+                    assigned-clock-rates = <24000000>;
                     gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
 
                     port {
-- 
Regards,

Laurent Pinchart


