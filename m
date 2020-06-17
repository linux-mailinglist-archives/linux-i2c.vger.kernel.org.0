Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59441FC3C8
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 03:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgFQBlG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 21:41:06 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19574 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgFQBjl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Jun 2020 21:39:41 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee973f90001>; Tue, 16 Jun 2020 18:38:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 16 Jun 2020 18:39:40 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 16 Jun 2020 18:39:40 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Jun
 2020 01:39:39 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 17 Jun 2020 01:39:39 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.171.186]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee9745a0000>; Tue, 16 Jun 2020 18:39:38 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v2 10/18] dt-bindings: tegra: Update VI and CSI bindings with port info
Date:   Tue, 16 Jun 2020 18:41:26 -0700
Message-ID: <1592358094-23459-11-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1592357881; bh=yGbs5SDi4Dd0+0xT6nDOtBMbjmUT+S0MvKYM2ZVqVhs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=OKXaPg8adLk/991hSEryvnuKB/ne6JxrIM8At9YhEYriNsqBOAUJLebYrZEAQWVcb
         eesjBi5UetzsFovSsB5aqbf+uMklTkg+Zhf3YH40aX9qGhYLZVoRrrfVendZYGp2dX
         lHzh/p32RnFpL8mnxeH5K73PW6le1eXPSGi1mnNZ11JfbT08kftc40H9FjTcC9OKdN
         ht6A5DgyY/DLCGAwYDE5mPWB1kAnCRMxOlR50ixBiZtmKM/dWlt19AUq+yJczW5U61
         TOBJLivEmAvib5yvDf4DoYppvU9YdVlYeNBnIiexBZ6hYhBMpttQ6/bPTMTf3oNX9Q
         VmOUwRpRg6DHw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update VI and CSI bindings to add port and endpoint nodes as per
media video-interfaces DT binding document.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt        | 92 +++++++++++++++++++++-
 1 file changed, 90 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 4731921..ac63ae4a 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -51,8 +51,16 @@ of the following host1x client modules:
       - vi
   - Tegra210:
     - power-domains: Must include venc powergate node as vi is in VE partition.
-  - Tegra210 has CSI part of VI sharing same host interface and register space.
-    So, VI device node should have CSI child node.
+
+  ports (optional node)
+  vi can have optional ports node and max 6 ports are supported. Each port
+  should have single 'endpoint' child node. All port nodes are grouped under
+  ports node. Please refer to the bindings defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt
+
+  csi (required node)
+  Tegra210 has CSI part of VI sharing same host interface and register space.
+  So, VI device node should have CSI child node.
 
     - csi: mipi csi interface to vi
 
@@ -65,6 +73,46 @@ of the following host1x client modules:
       - power-domains: Must include sor powergate node as csicil is in
         SOR partition.
 
+      channel (optional nodes)
+      Maximum 6 channels are supported with each csi brick as either x4 or x2
+      based on hw connectivity to sensor.
+
+      Required properties:
+      - reg: csi port number. Valid port numbers are 0 through 5.
+      - nvidia,mipi-calibrate: Should contain a phandle and a specifier
+        specifying which pads are used by this CSI port and need to be
+	calibrated. See also ../display/tegra/nvidia,tegra114-mipi.txt.
+
+      Each channel node must contain 2 port nodes which can be grouped
+      under 'ports' node and each port should have a single child 'endpoint'
+      node.
+
+        ports node
+        Please refer to the bindings defined in
+        Documentation/devicetree/bindings/media/video-interfaces.txt
+
+        ports node must contain below 2 port nodes.
+        port@0 with single child 'endpoint' node always a sink.
+        port@1 with single child 'endpoint' node always a source.
+
+        port@0 (required node)
+        Required properties:
+        - reg: 0
+
+	  endpoint (required node)
+	  Required properties:
+	  - data-lanes: an array of data lane from 1 to 4. Valid array
+	    lengths are 1/2/4.
+	  - remote-endpoint: phandle to sensor 'endpoint' node.
+
+        port@1 (required node)
+        Required properties:
+        - reg: 1
+
+	  endpoint (required node)
+	  Required properties:
+	  - remote-endpoint: phandle to vi port 'endpoint' node.
+
 - epp: encoder pre-processor
 
   Required properties:
@@ -340,6 +388,18 @@ Example:
 
 			ranges = <0x0 0x0 0x54080000 0x2000>;
 
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					imx219_vi_in0: endpoint {
+						remote-endpoint = <&imx219_csi_out0>;
+					};
+				};
+			};
+
 			csi@838 {
 				compatible = "nvidia,tegra210-csi";
 				reg = <0x838 0x1300>;
@@ -362,6 +422,34 @@ Example:
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
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							imx219_csi_in0: endpoint {
+								data-lanes = <1 2>;
+								remote-endpoint = <&imx219_out0>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+							imx219_csi_out0: endpoint {
+								remote-endpoint = <&imx219_vi_in0>;
+							};
+						};
+					};
+				};
 			};
 		};
 
-- 
2.7.4

