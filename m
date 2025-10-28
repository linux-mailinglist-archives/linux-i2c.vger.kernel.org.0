Return-Path: <linux-i2c+bounces-13861-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2301C15E16
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 17:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 279EC35587F
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 16:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE04346A0A;
	Tue, 28 Oct 2025 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="l6mayBT1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6662D316188;
	Tue, 28 Oct 2025 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669699; cv=none; b=F/yczfX4VNnd70yiHiFmYZbtFpR1zWMuSbqkS8PppTQ4w2MOL/lX+XTs3xKsximmWoLohRO2GPyHhtTFLpnFi23Lz3cSpLdkGjMUJ6Mqck+0D9o0wO/uYGVyCUg+LiObkz97wkVDgMQPXjB1BH60BNDP9sw5ki+FWYcNu3jPBo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669699; c=relaxed/simple;
	bh=JspfmZYH6Dhqmrq1yZUtc6zW6CjlDHYA43A+bE8HOE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fk6UyMptRXdl6pCUetfucasvL2fDdkvvl8xU+IEbm44FA58DrCS2706NJDTTzng+exy9mFjcOG0NFKQEtJKtXEXBV21O+hK+LSo1MNh0YK9mlLCavd6bveqxUHIo4FsrQlwZgJ1JiTDatZcYB4HA0BRdE3hP4oa02JhMNrcOw1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=l6mayBT1; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1761669690; bh=JspfmZYH6Dhqmrq1yZUtc6zW6CjlDHYA43A+bE8HOE8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=l6mayBT1Q5kDwBlXmfoyFZp+hNrp09t5JwQgSkffnZOPvgvKnkzFYc7NH4QYCZtEt
	 PpqBea+FTCMRMdkq53i5+DCiZu6qAjMuw6etomTQW/YrAcEH0ANCUsaA/itwE113ZZ
	 KtgnRRDTai32hsu267mn/WWKpQlizqJJg3AteHY8=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 28 Oct 2025 17:40:50 +0100
Subject: [PATCH v2 5/7] arm64: dts: qcom: msm8953: Add CCI nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-msm8953-cci-v2-5-b5f9f7135326@lucaweiss.eu>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
In-Reply-To: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=JspfmZYH6Dhqmrq1yZUtc6zW6CjlDHYA43A+bE8HOE8=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBpAPIyGKD77xhozJdwB2Fxfg8orvyrgnwK0BYOL
 P+8hcaW82uJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaQDyMgAKCRBy2EO4nU3X
 VukSD/9k88VJeJhoy4y+oQOL88cUrrmosxCEj6LIX8dKeII940YVuKcKkyDwXryBLuS9OvbFjkY
 DmnLdEf7cTfhHldJwSRCcNkTELVarhwZVr+sBB1nm5zVh+lcg10uRwcggHrsutp1Zvh0ReIFJHY
 gQpWi89B0TSWhWs5LSHLZdJYqFCrkt8SCCjzlRuV8k5Y/xW+4SyQn3oQjWbS77mJ+IbtNYk48J9
 BSgrWtZyNPLgOQKvZkrxFpkj6ce55RjCd5cna+aTv9I6QZZyBv/imUkMNGOHwfSBOJnfLZB6mxT
 FFmkPLBQXdIvHyqcOpba/feiTEv3P2iDk/9Pmzu9KjFB5EM2Qb7q65+8NIniqWQOz8nMKu1EgJq
 PFi7ix1D1jXv9T3qi4YN9kVD9HqIsQMOY2jBxIvPUj0+M1wGEG2SJdoWjszAkdSa56nZ1uAYVd2
 jxZCPaIoDM1Nvp9kCk++wNBJ0HyRigBbiFx/KnQYgRza1eZBOUAgYYJoa4bgYMA/JKBfKI7dx/m
 DgTYiQWOQVjRqTjcF3hQWXMYFkTuOy579o+Omz6i2xI0E4KXez2ftGP6V8B/J036xZQrrgvE2LS
 HIYkEB6tyeIDBwOKB0ShE85aHOLyNZr/iqn85BdOGA+dFkqZkxBOZywW8nUo76XU7HA2x8TquIh
 JZDGmxFpVQjGZdA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the nodes for the camera I2C bus on the MSM8953 SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 57 +++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 7884a3ed8aef..753167c3f861 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -753,6 +753,20 @@ i2c_6_sleep: i2c-6-sleep-state {
 				bias-disable;
 			};
 
+			cci0_default: cci0-default-state {
+				pins = "gpio29", "gpio30";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cci1_default: cci1-default-state {
+				pins = "gpio31", "gpio32";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			wcnss_pin_a: wcnss-active-state {
 				wcss-wlan2-pins {
 					pins = "gpio76";
@@ -1200,6 +1214,49 @@ mdss_dsi1_phy: phy@1a96400 {
 			};
 		};
 
+		cci: cci@1b0c000 {
+			compatible = "qcom,msm8953-cci";
+			reg = <0x1b0c000 0x4000>;
+
+			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_CLK>,
+				 <&gcc GCC_CAMSS_AHB_CLK>;
+			clock-names = "camss_top_ahb",
+				      "cci_ahb",
+				      "cci",
+				      "camss_ahb";
+
+			assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+					  <&gcc GCC_CAMSS_CCI_CLK>;
+			assigned-clock-rates = <80000000>,
+					       <19200000>;
+
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		gpu: gpu@1c00000 {
 			compatible = "qcom,adreno-506.0", "qcom,adreno";
 			reg = <0x01c00000 0x40000>;

-- 
2.51.2


