Return-Path: <linux-i2c+bounces-12205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF710B1FAC7
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 17:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1A1F189739D
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 15:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFB526E16C;
	Sun, 10 Aug 2025 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="WchrqbDX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B661C6FE5;
	Sun, 10 Aug 2025 15:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754840317; cv=none; b=nnhpMYUQ2MRBGCRD3OyhZreGCTIuhrvPiTlerfxu4Kxw39HfkaecL0fMiOe1afr9r1BGWHw2UnEcJqSsIC/Wo8V9aCWrupbzs8ertdZDs4iv3PIzaZasu1RA6AWYZ7bXgVvPpjFHPOOYWQilEnAW4WjRcAhaUTn0XBxZXvH+0mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754840317; c=relaxed/simple;
	bh=zLFTjE8QnKZwWG/D1SAu/9ASzpx5Bt+Yj/0b2vUINAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bNc2gAfY9AN9eZbF8mdZByTz9fQibqtxvw7P71YKz49cPYwLbh9KwOe8lbxxYEZ4lomqQPLr/09tbZj+J8+oJTgUTdG7fEVW/x/gDuOUPk9vDc7X/EhmJQWAvmjHVJjzdc3KAWloZwYxmRKQJI456q96tllUOifY46bnmNWlZg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=WchrqbDX; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1754840307; bh=zLFTjE8QnKZwWG/D1SAu/9ASzpx5Bt+Yj/0b2vUINAk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WchrqbDXk4cupywSwIxDh2Oq8k3tHaEYWZR6EW3lZwlDhWLEJi6p8iwU1acFh4Q2h
	 ZvPZphkTa5kiTvzHTnN1jxf/STwQEYHS4v8ta7InR7lTub2N+UcDDe9cTIAk/FbBGD
	 qfoT3qULRl13SEenxKYlfef6j8+l4Gqrr732j/u4=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 10 Aug 2025 17:37:57 +0200
Subject: [PATCH 6/7] arm64: dts: qcom: sdm632-fairphone-fp3: Add camera
 fixed regulators
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-msm8953-cci-v1-6-e83f104cabfc@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=zLFTjE8QnKZwWG/D1SAu/9ASzpx5Bt+Yj/0b2vUINAk=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBomLzvLPHz7E03g+c7KQ1BFlZFMfkrWpPWaWwXO
 9FEZVty13qJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaJi87wAKCRBy2EO4nU3X
 VnD8EACPNWNvvNbQXDAwWhbLYp5kxvW3WuUCc/MuWCUcYhJtSrXifD6bHG47PG3UJFoeNJXEC9X
 JNUEIhgbwhNM2IFAT8084VmbVwalyibF93BjF2/VHZ6Nvnh4KhyHoRVB6r30WHYsF0ay5SwgGLx
 m34SGfu6vVywzBQIeWwf71xlY2HKeF8eGrX/x8EHyrdbMGBOSSc5WemYKJljXxKcxhR8MUXSAkB
 fmvgDeifr3jgwNzvVFTSR1MXfaAMbJveGj9hv8Z/rR+XOeTP0k6JCjivcXymXW5sh5RDgU6cU4i
 e8u3yN8nfnUhgS29aoF4VjpI1wl2/NsLdZIIzK9BWYuK25miOaDvBw/MAygwU0yzL/Y7c421KNM
 wSqc2KU6xqOVvlEdfQgta384FF7v33JfxUvpkJo8Nyj+zQQldxhjaWqKZBsTq7vxIWKlYVdV2bi
 JptpMb3m/3T/1hVDVy1vxfiHTaJ4NYtvPRM/Ah8s8kUWXN6W7gJSj82mekTBLzjW2rIL0Ddcjvw
 b8m2aBwsb/qejyNvbPoj6eb9WiHj933WcZEOjbkG49WOMFcjOp7CUl1B1D2XjK2BBcrOaVLdhIl
 vM5Tm+noY3/zsrhWOVDAv9PsCfENimHApHioE3fKt3XBVlRu6vxqwk+Mctyiissa6VixBzCc5W5
 +6Os9BU4gEHx/QA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the definitions for a few fixed regulators found on the Fairphone 3.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 55a45b528bd3f1bf9b6fe7882753338b43c62271..557925a6627665614caefed65d86a42c1e55ab8d 100644
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
2.50.1


