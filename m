Return-Path: <linux-i2c+bounces-12207-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0CB1FACD
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 17:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9742176EDA
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 15:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F3126FDA6;
	Sun, 10 Aug 2025 15:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="4wz9D/i4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C5122B5A3;
	Sun, 10 Aug 2025 15:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754840317; cv=none; b=aGyYyNqDp3lSrg0aSyRHyso+hcZL8V4r5Rono/JhCFRDkbFp+BeO/MRcrp8UG32BRDz3b5BVBeg+p78V/ORWru0MFLBQ12H7ICM44PKEwIf9UdgSeaR2CQZVCnQLwnxdsJDmmFqIUx3CncpTFgzdN6bIbxLSRmRZDAdvSrHrD/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754840317; c=relaxed/simple;
	bh=0w2upDoGggcJae7L66CrnE7FOlXMPKWHXk7ekvtYE0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csjSAN0TH35m8rVZjAkc1klxcMiiOc2trhcCJNxWMEi5uGQihMlK++XecXqxwvDWqKToXCwPUx43BySC6onxbhyBcDzUT6ylixxUiYv2DpAVaIy701fpqaBQH9W6eKVuPCE8cs979HNynK3QgWH2JeXIFumovXHudAHtPt/pm/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=4wz9D/i4; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1754840307; bh=0w2upDoGggcJae7L66CrnE7FOlXMPKWHXk7ekvtYE0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=4wz9D/i4uaE95AptfD1hCbqPhBXhE02mFoz6uDyOHSua8LQH2TuNJhaJKzPdiYoH6
	 /fcWZw6z3eaKsia2PkNCr9s8pPCFf7xHOxWgJWkJU+P/iF0UZuhl2ueHB03ncbBAJ5
	 CLYLoS+xzMU3X+ioE5zU4m/ZHSx1rSk3uqEF3TOI=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 10 Aug 2025 17:37:56 +0200
Subject: [PATCH 5/7] arm64: dts: qcom: msm8953: Add CCI nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-msm8953-cci-v1-5-e83f104cabfc@lucaweiss.eu>
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
In-Reply-To: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2216; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=0w2upDoGggcJae7L66CrnE7FOlXMPKWHXk7ekvtYE0k=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBomLzu6xZE6y3pBnt77q/Cz2AcegvT5AuBuNULS
 cPHcMYf4j6JAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaJi87gAKCRBy2EO4nU3X
 VhgpEADJQQdouO3FAT0QsuNkgOwImzoili8ZtbbqJTCsmcoC+gIrusl9JxCeNaE9iA1CwyI8qkI
 vigxiiOVbATVtjGQ52UQtmGD1EOn5KwQ18gUjOIZhg67rP+kFEtbgKkzMBWeMTHEhogLlFbTagW
 v0w0GOWIAd4Hdffw1czMGddVKZLetadR0iFkafzKUWhI7xqWs29/kCka1rFUgfVHYAy+NaGsdgH
 Qra/XK6oMb3y0U974zjUn4+GxWxUF5EepQzmitRoHdzEp5k8OzbcFU/sOsh+al6DzrSWgvVyQ88
 Ba1dZzLqW2QQa8FmbjC/lD0Z1bOXrJ9Ta/QFxaFq1/eW/HU+wSFIfjjuHCkwoFawfm5/cW8xtWN
 G5CorEUVsin7Bu/N9EWWaha7/2DMKa/lnORPpNLBucWrOj/LxdDi2SPNIFeHFzkg2zCy6ZTkwnn
 TBrFjgT6iodbTVpRTtaBZLQtKqKaMOs7RgzaaJDivh1/j6liQ9L5/QzvKTquY1i2eCuYLdTMjCQ
 0yLFpa8wKAjwTpX/Pg47+8Xe3a5vCvSgBuF1ieIGlXwx7/dgs17fwHfte1ZxN5jn/KOz1sir/MD
 aDny3MTzinNfU6iMvQANqjBj+E2+M97s/WSugxPVclBp81qlGO8rrM0JbDlMRoueRrb8Cq5R8eB
 WZdbWcQS34S5VYw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the nodes for the camera I2C bus on the MSM8953 SoC.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 57 +++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index c8a1a91f033320645395e5aa216c0112746a9a8e..e10949db58e343c6913f6922acb764972a3d381d 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -699,6 +699,20 @@ spi_6_sleep: spi-6-sleep-state {
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
@@ -1114,6 +1128,49 @@ mdss_dsi1_phy: phy@1a96400 {
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
2.50.1


