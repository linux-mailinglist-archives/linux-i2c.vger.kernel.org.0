Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E09EE1795AB
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Mar 2020 17:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388084AbgCDQtR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Mar 2020 11:49:17 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33852 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388138AbgCDQtR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Mar 2020 11:49:17 -0500
Received: by mail-wr1-f66.google.com with SMTP id z15so3283695wrl.1
        for <linux-i2c@vger.kernel.org>; Wed, 04 Mar 2020 08:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=toQqWBCCt8lOQBCZt48VesGyqLUbQUjLel2N8MuawPQ=;
        b=t6B8V1sEKY961RRSUdBi3hYNV7w5vP0stfe5zpItPr3zMjCew00kuptnNCbCk2QrB4
         kTZb3iDi0H38i7AFYoA3V+0VFj5rg3WHjPUz7Ll2LK4n6WN+AyLr1nnv5K6rSgtGOcde
         cn9ff7hA5mHeOdgaBFM+pp7/fYLqJnhypWcUo99BwPBTIdKC5mYJN96xDK2LO2ityCIK
         byoHyAXbNuvToTkz4H1XWGuM/m1TfY4DPNnJlcA6mtZbvA6qg4ttZCJFS5vMbYcEehau
         4pF2fCZAPur6EhyXuotNuk1NtMh5mP4jdY1IgHJnIayi+uVdEwDd3cej763M0VyXw5zG
         v3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=toQqWBCCt8lOQBCZt48VesGyqLUbQUjLel2N8MuawPQ=;
        b=cEk86OsmGy1pZSSxGlVurfXLITHrJGdKiWypvByZod7GapVYe1GGzuhwuaIB8GPF0R
         cQk+4GcTF9aDnhdU8gJWLbvWBtQxXTDhXBLjHZ1pVhkJDEV2P6jvGkApb2CEpgpFxDYC
         guZsiiU8nlVe7vJZ6aOD16R7AY77j+5ZzqgSM3Hjfm59sFLiurIkD40sqaww/DZOidEd
         VKv8+g6lV3yDbDeeaNk2WOjNU75BwFj4gK+/GRBVg+lfqTebbn0sh7+3rQsdEh2+50wi
         48RWsO8Ne3xfKzOkMMIZqr6K2zfk57tgwTeesnrYg8ZRcmxAOi3b7VKsZ2N7vF4TFI/G
         XAzQ==
X-Gm-Message-State: ANhLgQ3/RGs9cGq5psNeXq+UyKmY1ETmeJusPq3gSja/cGyrgNfSJfsl
        OF8RNP4Ah/DAuX6tU0UIN+oxtQ==
X-Google-Smtp-Source: ADFU+vtJ1ndZEV/ueds/EB6uYtsDW9H2HWvDs1yN8MtybkxET5sAy3zURYG3uZzIq//QTIDgvKjp4w==
X-Received: by 2002:a5d:414d:: with SMTP id c13mr5178233wrq.40.1583340554455;
        Wed, 04 Mar 2020 08:49:14 -0800 (PST)
Received: from localhost.localdomain ([37.171.70.150])
        by smtp.gmail.com with ESMTPSA id y3sm909226wrm.46.2020.03.04.08.49.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 04 Mar 2020 08:49:14 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de
Cc:     vkoul@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
Subject: [PATCH v3 2/3] dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller
Date:   Wed,  4 Mar 2020 17:52:55 +0100
Message-Id: <1583340776-27865-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583340776-27865-1-git-send-email-loic.poulain@linaro.org>
References: <1583340776-27865-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Todor Tomov <todor.tomov@linaro.org>

Add DT binding document for Qualcomm Camera Control Interface (CCI)
I2C controller.

Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 v2: Fix subnode properties, remove mandatory clock names
 v3: Add sdm845 compatible string

 .../devicetree/bindings/i2c/i2c-qcom-cci.txt       | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
new file mode 100644
index 0000000..c6668b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
@@ -0,0 +1,92 @@
+Qualcomm Camera Control Interface (CCI) I2C controller
+
+PROPERTIES:
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		"qcom,msm8916-cci"
+		"qcom,msm8996-cci"
+		"qcom,sdm845-cci"
+
+- reg
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: base address CCI I2C controller and length of memory
+		    mapped region.
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: specifies the CCI I2C interrupt. The format of the
+		    specifier is defined by the binding document describing
+		    the node's interrupt parent.
+
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: a list of phandle, should contain an entry for each
+		    entries in clock-names.
+
+- clock-names
+	Usage: required
+	Value type: <string>
+	Definition: a list of clock names, must include "cci" clock.
+
+- power-domains
+	Usage: required for "qcom,msm8996-cci"
+	Value type: <prop-encoded-array>
+	Definition:
+
+SUBNODES:
+
+The CCI provides I2C masters for one (msm8916) or two i2c busses (msm8996 and
+sdm845), described as subdevices named "i2c-bus@0" and "i2c-bus@1".
+
+PROPERTIES:
+
+- reg:
+	Usage: required
+	Value type: <u32>
+	Definition: Index of the CCI bus/master
+
+- clock-frequency:
+	Usage: optional
+	Value type: <u32>
+	Definition: Desired I2C bus clock frequency in Hz, defaults to 100
+		    kHz if omitted.
+
+Example:
+
+	cci@a0c000 {
+		compatible = "qcom,msm8996-cci";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0xa0c000 0x1000>;
+		interrupts = <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&mmcc MMSS_MMAGIC_AHB_CLK>,
+			 <&mmcc CAMSS_TOP_AHB_CLK>,
+			 <&mmcc CAMSS_CCI_AHB_CLK>,
+			 <&mmcc CAMSS_CCI_CLK>,
+			 <&mmcc CAMSS_AHB_CLK>;
+		clock-names = "mmss_mmagic_ahb",
+			      "camss_top_ahb",
+			      "cci_ahb",
+			      "cci",
+			      "camss_ahb";
+
+		i2c-bus@0 {
+			reg = <0>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c-bus@1 {
+			reg = <1>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
-- 
2.7.4

