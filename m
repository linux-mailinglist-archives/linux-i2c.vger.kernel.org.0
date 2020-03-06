Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF3D17C402
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 18:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgCFRPr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 12:15:47 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33672 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgCFRPr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Mar 2020 12:15:47 -0500
Received: by mail-wr1-f65.google.com with SMTP id x7so3276233wrr.0
        for <linux-i2c@vger.kernel.org>; Fri, 06 Mar 2020 09:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bQ/Vc1IFuO+kONfnSbZfmfWRTf49hQjB6oIm1tUrS6c=;
        b=VAf/dhWx9l9zOE+I/mcukLGKTLkdwwQ/d9O7kM4IHsgQ8C0rzS+N0eydVUXFiqxnfv
         k47E/kaUwh3fGW8GOCYWn2pbiq5eSJDWvg+nrtXPgb2nSPuNiNwEz7fbIK9FS1HJXziq
         MS6RjkiKu7cslOM+oqBEHT8Ds1OLpobW4ELvrlTYUHD5MSBOhAGhtvWzqSpN3AHm/GDO
         VqbSQCbUEZkcLNScG033Q8cRxiTw0wsnfgYnP5lsMe7OnbpE18LWuCQCdL9s4SkbqCdm
         7aB0PLX20PtJg9F4Z7sWLtAXRNR2K4swuTIzpJJKLZd/W2c+bElvcFv5u+E6Cbwy44NU
         Fizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bQ/Vc1IFuO+kONfnSbZfmfWRTf49hQjB6oIm1tUrS6c=;
        b=oGdP2xh00VZRR086g8AlCCYnowwC+tTciaQjkUO/Grj9fUn6WluV24pi/LAUAzLrwo
         1w+jh+hINi79K5bKDynCV8k1fg6EYg47C40y3SPkbaXmBtSmEMhopr2I9GyTgzEAn5l7
         rkoyVKf0eSHz7w8+ts07gv3fZJkt4n5TG/KLnvex9HlBQk91p0O1LMPdkjqMtENz/Q/8
         wTt7uwWSCIk2AM+KqN70+BPXbJX07ieKdZuELbiB1gDcSE8RCRyM+y+p/Ph3CLdkWg1J
         fjlhA6ZIUtX99w5urW//iTQ2Y68RquIGHMxZT080E1T8X+Yjsr8TWCQc2kya9ZJT49CP
         ikFA==
X-Gm-Message-State: ANhLgQ0ywIXTs4t2fe3XT5qJ+8RT1qRHAE3yNIWcjatyM2V6QB3UxDlk
        JzsJZYmAH7DMz+T5LtB3KGQMi3RqIWFCkA==
X-Google-Smtp-Source: ADFU+vtdwijMi1T7QdNzVxeIjgjCrTKTw2v9titFJ0dHBSih3gLIxLjd+5vVPGH5XPmFHyMsw7Veug==
X-Received: by 2002:adf:ec50:: with SMTP id w16mr5075103wrn.9.1583514946019;
        Fri, 06 Mar 2020 09:15:46 -0800 (PST)
Received: from localhost.localdomain ([172.111.156.149])
        by smtp.gmail.com with ESMTPSA id c5sm545385wma.3.2020.03.06.09.15.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Mar 2020 09:15:45 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de
Cc:     vkoul@kernel.org, robert.foss@linaro.org,
        bjorn.andersson@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4 3/3] arm64: dts: msm8916: Add CCI node
Date:   Fri,  6 Mar 2020 18:19:44 +0100
Message-Id: <1583515184-9636-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583515184-9636-1-git-send-email-loic.poulain@linaro.org>
References: <1583515184-9636-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The msm8916 CCI controller provides one CCI/I2C bus.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 v2: add this patch in the series
 v3: add only cci node for now
 v4: no change

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

