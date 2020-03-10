Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBF1417F221
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 09:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgCJInI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 04:43:08 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34535 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgCJInI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Mar 2020 04:43:08 -0400
Received: by mail-wr1-f66.google.com with SMTP id z15so14679175wrl.1
        for <linux-i2c@vger.kernel.org>; Tue, 10 Mar 2020 01:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=prlGz7r+eJIoXCqtFjdF52MQW5IpGmQksbseW54oz4w=;
        b=CiceqC3UkqvaKTc79vmXsMVyCCbT4QGqHYFoOTNqtA4I0cEky5TD+oRTXl8pTy1Zgt
         EovpXgB2xXUeONCy69aE3HYhkWR0NrqGYKZUivUukfygRRMg2OshXTOeei8tN42DcMo8
         ZSfTCb0Scd2jIMaAxJlghBC1Zq1I9ZJEeBNWiUE/D6pCGtLa5tCjTKpcutN+qOwyQFmI
         ZcN2lRkrxV8C2dh1Xacp0XyqUa7WeefUSHl/0qX11mXOi1PVaW4Y9Mpg9N4FofBwop3l
         xgPqUFc56qSd19hkywFYZ3CRO9NPZ4GAiGKb9a2tv1MkZzS0hfBRCKffX+9Ptbb1jePd
         P5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=prlGz7r+eJIoXCqtFjdF52MQW5IpGmQksbseW54oz4w=;
        b=oT0Uf/A5biAIcu7wMgY0knwOviBe250mSQc6MgCuYqQ6APOIWf6I62wlpMr5VmxFFk
         N6khYVEvpde27dRtdxp3l7/dWk1SHO7gnbSHfWv6iJjy0VFX88BwYOlo+VGHBzsMgn0a
         CSv4/bK/8INW8fkwOi4rWGw1/PPDVj35dqVFsqPR7SSD6DGX24T94YGc7o/+8WS6DSuA
         NpIUpUDj0KlS/wi1KKMMb62kFq991ErZ/d5BwSHXxfvRfIQLpY1KErLwAUMFlWW371W2
         aOgwpMvIBMAvq2onvXfV5auYcL6bc+EpI/lWd7HNMzY8bXgYcYO3CQKUELcP7Rcgfxad
         +YHA==
X-Gm-Message-State: ANhLgQ1dZjo8wUZhXw2t5DgJowWLYo0ohYfBY6vl8GYrMvW0YriBIdt+
        4G7OqR2UA/SVQWk80ueMoaK10A==
X-Google-Smtp-Source: ADFU+vvoxcC0u3ezyCIlsSLWDPm5Y/w75S0lLUG9PVLM4Irv9Vt65eSjO2Lce790GiGONsRPJqD6lw==
X-Received: by 2002:adf:f70f:: with SMTP id r15mr26540626wrp.269.1583829786086;
        Tue, 10 Mar 2020 01:43:06 -0700 (PDT)
Received: from localhost.localdomain ([172.94.87.38])
        by smtp.gmail.com with ESMTPSA id i6sm33130748wra.42.2020.03.10.01.43.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 10 Mar 2020 01:43:05 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de
Cc:     vkoul@kernel.org, robert.foss@linaro.org,
        bjorn.andersson@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
Subject: [PATCH v6 2/3] dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller
Date:   Tue, 10 Mar 2020 09:47:00 +0100
Message-Id: <1583830021-30141-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583830021-30141-1-git-send-email-loic.poulain@linaro.org>
References: <1583830021-30141-1-git-send-email-loic.poulain@linaro.org>
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
 v5: no change
 v6: no change

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

