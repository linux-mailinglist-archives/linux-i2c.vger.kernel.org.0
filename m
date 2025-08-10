Return-Path: <linux-i2c+bounces-12206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D54B1FAC8
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 17:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01B92172D78
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 15:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891D826E6ED;
	Sun, 10 Aug 2025 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="nl3X1ryj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BF0226888;
	Sun, 10 Aug 2025 15:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754840317; cv=none; b=oRX0XT+pRkqN0kWfiYL20ny4oc0/Bf1jTE3O8tZLdprrvNlhIz3FVQgE8x5OFFzbd7Be/wveNvDm6lI2wdUuhqeqqiydxg0xbV3/RVjQyRZwZ3daORF+QUQnfRbeupEYSxGQfQPaUp3EikLTd1igsoSGy/63hbQWPcHSHHAT2uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754840317; c=relaxed/simple;
	bh=uavPzCwRoGbjUVcKhszFcpEDQIsu9/z0NGEOFxYaa6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bk10SLeT5IaGhqK+j6Xv0lNckAGE3KomB6mnr5fHjoMGsZSZCXoOHtHw2XH3o7/czHYFZyZvH3eyBb7MIQGg0D0aMVC9O7WkGYDZkE3PS3QPNuy+4H1aG7mImumj2hB2IDemXjXeyI1rTgB5vj/B5ZIghKjp9uumDaBejLH6L/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=nl3X1ryj; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1754840307; bh=uavPzCwRoGbjUVcKhszFcpEDQIsu9/z0NGEOFxYaa6w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nl3X1ryjual9jBg6hcGPYyoo14LxxCINxo+fJlvTcK6bDrT6MRItC6b/sjod5/FHW
	 sDkj3+SOXtRlO64J51FkO3CLSoQlnSH7dHmTzsqBoPSyfOnY+NGf6c5zi+vDTqQ84i
	 X4WCtChAOrnOF+mTKUC2Ez45BmiY9s7e2ztpCYag=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 10 Aug 2025 17:37:58 +0200
Subject: [PATCH 7/7] arm64: dts: qcom: sdm632-fairphone-fp3: Enable CCI and
 add EEPROM
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-msm8953-cci-v1-7-e83f104cabfc@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=uavPzCwRoGbjUVcKhszFcpEDQIsu9/z0NGEOFxYaa6w=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBomLzwuDQHaSfjE8gXjMT7u9VUSjscEwXH8OCRi
 vVgSu2Pi5OJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaJi88AAKCRBy2EO4nU3X
 Vr8CD/wOAF68ulK9PuSPg/yc1iGcaOF9deRBB8kESsO+e51G0U1Dgzqi4Befo7DOx81J5wO+hXb
 +jTn2NbugCWP2jVpS1KJFyI2kObWFr4jVBDp3/yQ9J2k1BEFa9vguqjR2Q0qEz0KJ8bSkihPtIe
 k4v8AkGseCUCOEYojOHViHS+3emYUdhmQtIF0BDrt3wOI4grWtjKkZzLFYTLEPO/I/YSRfsmNeQ
 roRqEUwXFlzN/bXW9kQkcpVsCP2BUPscr7IaNAmgnhIOLSNmmTz01a1vKjClH9t/cJ83+OJKp76
 hv35LQwIsanCUUrStRw+hPW57N8lUSO3+T47J4/l6DBJrUJ8/jqjvG5GWRqVIRI23AnWTxS6lSg
 lZVdHYqj+ZrJlK/U/9kXQr5RKQ5UA0oeKrKmot6HPEMUxFbEnGCxzmuffe7NjVNkqdmS9cjOE/T
 h3EO/uKU8iK26XO9kHrm9xJVyi82c2ZObpgvZeHVqcNIzDrwXwg0FGvftj7AiWZkLOSQwAc6ys2
 pbh7JBI4cwXnDnZbSSO6lyiXeOPjMwpc+/gFgJmO1uMDFdSLJXyzIvZkkKF+xole12i6zHnulcf
 ZJgW9/zvDbom2JInP+OymDhr5M2jlsgD0cxqjDFJyQA1AfhXJF7th3pAvJiEoy+6JQl33lS25YN
 pag7NAbPYmZ2/4w==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Enable the CCI where the camera modules are connected to, and add a node
for the EEPROM found next to the IMX363 rear camera.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 557925a6627665614caefed65d86a42c1e55ab8d..0edb2992b902ec1bee3f80aa75e50f3514091f28 100644
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
2.50.1


