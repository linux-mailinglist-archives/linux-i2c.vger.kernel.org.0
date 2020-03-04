Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3221795AE
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Mar 2020 17:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388024AbgCDQtT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Mar 2020 11:49:19 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51156 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388063AbgCDQtT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Mar 2020 11:49:19 -0500
Received: by mail-wm1-f65.google.com with SMTP id a5so2897682wmb.0
        for <linux-i2c@vger.kernel.org>; Wed, 04 Mar 2020 08:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rD4Tta4Ky2Kw2i1Eu0PqbZJvYvJ9BvhGYQ86KEAuKFQ=;
        b=e0x9VRmEh4+SOYPrLNbTuhz1MG2bga7HXMsnNjfVFqiZJY4bzLEKBw5tHlBHh+CD83
         9l5OzS24yLoDtj+UjuiFBxxTCU6gNsiVgR2P1hkKHPB4uSY9/2wuQkcqCwpjokblzDA/
         2QWwz5xS8wL/N7PvpbLbSp1B3fw9oKuxXJEVmqkrHuMqsJ+Q/fka94AgmcPEE0wmsxJD
         h0RdnbaYpEqmSnoJOPq+YU29fVxTSFFIeVIAM7IVYwdDeVm2xnRx3STahvOQ46IULTBK
         5D0s/poGRPdiqSUn3/XjjgNCqXpvHLoRv42wxkm9Ar06vCewyJ4pdHUZklfUyzFo/hL5
         lmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rD4Tta4Ky2Kw2i1Eu0PqbZJvYvJ9BvhGYQ86KEAuKFQ=;
        b=oE8y0v40bFrIlk9tCRgbQ66qGBHOJVE7LVwFr1ToG+sNrQlx8E8GcFWQBKNCKo7WFD
         bK8obqR74Dg/BfOt03HvsgZGBiQ9iqJN4Nf4oJ2FG3LAFkXnDHvzJKZ7Q796X2HaGqzz
         f4WvcZiuI4HFAaltx7BZA2q7mY/sVKpFCfR9qHDcQz19lAHqUIME8YpdVItBu5P/rGRx
         gdXJVQedPlh84CnJ4GJs1kBkRZnk7UhKTSE/eVebjgthX82htvxWD7bEJ5eJXhfLLwnw
         MBwnQJ8qmKHxt5B8zCBVv+Ic1ShKBL+0GxVTzwigXijjga+/bwF94n4b+I5dnyunPr6B
         og2Q==
X-Gm-Message-State: ANhLgQ3bHAvktek3YQmLsv82+it+sVZFAxt/VpVxnEWmqtkLHAOHCa5q
        wkKaXGnxf4iKEWz7NtdNS1z4iQ==
X-Google-Smtp-Source: ADFU+vteAHmkMq+Gs1WexHwWt7Wto47wSEU8tcIx7f0ctaJaV5kC7TSMdbfOeVNwpiS0q7Lv13Csow==
X-Received: by 2002:a1c:81c5:: with SMTP id c188mr4457833wmd.98.1583340557147;
        Wed, 04 Mar 2020 08:49:17 -0800 (PST)
Received: from localhost.localdomain ([37.171.70.150])
        by smtp.gmail.com with ESMTPSA id y3sm909226wrm.46.2020.03.04.08.49.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 04 Mar 2020 08:49:16 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de
Cc:     vkoul@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 3/3] arm64: dts: msm8916: Add CCI node
Date:   Wed,  4 Mar 2020 17:52:56 +0100
Message-Id: <1583340776-27865-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583340776-27865-1-git-send-email-loic.poulain@linaro.org>
References: <1583340776-27865-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The msm8916 CCI controller provides one CCI/I2C bus.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: add this patch in the series
 v3: add only cci node for now

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8686e10..985cb5f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1451,6 +1451,33 @@
 			};
 		};
 
+		cci@1b0c000 {
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
+			cci0: i2c-bus@0 {
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

