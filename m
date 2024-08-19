Return-Path: <linux-i2c+bounces-5558-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B80957730
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 00:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E518F1C22FD8
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 22:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FCA1DD3A6;
	Mon, 19 Aug 2024 22:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyw0KdRv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B0626AD4;
	Mon, 19 Aug 2024 22:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724105463; cv=none; b=dKfk4eMqb7uNx+q13LNpi99std+PbAgJGmbSerJZzswEQZgAebn0Pv4LmRt4nA5V9ZtHFIwctUm96/BNEikXbUuUKnvXcv/zzo3Ukg7g0c7AX1fE6Ye1/Iu681jHc0uSn8YQfzkBg2b8LZCKSWa0+6+tRzYOkgBckLFQ0100+L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724105463; c=relaxed/simple;
	bh=mTcscfsOR0G5mNrBR3aXODu2cjKru4FcqZa/VkX9BjE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RK+FCcOrI6DWPuC9Un9pXg4hW7l1wmqDhUGf/Pa8QUlUfYEq1jXan9jJ/av+bbxlfH/cRXV3DtDjmWncPodTmQBhZfIc+FCRmbRW6XMcZpjEjPlBynrT1akhsiyBBejxD8A0jpGLM8UIcKTHFnbkWU4jqvE+dzIXuwkJtd43avA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyw0KdRv; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6bf790944f1so23588406d6.2;
        Mon, 19 Aug 2024 15:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724105460; x=1724710260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ig6bP4JUqMAexG7zRH83iPwpsHnZ6Su7qPSTPpoGOyM=;
        b=hyw0KdRvqPPsiaVsoziYWjJpGmcx+WIWEldkcqtEwMr8PRTrFUldsJoDTfKbEOT4TF
         TI5KNjdnjkAWYcXMd4OY3ms/+uV/sqcOcJWfaLo59R+LivtzYPaLO4iDm7czItfwPpn4
         fj6xMYp+Ze5mn/oiBDGgKUF1rfZqx/2pu2zi8/zuPe1qpCunVbQ44xuH0elaolQ8Dcbv
         XUNnFrNkcjYgsMuj+0wnTjygfERVn2MKYsMmaCqgV7zFRBiA0tehV2xAkw2u2+8gTjwN
         9/eR/l4wnDKbLYfCPRXYY8YeKLaef7kDIjQ9MDdwQRIlFKHN6kGUAZtxtML5HfHFhqUA
         ZlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724105460; x=1724710260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ig6bP4JUqMAexG7zRH83iPwpsHnZ6Su7qPSTPpoGOyM=;
        b=bLOnLDg/sZqtrMtIjgqQYRHBbaGi4EkZlcnCiH9botdKjDzvp+6cBJEbFH0USi43BN
         nEkud3MGA3vn9TVCUTvQzTczs7xgeN7UVyues08suZbdUiubAJ7R1IUXzBOz9HKxB5XZ
         /tAV318RPDjxo3JYzPSCL1G3usgZjvf+XVE91DvM2hpBVil3Nc6wVjcnWX8oPx0WzMKc
         krwOs7Hz/SmuqntgP8ydQ5T9cCMkDjMA57XiRXo4KgAfE4VBK//6PxPuUIYBaaGQ120j
         gg3/A5CNHepV3mSER51wkLNmca6d2MAp2uWyy8/iwZbARlTmCtY6iqGTRrme3I+C6ztv
         J/XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOKwf/uh2miRd2byn94gtgDlnLAFYh9vLReTOGBy/aazornbXAr36+qVMKAafcEqpC5Xa2lF25itOZ@vger.kernel.org, AJvYcCVrI7wuyGZEUj1nj7pZ4QabC/rHximC7t8sbZgzRo0gOadSh9vVTE4/wA7prtwOubSQJbzLccXaQ7nv7BI=@vger.kernel.org, AJvYcCWeYei5sIF5cDR12TiBmn4nOneeyt+wjI7/YkM66nqdZvyvs/uOH2Kddyf8hxtEdTwpTnTasd5LU7dW@vger.kernel.org, AJvYcCXEu0m5U6UfygCwFCgvNAaaMBWNmZB4Dmgzn48EdLikGHoZwh5z2VrNlCA+1y0yL0kYCmZMg3ZdGpysMP3bcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1mNuhtyQ03pr1fS7ps4snMC/W/BSHXBpxrPzAki+1HYN5XaUd
	adsCskPvxvGdzXVti2CQ78Rf8BS8Cu8nOad3AlvZ2g3UBjrlcQ0G
X-Google-Smtp-Source: AGHT+IHPbrWcPdicGYym2C5UOrTJFSSMs2T2p2+sZ5PNL60H1Wz43GijtH9dAK0e7Cfi/WNxh18Ezw==
X-Received: by 2002:a0c:e408:0:b0:6bf:7d33:342c with SMTP id 6a1803df08f44-6bf7d333561mr118187296d6.1.1724105460061;
        Mon, 19 Aug 2024 15:11:00 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fdd928fsm46241076d6.21.2024.08.19.15.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 15:10:59 -0700 (PDT)
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
	Richard Acayan <mailingradian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Date: Mon, 19 Aug 2024 18:10:54 -0400
Message-ID: <20240819221051.31489-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819221051.31489-7-mailingradian@gmail.com>
References: <20240819221051.31489-7-mailingradian@gmail.com>
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
 .../bindings/media/qcom,sdm670-camss.yaml     | 319 ++++++++++++++++++
 1 file changed, 319 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
new file mode 100644
index 000000000000..5789cf66a516
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -0,0 +1,319 @@
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
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: vfe0
+      - const: csid0
+      - const: vfe1
+      - const: csid1
+      - const: vfe_lite
+      - const: csid2
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
+        camss@ac65000 {
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
+
+                    csiphy_ep0: endpoint {
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


