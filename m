Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6D51A0950
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 10:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbgDGI2o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 04:28:44 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38762 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgDGI2o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 04:28:44 -0400
Received: by mail-wm1-f66.google.com with SMTP id f20so868039wmh.3
        for <linux-i2c@vger.kernel.org>; Tue, 07 Apr 2020 01:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0W3POgHv3CxVqOvPXApE3GtwRF1x9m6pLJ96F+LNxdA=;
        b=G3mCwAx8h+uldWmZXdjBwzVlOpDBFfp2UX1IPIirarVO7It/OCasU860MA70LSFJMH
         s/wBsonRqvuSBz6ry+lt2GdkfrqAp2FiiE4xHgQHf75yHaLyYY8MM4rIC0FH2ilmP63R
         6j+PlHAA8M9emXB2Gu7IR8cpVI2MLKumNGIbZR7sVEkRy/61QsMv4vZ7yrMArtOTn12v
         hmWgnfImC7ijNd3DBiRsbJLKJdo/0IWrXAeWYbLrpMqSuzSTBjSS84u+IALbJxqt+Wb3
         OlVmDQkERlJ2juEE22sKXqNqYpdNv6vphyPACL2xQKz78SPTM+l0npwjENvXVM9O1JQA
         p8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0W3POgHv3CxVqOvPXApE3GtwRF1x9m6pLJ96F+LNxdA=;
        b=J5NyrMyDQzfYGx9wBCmgSzv+FYeWz47ibutys2LpH4fjL0cJmKKS1wgS/fAfJ9H8Lt
         7i6cRLkSeje3WwqvnlAcgQUpkzb+8ULUPTcEIk1tr/adIYO3c5fU/GeKw/bhQJg0dXKw
         p9jfkj7VEOvMguTwI7O2AefzFSwJxFgPnuQewIM0BlLjuDNWlRNwVA+QRfiBrMCdjb31
         hCNa7QoqJ/g5hGOiMpyLwHYSHM7y4nWfIZpdM0ZfVCHaxeeDvIG9RuuE2t4xqjKEBF/h
         uod5k5SRzSw1BlLxxHb9bZ1/g0eoFal+3t/RAdxVxJ+28s6rTlGN0DrxZ83leo09sVEv
         iLcA==
X-Gm-Message-State: AGi0PuZqXKeoh52qxfEfYWokhCQruke2ZhLxN2Dhrxp4KIu7Ai42HjlF
        lHzVeTM3LFB4aoMZTXxjNHeXtg==
X-Google-Smtp-Source: APiQypIQt5ed7aX/cCetWNtdqHPWj/MxgEPu2ZFICES1Odh60ubd/+kXMXz4edtTbr2qZFVOlcJ0UQ==
X-Received: by 2002:a05:600c:212:: with SMTP id 18mr1222183wmi.129.1586248122251;
        Tue, 07 Apr 2020 01:28:42 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id r5sm1360057wmr.15.2020.04.07.01.28.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 Apr 2020 01:28:41 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de
Cc:     vkoul@kernel.org, robert.foss@linaro.org,
        bjorn.andersson@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v7 3/3] arm64: dts: msm8916: Add CCI node
Date:   Tue,  7 Apr 2020 10:33:02 +0200
Message-Id: <1586248382-9058-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586248382-9058-1-git-send-email-loic.poulain@linaro.org>
References: <1586248382-9058-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The msm8916 CCI controller provides one CCI/I2C bus.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 v2: add this patch in the series
 v3: add only cci node for now
 v4: no change
 v5: add cci label
 v6: no change
 v7: no change

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 1ced09a..756cc2f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1479,6 +1479,33 @@
 			};
 		};
 
+		cci: cci@1b0c000 {
+			compatible = "qcom,msm8916-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1b0c000 0x1000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				<&gcc GCC_CAMSS_CCI_AHB_CLK>,
+				<&gcc GCC_CAMSS_CCI_CLK>,
+				<&gcc GCC_CAMSS_AHB_CLK>;
+			clock-names = "camss_top_ahb", "cci_ahb",
+				      "cci", "camss_ahb";
+			assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+					  <&gcc GCC_CAMSS_CCI_CLK>;
+			assigned-clock-rates = <80000000>, <19200000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&cci0_default>;
+			status = "disabled";
+
+			i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: camss@1b00000 {
 			compatible = "qcom,msm8916-camss";
 			reg = <0x1b0ac00 0x200>,
-- 
2.7.4

