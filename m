Return-Path: <linux-i2c+bounces-13860-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32BC15E9A
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 17:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2F9154FEB3C
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 16:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F55634574B;
	Tue, 28 Oct 2025 16:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="CVMuYvRE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666CE33EAF3;
	Tue, 28 Oct 2025 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669698; cv=none; b=JTzXsWPu4IXImvPBjA+B6R7BzSH4po9OKStLPo8w14LMBMABduSUEiGS3EeVSnTUAZ4UqFwpDaZ47uVIguCQDcQcxTBQwRCdQQmZ/7PxDwyoNRdPLCStiYvCAeyAjQjH/EBS717HTzfOQ+DvHDv6Nic6rbGRLkJTtNjWIuqP3sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669698; c=relaxed/simple;
	bh=nHiJxy5dVZZ2fzE8k0XZk3dvoZtjPMtg8+vtSGKAiAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZvljuiuqeRv2f6wXB3cac0mQMTwRiOu7lAyELSaqF8oDjEfEu3elwmP0LnyEy+hHgLP3NaAK+d3fWMzfrnxqsdhoqu+KxNVoUjVP3Ivs3QVTAUaz8PABj4nXnqUTbmmEoCI8nrClLVbLnjQIz+1+/3Q8uCAt9i9vfQbiFKWYD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=CVMuYvRE; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1761669690; bh=nHiJxy5dVZZ2fzE8k0XZk3dvoZtjPMtg8+vtSGKAiAE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CVMuYvREn4hw9EbYQdy0q/zTdbzNg6OB1HSCY5FQK70sMqNTpwF8EmS2nLgFsji5N
	 cDxXmHTaDya+j0m4CO6d/rh9wyHzb1RBxZIGIr/y6iKd1c9+DxN6x8Z2A18kAv0POB
	 ON1SML+UVwVvKHg3oOy3mM0PfiY45eY0FgJpLpPw=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 28 Oct 2025 17:40:51 +0100
Subject: [PATCH v2 6/7] arm64: dts: qcom: sdm632-fairphone-fp3: Add camera
 fixed regulators
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-msm8953-cci-v2-6-b5f9f7135326@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=nHiJxy5dVZZ2fzE8k0XZk3dvoZtjPMtg8+vtSGKAiAE=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBpAPIz1mrPUPrJSyYyyIhMPflAuAoenZv7yd4Zd
 AnhlePwYWqJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaQDyMwAKCRBy2EO4nU3X
 VuniD/43sfLliVREXfLVJhXycEH1LSZ1wF9BU3cq7OOok/4C6fQDKWAX2mxpsfK9gUj2o/0QM9C
 wI9k7FQ88MUwKD4yzsdjeZ3U04nxuqIJ8rYUmKhwSuss2rfUWmQGAFTqRf4ACZ7vy2aU9oljIgQ
 LohEcbRsAdcN2KIAnz/8jOSkeP58Klgk0CNnvoQNGe0Rl8+pHE7d97iNYykXmK4CF4L6NviSZqd
 Jy7PAnH+FeqC7iBDtE/x//baUY4pouZ7o6NBNYZ37zhyDxuRSKoTvL/kx9JNyQHKRRIyrSjDHJF
 R67wLdaeoi2ggBDJNRRgaTfnozx+aAlESn9KGJ/Wy0SrRxNtGN/fm+zo/jyxIxyrAtDOkwaMKft
 Fpg5N4XuNB8ezDtdqCCTXacnb3BGL5OtxWOf/dp6FPkIFrd89TQqTgy89xAi15d+aOnDTVkeIHV
 9pAU52mSn/eiG7m0+5DGhQ3LqjYSNc5cdQKDtEJOTm+jkLq8xVC6J/+l03SDnrWWoeF2M9xImk6
 z5BvrU9QDXsjsXieHYWvAeK+XGGc7isgoag7KDo3WVBVvQCBKb/vV/zY8jBZ9uiIG9JP8Dwf4kp
 Pehuwc3QCNTXxflOgJTtIEgC4/wUjyG/1vJJ6sRo+TqOLjgEdwmZ1RTABgZ4wXmfgLcpW3hpHHY
 AtIU1a1jn5/+oGg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the definitions for a few fixed regulators found on the Fairphone 3.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 55a45b528bd3..557925a66276 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -36,6 +36,42 @@ key-volume-up {
 		};
 	};
 
+	vreg_cam_af_2p85: regulator-cam-af-2p85 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_af_2p85";
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+
+		gpio = <&tlmm 128 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+	};
+
+	vreg_cam_io_1p8: regulator-cam-io-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_io_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+	};
+
+	vreg_cam2_dig_1p2: regulator-cam2-dig-1p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam2_dig_1p2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		gpio = <&tlmm 46 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+	};
+
 	/* Dummy regulator until PMI632 has LCDB VSP/VSN support */
 	lcdb_dummy: regulator-lcdb-dummy {
 		compatible = "regulator-fixed";

-- 
2.51.2


