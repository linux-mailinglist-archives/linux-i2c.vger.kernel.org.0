Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75BEA17F224
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 09:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgCJInL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 04:43:11 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44098 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgCJInL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Mar 2020 04:43:11 -0400
Received: by mail-wr1-f65.google.com with SMTP id l18so4574801wru.11
        for <linux-i2c@vger.kernel.org>; Tue, 10 Mar 2020 01:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5WnGmh/vRlpN1V58qrypiX81UrHCL64TgTV/PYkJ9GU=;
        b=REPFmFYi+4/FSy+lVApfdIh8SK+7SyKvjSqspHws0RswZUM0vgUzBWYvwjoGYUMMGF
         HtWyzxkMws1HYa7yJ4K/B8V8FRP9/P8RHbaUKtjitx5W/VIhnFPwcAjTPTTMBK5POATs
         PaRRbW6EUBSyIkZGODLAFDqrNQsx7x4ufp7UxyUK0X9bro+AGogq5D0qiYtnK7JfoQNO
         4xdXoxIz7unKtRfnCLHlJ9mR1amb6XkQFc71s87YIcIrDEWrWvvsmUkBEIrpv39jA+E8
         3q2urw+z9la3VTPAn0VmpxC330Bcldqk38aWcXlUWL1o5v46Ga9l1s/Nk71VjKIAOOiD
         +4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5WnGmh/vRlpN1V58qrypiX81UrHCL64TgTV/PYkJ9GU=;
        b=WfTWFE7R1Txpa7RD8fEsfe6szIXRpymGl94pMeWdBFzorajZ9uFLV7vyJ4knegpPUv
         wl8AtketH3fb+gQpc9ovUTjMcfmSg2D8xFnIkuJYtojaIGF3bNTbelnFBbIR4YzdPmWy
         kJP+InUeYizcx6uKad1ttHsqgPTPvcBqgmFXfIb8GiyWE6X9gKYEPHkjKkcrEjK/Mr/G
         nvO2ikywy0k0HahBusEhx7toE9BsMrM7MlyKEeJlOdlEYuz5ZEg99fDsGk+mGcDs2b/y
         gwrbQdFyUQVPAAD7mS8l+mzgXN6UodToWJ2ve458Nff3+vPXrlvnMx0cw6BUowmVG0Or
         6edw==
X-Gm-Message-State: ANhLgQ0HTFI+c5tuHeNiYQpYB0oU7pGDanKgy4GNIGwyzuXKD9NOnqoh
        1DjRQKILmPPY0VVekslbDldYCg==
X-Google-Smtp-Source: ADFU+vv8h2JwdDA9opScJGRCxHCjGR4nhrxz/7PNTWWJZo5SY/W0D2Kb6NQB7jLFYtq6wrWIBlxHDg==
X-Received: by 2002:adf:fc06:: with SMTP id i6mr12598931wrr.285.1583829787933;
        Tue, 10 Mar 2020 01:43:07 -0700 (PDT)
Received: from localhost.localdomain ([172.94.87.38])
        by smtp.gmail.com with ESMTPSA id i6sm33130748wra.42.2020.03.10.01.43.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 10 Mar 2020 01:43:07 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de
Cc:     vkoul@kernel.org, robert.foss@linaro.org,
        bjorn.andersson@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 3/3] arm64: dts: msm8916: Add CCI node
Date:   Tue, 10 Mar 2020 09:47:01 +0100
Message-Id: <1583830021-30141-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583830021-30141-1-git-send-email-loic.poulain@linaro.org>
References: <1583830021-30141-1-git-send-email-loic.poulain@linaro.org>
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

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8686e10..3c6f746 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1451,6 +1451,33 @@
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

