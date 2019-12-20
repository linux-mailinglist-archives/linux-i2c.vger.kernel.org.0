Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E44D128247
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2019 19:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbfLTSjN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Dec 2019 13:39:13 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41714 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbfLTSjM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Dec 2019 13:39:12 -0500
Received: by mail-wr1-f65.google.com with SMTP id c9so10363404wrw.8
        for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2019 10:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Jk9kFi+e5gZ+j1wdqppVvCkfskMq3T3NszjuLD9FWJ0=;
        b=jaxJEXNV1Qe0m6DFAy9KihZpvv1BQr6qpWNvFTMwQxt7HC3CeQs42dAZejwWmFBHdq
         DypYacEAdFRpxBb2gNWxonDOb4hNLNmYls6Op5F45AnIXKEaVV6JusActWHXZn2891VW
         37Pt+Vu4RN7bZDbSuCp0ICLySpYam/B02A0DKShV6YieuXNgdf6kXBM1tcjPDARiVBn4
         LkxKZzntgOptn3GVZn9hYg5I9VB15qv0KD4U8Jce048bIVCe4MC4r1o8uAdrO8JXHb9A
         MkFsz3rLzDQzxfbfuARYYAdwI61WAGFfKZLBZFnt2+6BqQ7WM+AaGhahiOh9mfwj6kQz
         E4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Jk9kFi+e5gZ+j1wdqppVvCkfskMq3T3NszjuLD9FWJ0=;
        b=UpMVdjbEtJrPfdLo/dr6glGVnJHe9M58hfWCQAS9RIQzjBVzd3O7xXDVmNZH50PuF4
         wU8NF9h4A32Gn92gjqBkgiUNbAqFvgsV/zHlFd9jJoF8tSC/350KqikfSl7lwO7s08E/
         cn8PIY6Hc3Zs5nzrscHMJUtN9H9fUY42yLngR+57fCP48w4m1dYsFQBq6loTX3X3x5TJ
         j9gnItFXl4ZdA7ErFxinVdZ6p5BjuMUG6Hfb+R2/2smlAB8fUZ+y1biCKMaRDqTsnzvf
         edDPUVw6YnF7hnlEKChzzLVY/8JTHmmRifDFUBKEwEKVV0wFzaDr40VrbZlxhrJ9okQM
         4D9A==
X-Gm-Message-State: APjAAAUboWVaO93QEJUvKJGEDRMQ2ViYPYVv4Y7EDPyk38lZ/m4VDTpU
        E262iTbCxrGuAWqLHS/nzt3J5g==
X-Google-Smtp-Source: APXvYqwevwpTqaEucrueaa4Qc77JNL8ERufSMcaTlL/LwfosS5nr2SjtA8hvfA0kSAR7tnDsCzGbxg==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr16735799wrs.113.1576867150800;
        Fri, 20 Dec 2019 10:39:10 -0800 (PST)
Received: from localhost.localdomain (amontpellier-657-1-145-216.w83-201.abo.wanadoo.fr. [83.201.136.216])
        by smtp.gmail.com with ESMTPSA id v22sm10003628wml.11.2019.12.20.10.39.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 20 Dec 2019 10:39:10 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de, robh+dt@kernel.org
Cc:     vkoul@kernel.org, todor.too@gmail.com, linux-i2c@vger.kernel.org,
        Todor Tomov <todor.tomov@linaro.org>
Subject: [PATCH 2/2] dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller
Date:   Fri, 20 Dec 2019 19:39:43 +0100
Message-Id: <1576867183-22668-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576867183-22668-1-git-send-email-loic.poulain@linaro.org>
References: <1576867183-22668-1-git-send-email-loic.poulain@linaro.org>
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
 .../devicetree/bindings/i2c/i2c-qcom-cci.txt       | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
new file mode 100644
index 0000000..691c7bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
@@ -0,0 +1,83 @@
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
+	Definition: a list of clock names, must include these entries:
+		"mmss_mmagic_ahb" - on "qcom,msm-8996-cci" only;
+		"camss_top_ahb";
+		"cci_ahb";
+		"cci";
+		"camss_ahb";
+
+- power-domains
+	Usage: required for "qcom,msm-8996-cci"
+	Value type: <prop-encoded-array>
+	Definition:
+
+SUBNODES:
+
+The CCI provides I2C masters for one or two i2c busses, described as
+subdevices named "i2c-bus@0" and "i2c-bus@1".
+
+PROPERTIES:
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
+		compatible = "qcom,msm-8996-cci";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0xa0c000 0x1000>;
+		interrupts = <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&mmcc MMSS_MMAGIC_AHB_CLK>,
+                <&mmcc CAMSS_TOP_AHB_CLK>,
+                <&mmcc CAMSS_CCI_AHB_CLK>,
+                <&mmcc CAMSS_CCI_CLK>,
+                <&mmcc CAMSS_AHB_CLK>;
+		clock-names = "mmss_mmagic_ahb",
+			"camss_top_ahb",
+			"cci_ahb",
+			"cci",
+			"camss_ahb";
+		i2c-bus@0 {
+			clock-frequency = <400000>;
+		};
+		i2c-bus@1 {
+			clock-frequency = <400000>;
+		};
+	};
-- 
2.7.4

