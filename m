Return-Path: <linux-i2c+bounces-13859-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAE9C15E13
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 17:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8B50E3557D3
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 16:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C1A345732;
	Tue, 28 Oct 2025 16:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="66mPCvAI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665AC305E31;
	Tue, 28 Oct 2025 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669698; cv=none; b=TFdRe3XL0khaPjuWln+eSbuO5okP/KqlZcGvp0JJ/aAfUiTq3xAf90GuAAuPqqFNHLiX0DcA/benMPfoGE/Reon/ciO6/z3VFKolIWkBUlwDiKuNCYo0uTsdDHC5/um7caSzgZHTRvshv2G+jO7Ep794iwo1gAQGszyv4IrZirQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669698; c=relaxed/simple;
	bh=ecnA0KG481FICL1IxqZl/Uq99VZDiX0xPco/otlm9Gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPMicen05DXG3cNz1QiZGca3Jp1ZPIKWYGsR9mjEny/nMgC9xsBKsyzk2YSff1gEYEal8tZGifY53r8rLqoC54uxBrGvbVZVesLas6KmN+hoUMH2FS1wvUtRBy/0G5GACtJ4IAAt2ksfO03VVbLWbyEoL37sesBxdEGQDo40570=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=66mPCvAI; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1761669691; bh=ecnA0KG481FICL1IxqZl/Uq99VZDiX0xPco/otlm9Gw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=66mPCvAIA9hoc9ACXaoEmKAXo4oK0mTdFFeT+MrBYeoJbYOwojrRpcCzv/SXpZQ63
	 Qjb+n+2BhOTYM4F78vTpVjcIHRZ1JQ9hw0EXyJf/mX5ff3sC0mpiUNa0Hq6da9Alkw
	 yPXHve/7WKAWNVpbftwcjoo6RM5MMBTpdAh5WcLc=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 28 Oct 2025 17:40:52 +0100
Subject: [PATCH v2 7/7] arm64: dts: qcom: sdm632-fairphone-fp3: Enable CCI
 and add EEPROM
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-msm8953-cci-v2-7-b5f9f7135326@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=ecnA0KG481FICL1IxqZl/Uq99VZDiX0xPco/otlm9Gw=;
 b=kA0DAAoBcthDuJ1N11YByyZiAGkA8jSiCLgFvBfKbtvhOkmqKYyjXVuShnNWYUFYagZabQwKq
 IkCMwQAAQoAHRYhBDm60i8ILNqRuhWP+nLYQ7idTddWBQJpAPI0AAoJEHLYQ7idTddWZxcQAJCk
 JEwXQxPtkGNZDs9S6+lMY5j+Z9Hsp3k1Dv75lc2X1YdQ41FRxglzq7pHTiv1YxYbo1vnPmiGkjt
 O9oA+HnoFpo1U46RMb/OgM+p/o9RshEruUSFvrSYofT3uD7yU1CLMw0rOuc6lBao62EIeZSurtj
 OOvHNyHuDekxk/1DQmwN+VNueqp9iqVHFvsqvepg/PeEPTDuLSW6WzXY1gANgeUjR0lRA7asnaT
 9JQzv1EP/hvFK7rSnFuUKUXJoKsp8ipnuahUz6zam3yrhuzq0rm7RQDCS6LieCm4YdIJIvPhqyw
 SiK4Qc4cN/bZjQrZuJ+Efep3TMjYvrxnLgVDTadjcIvu6UDvODkuRrvGFT+dabKbrrOTgnvWzZL
 ODw2E5fnnbRYVwwr3OPU4Dsc4Oo2XITPUUjvHzS0kwn+OxBfc187eCC7U9GZB9BOid56+M/9eKu
 93FbNAfnuGz5bZxc2f/5+iCb/YcB3IWFhOC26V8V4tKsJ1i5rPNPcqoPNfYYrsnaYaR2MyKoZ3U
 SBqVumaV/mo8unXTSOy8ntjzICYK3Al7uBUnciLFsrDZfgO/qqodyHPrSfSDkhnHw0bqwb6UqMO
 xBUUFQhlmaIAUeByjLnTYYQEDdBVg9PdIAKVVGXY1hMkptp1023YBBA4ftoyamPuIDp7MBm4dNp
 lzZse
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Enable the CCI where the camera modules are connected to, and add a node
for the EEPROM found next to the IMX363 rear camera.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 557925a66276..0edb2992b902 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -88,6 +88,27 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
+&cci {
+	status = "okay";
+};
+
+&cci_i2c0 {
+	/* Sony IMX363 (rear) @ 0x10 */
+
+	eeprom@50 {
+		compatible = "belling,bl24s64", "atmel,24c64";
+		reg = <0x50>;
+		vcc-supply = <&vreg_cam_io_1p8>;
+		read-only;
+	};
+
+	/* ON Semi LC898217 VCM @ 0x72 */
+};
+
+&cci_i2c1 {
+	/* Samsung S5K4H7YX (front) @ 0x10 */
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.51.2


