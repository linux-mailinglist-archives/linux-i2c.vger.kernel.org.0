Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42D31F4D83
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 08:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgFJGC7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 02:02:59 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11231 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFJGCu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 02:02:50 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee0772e0000>; Tue, 09 Jun 2020 23:01:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 09 Jun 2020 23:02:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 09 Jun 2020 23:02:50 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 06:02:49 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 10 Jun 2020 06:02:49 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.70]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee077890000>; Tue, 09 Jun 2020 23:02:49 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v1 10/18] dt-bindings: tegra: Document VI and CSI port nodes
Date:   Tue, 9 Jun 2020 23:02:32 -0700
Message-ID: <1591768960-31648-11-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591768878; bh=wPUjcK5pjatayPbHQg+cG5OdMe7PMrZuDRJsqwl5MoU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ei59UQXi7yEOg3WW32Mp1G+liqrIbq6KgKYXkk5nfw4KS4XF6G1yTXTM4NS+8WpFB
         74gYnQSUQz5zn6ViJqqtSIM4vz2NRmAYhgfO+U1QT4Uk2IcGrVB8/ajaCkbm8C3iVj
         bUWH2UR0uUDnV3vvyjurqDumaWcl6tCQ5uAxKeH4EvESVuDWISRSDc3Ysn8xgh+ha4
         nVGS/9bnwsxhQ3HLVmgoGyjACSF6pWPzN7tnqR23rr3pAzKVpxylFeR78yZnHwFq4w
         OhV1OyaWPXqNHwyFlikaNPLlwrGQNcAUgbP0Y5uRp1HVP4HK5iw9RcpgksXCpW//UT
         AJJlQOjq0R06g==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch documents Tegra VI and CSI port and endpoint nodes along
with the other required properties.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt        | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 4731921..f70a838 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -65,6 +65,48 @@ of the following host1x client modules:
       - power-domains: Must include sor powergate node as csicil is in
         SOR partition.
 
+      Optional properties for csi node:
+
+      - channel nodes: Max upto 6 channels/streams are supported with each CSI
+	brick can as either x4 or x2 based on hw connectivity to sensor.
+
+	Required properties:
+	- reg: channel/stream index
+	- nvidia,mipi-calibrate: Should contain a phandle and a specifier
+	  specifying which pads are used by this CSI port and need to be
+	  calibrated. See also ../display/tegra/nvidia,tegra114-mipi.txt.
+
+	- port: CSI port node and its endpoint nodes as per device graph
+          bindings defined in Documentation/devicetree/bindings/graph.txt.
+	  Required properties:
+	  - reg: csi port index based on hw csi lanes connectivity to the
+	    sensor.
+	  - bus-width: number of lanes used by this port. Supported lanes
+	    are 1/2/4.
+	  - endpoint@0: sink node
+	    Required properties:
+	    - reg: endpoint id. This is used to retrieve pad for creating
+	      media link
+	    - remote-endpoint: phandle to sensor endpoint
+	  - endpoint@1: source node
+	    - reg: endpoint id. This is used to retrieve pad for creating
+	      media link
+	    - remote-endpoint: phandle to vi port endpoint
+
+  Optional properties for vi node:
+  - ports: Video port nodes and endpoint nodes as per device graph bindings
+    defined in Documentation/devicetree/bindings/graph.txt
+    Max 6 ports are supported and each port should have one endpoint node.
+
+    Required properties:
+    - port: VI port node and its sink endpoint node
+      Required properties:
+    - reg: should match port index
+    - endpoint@0: sink node
+      Required properties:
+      - reg: endpoint id must be 0
+      - remote-endpoint: phandle to CSI endpoint node.
+
 - epp: encoder pre-processor
 
   Required properties:
@@ -340,6 +382,22 @@ Example:
 
 			ranges = <0x0 0x0 0x54080000 0x2000>;
 
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					imx219_vi_in0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&imx219_csi_out0>;
+					};
+				};
+			};
+
 			csi@838 {
 				compatible = "nvidia,tegra210-csi";
 				reg = <0x838 0x1300>;
@@ -362,6 +420,35 @@ Example:
 					 <&tegra_car TEGRA210_CLK_CSI_TPG>;
 				clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
 				power-domains = <&pd_sor>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				channel@0 {
+					reg = <0>;
+					nvidia,mipi-calibrate = <&mipi 0x001>;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						bus-width = <2>;
+
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						imx219_csi_in0: endpoint@0 {
+							reg = <0>;
+							remote-endpoint = <&imx219_out0>;
+						};
+
+						imx219_csi_out0: endpoint@1 {
+							reg = <1>;
+							remote-endpoint = <&imx219_vi_in0>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.7.4

