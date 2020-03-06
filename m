Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D98A17C401
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 18:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgCFRPq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 12:15:46 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45095 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgCFRPq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Mar 2020 12:15:46 -0500
Received: by mail-wr1-f68.google.com with SMTP id v2so3229061wrp.12
        for <linux-i2c@vger.kernel.org>; Fri, 06 Mar 2020 09:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=R7l2TY+FuhyDMd3P1F1YgdGbiLMlXGWtTzbc6N9h5M4=;
        b=NfoMBlKbLA4tdgTaHpNhhpAMMlFKSzQTvo0LPKbkc+1++IejKJl3OGCs9sB9MeRB4/
         hmZykXkBoFZ/zni3qoGjPdfEMoEMpJ8uj3zG45Ny9Y1mVMCOyfhMnqAXCf3vkIZ77x5+
         I3ohykkTe3R7QqTPMbF1u+72m5wcP6OY3eAb5cyEg62F2G6kayaDQO3Gdan3p2I9w3NA
         c6R1CTd1pBqQBRe3pflZketklAUtRbykzapLIabO0H2PSI40fEcJo27uqWpPpbCEALjD
         clT2+FoRLfl+LoTqKHRlT1UANp8t6MnsV27deMkbUvwUEtXjzpWihAL7fIPIRQAKIBVh
         WnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=R7l2TY+FuhyDMd3P1F1YgdGbiLMlXGWtTzbc6N9h5M4=;
        b=Qm6pttrGw2CZDiB0st6IFMhwd3O/DrByUI08jFldSjKD14HOO25/7/5TVSQvJn4PtT
         Z6ZvJ28x7B46qrUyf28fa8j3OnEnwzpdITrDeo0X7lATM0nXNjYU3jPc7j2ubiQXDf+V
         BBhp2+OUCCKZs3SDAkgAFEXCB2JCVUcnrWUlXrGNnLd3G4Qq5xBDFRzTu/uhUSIsB9Qm
         UaiY4Xv20i5Vm+ks4gQwsAXpb3hb1+lKQj0fpZbFt0KVEgNd0jcywk4dNfYvBZPt+5cq
         zgeePg3BR+giqpuAUpsXZwwxNcE+O4kWZXYKs3WFag+rBYaiVj8jScrbpBMXJG7OSrDh
         eNJQ==
X-Gm-Message-State: ANhLgQ29PMzUlN3owHmQMWzMWrCMUUAVAVBm6DSaUiWKIHQB9FsByye0
        7vup3OSkwZnstU41MPiafGqiCvP64gfvHA==
X-Google-Smtp-Source: ADFU+vuFzNXF+G4xj7HZXx3BNKfdWUT0BTxFAseD8n6CuOQBS4IHKPrlyAWLAhaYcCuJ2+7LW33NgQ==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr5117479wrk.101.1583514944433;
        Fri, 06 Mar 2020 09:15:44 -0800 (PST)
Received: from localhost.localdomain ([172.111.156.149])
        by smtp.gmail.com with ESMTPSA id c5sm545385wma.3.2020.03.06.09.15.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Mar 2020 09:15:44 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de
Cc:     vkoul@kernel.org, robert.foss@linaro.org,
        bjorn.andersson@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
Subject: [PATCH v4 2/3] dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller
Date:   Fri,  6 Mar 2020 18:19:43 +0100
Message-Id: <1583515184-9636-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583515184-9636-1-git-send-email-loic.poulain@linaro.org>
References: <1583515184-9636-1-git-send-email-loic.poulain@linaro.org>
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
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---

 v2: Fix subnode properties, remove mandatory clock names
 v3: Add sdm845 compatible string
 v4: no change

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

