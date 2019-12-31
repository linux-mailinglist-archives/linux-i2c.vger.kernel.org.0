Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5454412D75E
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2019 10:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfLaJX3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Dec 2019 04:23:29 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37132 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfLaJX3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Dec 2019 04:23:29 -0500
Received: by mail-wm1-f67.google.com with SMTP id f129so1437517wmf.2
        for <linux-i2c@vger.kernel.org>; Tue, 31 Dec 2019 01:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WPcgVhEHNK42D0Gldks5ovVVLr0SxkDopBo5FedXpYw=;
        b=ODOb3/rjLx2VFEK/71/6RToeburRb3MmLt2NmEuMsf5nlOHBOjtnuaCUXFFDX8M6AK
         SzpNhK2l8ZPUS7s1ZFzSUC3Wzd0Dszi0avTmeg0V9A9u2iJDEV6csDj8WG5UzxN/GrNL
         zjO0X4+LmBsTk8tc2dZ7Ziv54tGRzG6/XdBdcLjNwLdR1AkzLKOaAV3+Ku04syY6PyRL
         roirZ3rJ3Ixc9FJx8tn9eIQ1r2fq9BszmNjNETYX5dXE4G9hWk9OYdjC+M9l4TFBjgHT
         jCeJLDVUo3aX32BCtbdJ+5lscpPq1BNqCGdroCzwB7zZQkUVabhj9h396KIPLX1xP7qT
         RI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WPcgVhEHNK42D0Gldks5ovVVLr0SxkDopBo5FedXpYw=;
        b=jpskSS/X8xEb78ORvfbcZe3HOc5owhc3DqRTNWIirrO+cnQmbpm/kGOXkn+UpNQZ6K
         4EDU/WR8Le6LqEniG7FyjKXGmumPQiZ901N3v03BnSQBOAN8eBPSN4M3REFRsHTBwPtY
         V7cIrj+K50PZnR91SNl+sofATFsZI8OFc2RsbEHtXjmY67cV+93/MWwoBVqUXFtbGDsi
         zGVG8SH3mgnTTzSUzcGDc6BI/GBIMO2NoyPvtI3nwoP3xpIPJoGPXOximJhidEiwSgoz
         2Omv2fosItUuwdfiKIBDbtxd9gK7EeK1SsANbn3cixfjsX/cOIUdoNSSfx9XbA43acF4
         J3DQ==
X-Gm-Message-State: APjAAAUiJpCVYjdxK7+2XFYXXPKXBAHBwMPid4/wo+83ItHtA5g2/0m9
        b4mgwrF/m8rn18XbgqXGyrcYXNoSx6g=
X-Google-Smtp-Source: APXvYqx12xK+Gth9F++Y/Eh+BUbHI9N6Itu2Wmhfq/RqSrc7VtgJVEInBBFHiUcQt78QIAXL0cbfSw==
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr3472545wmi.31.1577784206542;
        Tue, 31 Dec 2019 01:23:26 -0800 (PST)
Received: from lpoulain-ThinkPad-T470p.home (amontpellier-651-1-422-191.w92-133.abo.wanadoo.fr. [92.133.205.191])
        by smtp.gmail.com with ESMTPSA id f1sm48153410wro.85.2019.12.31.01.23.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 31 Dec 2019 01:23:26 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de, robh+dt@kernel.org
Cc:     vkoul@kernel.org, todor.too@gmail.com, linux-i2c@vger.kernel.org,
        bjorn.andersson@linaro.org, Todor Tomov <todor.tomov@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller
Date:   Tue, 31 Dec 2019 10:26:36 +0100
Message-Id: <1577784397-28682-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577784397-28682-1-git-send-email-loic.poulain@linaro.org>
References: <1577784397-28682-1-git-send-email-loic.poulain@linaro.org>
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

 .../devicetree/bindings/i2c/i2c-qcom-cci.txt       | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
new file mode 100644
index 0000000..ca8b9ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
@@ -0,0 +1,91 @@
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
+	Definition: a list of clock names, must include "cci" clock.
+
+- power-domains
+	Usage: required for "qcom,msm-8996-cci"
+	Value type: <prop-encoded-array>
+	Definition:
+
+SUBNODES:
+
+The CCI provides I2C masters for one (msm8916) or two i2c busses (msm8996),
+described as subdevices named "i2c-bus@0" and "i2c-bus@1".
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
+		compatible = "qcom,msm-8996-cci";
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

