Return-Path: <linux-i2c+bounces-5353-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D52951010
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 01:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2277D287818
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 23:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15E016DEA9;
	Tue, 13 Aug 2024 23:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfpL7g0v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D781ABEBC;
	Tue, 13 Aug 2024 23:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723590054; cv=none; b=a5rN95IeZcFJFmuGxoutizhiWufT0kYsBGoTxZjjWP2IuWmWKGdTVUBVNibUbTMrvi+JJjKjvV74x+MqAqp5xNkuaQ2LwPESVgZ3rP1stSHpYR6qHw1s0aK+GdBvbuMKyqBb7RAq4gjYjue2/RpVaNdfoVPSGunEGevdnp3icsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723590054; c=relaxed/simple;
	bh=lejGTlD2ZkRwxogfuT9iDEEJxvCIZp4ge+Da6AxpL3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5I0NfL68L7NnMhgZu0uN0d5aspzSrs5tmPFdjscF4SWCK8GSdekwyWPcjYo3RW9tBRduCjD5kgg2ZXq8jgAKJscxdrNpXEk9bi9xae50Ji7pBnsqSrPGA/AOcmIDCYPuZ1bxD6H2CkngP4nBFbeliigMtTJOQ2k2K9tmuyJ00Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfpL7g0v; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a1dd2004e1so376330385a.3;
        Tue, 13 Aug 2024 16:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723590051; x=1724194851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94EZmA43tK3sZ2fmzqIAQEiBEFCnZFY3fjtWKaueyqY=;
        b=PfpL7g0vIW1tErvWAu43OFm7HoRLkTdxJasy1HzrGOFCOIOZXlci9gTM+Q9EDpCajY
         Wp6/Nk+CmhFDskF0RcWJ//vImYBR38a8+w9mw/FD4xRnRlPX9wsQVSCRDD6Z0k5cwvIJ
         fjkn9Yny10MzYgqEc2F/ZDwg45u45d2oiGU7axazLqHCWyo6q0bolhkyDDjnYiwtUfW9
         79jCnbyqsYDw58yDalCp+cdyzTJQLgq3+qS9eTsX+wMS5c+s038rfR2E/z5Olqk2PDET
         r4QTaU2A22Y8A422QEq9YIH4vDMy/5vKlc4Dcteb71+cEscsA3HKBNxnfbpcpQcwh6bu
         K59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723590051; x=1724194851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94EZmA43tK3sZ2fmzqIAQEiBEFCnZFY3fjtWKaueyqY=;
        b=K8mwk+qhmWBmKJgyXvFBrf6Afw51ANcIq4eTpypfaEEHqxjOncorVLafY1iZUjQrSd
         8QT8bKz8XgqylI/vLRNUGMAzcLN+ql57m8unoc0Ni5v296KOCgx53Yr3WyA72oeGgsok
         wN6LzE4UCUdLpzljHudUR15wVURrnwqwtswN0s7jWwUitCGYrysIuAGJ73fTkp8zjuuI
         jcQBO2G7aQCQkIdjqQS5OkU4vGKYaRhRwcpmyh5fC3w9wYovuNqhGlG9tuzG27r381+E
         5XZIBmYWNt7Nry5PK8fT5Sgy/r2p4noSazQE8cwoobVH/EaRONMqhAjMx3/MpORcchMu
         p+gw==
X-Forwarded-Encrypted: i=1; AJvYcCWGeLADbjczddZopxvdhMesVLSSi4Gl6PntrRE6dlwY0MdNcW/+ZOB5J1KaIID+boZa0iIKq3C2xejqnwkKVoC8IF8RruTw2oY+RJT+6FyRN7Z7kB1vHGULQXaRW4T/Oz+04avSs5l4l0Lrw/d/SSDmUd413fsJ/kKV8y3TdhCbbEAQDgihMmycUW54vu3qP2mfg2oThQW3xWUJWp7NMTJL3Q==
X-Gm-Message-State: AOJu0YzpnASTR17TzFZJ1R0EZiBp8X+116fFy7JQMO+7H5QiAA015Ert
	qNOOlB2TRclHJAyVeRIArwFSKqx7MfPUNlIBWyFXpQi5R8tjGjui
X-Google-Smtp-Source: AGHT+IFffIMtEBEyIjCZADGI/b9CiUsM9C8Gx5vaqq9Kr1Qx32TlfsIRMNjVr82/LXZRlXqe1g+fNw==
X-Received: by 2002:a05:620a:1a87:b0:79e:ff1a:2359 with SMTP id af79cd13be357-7a4ee319185mr118991685a.14.1723590051401;
        Tue, 13 Aug 2024 16:00:51 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d64328sm378590185a.16.2024.08.13.16.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:00:51 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Date: Tue, 13 Aug 2024 19:00:41 -0400
Message-ID: <20240813230037.84004-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240813230037.84004-8-mailingradian@gmail.com>
References: <20240813230037.84004-8-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
the bindings.

Adapted from SC8280XP camera subsystem.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/qcom,sdm670-camss.yaml     | 324 ++++++++++++++++++
 1 file changed, 324 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
new file mode 100644
index 000000000000..c276f90c5029
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -0,0 +1,324 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM670 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sdm670-camss
+
+  clocks:
+    maxItems: 22
+
+  clock-names:
+    items:
+      - const: camnoc_axi
+      - const: cpas_ahb
+      - const: csi0
+      - const: csi1
+      - const: csi2
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: gcc_camera_ahb
+      - const: gcc_camera_axi
+      - const: soc_ahb
+      - const: vfe0_axi
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe1_axi
+      - const: vfe1
+      - const: vfe1_cphy_rx
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
+
+  interrupts:
+    maxItems: 9
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
+
+  iommus:
+    maxItems: 4
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY0.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY1.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY2.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+  reg:
+    maxItems: 9
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: vfe0
+      - const: csiphy0
+      - const: vfe1
+      - const: csiphy1
+      - const: vfe_lite
+      - const: csiphy2
+
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
+
+required:
+  - clock-names
+  - clocks
+  - compatible
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - reg
+  - reg-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss {
+            compatible = "qcom,sdm670-camss";
+
+            reg = <0 0x0ac65000 0 0x1000>,
+                  <0 0x0ac66000 0 0x1000>,
+                  <0 0x0ac67000 0 0x1000>,
+                  <0 0x0acaf000 0 0x4000>,
+                  <0 0x0acb3000 0 0x1000>,
+                  <0 0x0acb6000 0 0x4000>,
+                  <0 0x0acba000 0 0x1000>,
+                  <0 0x0acc4000 0 0x4000>,
+                  <0 0x0acc8000 0 0x1000>;
+            reg-names = "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "vfe0",
+                        "csid0",
+                        "vfe1",
+                        "csid1",
+                        "vfe_lite",
+                        "csid2";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "vfe0",
+                              "vfe1",
+                              "vfe_lite";
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY1_CLK>,
+                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY2_CLK>,
+                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                     <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMERA_AXI_CLK>,
+                     <&camcc CAM_CC_SOC_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
+            clock-names = "camnoc_axi",
+                          "cpas_ahb",
+                          "csi0",
+                          "csi1",
+                          "csi2",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "gcc_camera_ahb",
+                          "gcc_camera_axi",
+                          "soc_ahb",
+                          "vfe0_axi",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe1_axi",
+                          "vfe1",
+                          "vfe1_cphy_rx",
+                          "vfe_lite",
+                          "vfe_lite_cphy_rx";
+
+            iommus = <&apps_smmu 0x808 0x0>,
+                     <&apps_smmu 0x810 0x8>,
+                     <&apps_smmu 0xc08 0x0>,
+                     <&apps_smmu 0xc10 0x8>;
+
+            power-domains = <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "top";
+
+            vdda-phy-supply = <&vreg_l1a_1p225>;
+            vdda-pll-supply = <&vreg_l8a_1p8>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    csiphy_ep0: endpoint {
+                        reg = <0>;
+                        clock-lanes = <7>;
+                        data-lanes = <0 1 2 3>;
+                        remote-endpoint = <&front_sensor_ep>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.46.0


