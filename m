Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB4917E496
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Mar 2020 17:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgCIQTY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Mar 2020 12:19:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43802 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbgCIQTX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Mar 2020 12:19:23 -0400
Received: by mail-wr1-f67.google.com with SMTP id v9so11970860wrf.10
        for <linux-i2c@vger.kernel.org>; Mon, 09 Mar 2020 09:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pYEIGbpNdvaYLAoN9Bu2XnQK3k+f4NS4GD+HwIP4YdQ=;
        b=Eaa9DF7njSC5IbF1478lxVeWIFc4lK1bQQ8JDZxtPliJaOSmDH7X78AggWLPiKJhGW
         uQjaW0bowrW3Uc4ceTEI7QgkORcvX1lY906Iuq0mB1EHEfjr2H1ftQJYFPo3L0BFMPOH
         SWZ3OU8OkjWY+2yAfB1eeZjNRx/YQfDD1YgIx/eN9mNFXMLG9sep9uJyDMRvNHP7j+1e
         5Z0zSIw8/7u6d7mNXlZcW7RmWxrtnNS6A5knkg5A3vnMpL+zv5WRNwHlMckotbgBUNKM
         /EXFAt88wbLb0y3nAaJ5OntPt+KHnrr1/ba/HDDVDZATmlRdq767md0HHHANnUILSj9Z
         BM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pYEIGbpNdvaYLAoN9Bu2XnQK3k+f4NS4GD+HwIP4YdQ=;
        b=A59y4hrJLsCcjYGZQbveioSdlqzciD6xRW2tDx/KIxxqGSU0CInMrszbdWEtm9bdpz
         OddM+sdcsMJL054NKZVtvDWT70ExkO4lLCOg31ziwgvMgzspbaRJFk91diRLts3Kl7WE
         UgHXefdC+vVrmYad3Mm8v+YSSdE4AXdwVsoC/RQ0jSQ4i4OgX/d48vEWkVkuhUE0qY91
         IHQW+Ce5ZKZfYKEMTGS/7xlJT9+SxSc+kjkZ48gdVFuo5CjRscT0M8xxfHIHA118Crcf
         KKRHLMjM55JCTQCLygtperF6LvmhDukKqo5UlTuvuBhob70ewUWkjtauqa3ibSykYyl7
         9kFg==
X-Gm-Message-State: ANhLgQ3KwqAE8R7b7qP/RAKbpyC4KSl1MRuOzRE5xZ9wncV4eUx/AWwy
        osSA9EHf6LMiZBnGVVtDmHFqa+aQpEB4iA==
X-Google-Smtp-Source: ADFU+vsYmoAKmTNqnKhszh+U2v+pN67hq2L9B9kvJWFwlirgI4jL5bTy9TUa+VZK2jxdmnU9eGhPxw==
X-Received: by 2002:adf:9cca:: with SMTP id h10mr22846170wre.390.1583770761308;
        Mon, 09 Mar 2020 09:19:21 -0700 (PDT)
Received: from localhost.localdomain ([172.111.156.105])
        by smtp.gmail.com with ESMTPSA id y8sm67214wmj.22.2020.03.09.09.19.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 09 Mar 2020 09:19:20 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de
Cc:     vkoul@kernel.org, robert.foss@linaro.org,
        bjorn.andersson@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
Subject: [PATCH v5 2/3] dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller
Date:   Mon,  9 Mar 2020 17:23:17 +0100
Message-Id: <1583770998-25449-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583770998-25449-1-git-send-email-loic.poulain@linaro.org>
References: <1583770998-25449-1-git-send-email-loic.poulain@linaro.org>
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

