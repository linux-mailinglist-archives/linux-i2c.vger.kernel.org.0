Return-Path: <linux-i2c+bounces-10457-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CBDA91B6F
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 14:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C18B19E45CF
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 12:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B3B24A070;
	Thu, 17 Apr 2025 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="lgc1Ii9q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F93124A042;
	Thu, 17 Apr 2025 12:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891334; cv=none; b=XadWkl9Rv2y+5oI8kCchEpcYKP+z8aW9uIp8cNlxmaL0/MGWWm0Kiz6ag5xfBp1xxkmGpjmMzCgNbFU6OOmM7O7G11sY+NTUBsV2T7osDNwoAYax3zw21aexVUe2fn9gqii3Job4B03VwW/rrNbg3mBX5BlMA24cfAjhBvp0VLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891334; c=relaxed/simple;
	bh=6ZXpOpKFXe3BQmkcz2CtFn5gZTsYclZ9GbD4T6xOKbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JczrSAXovPJnJsfm+WFJ/Xq2zZTZPsj9vrLE+d3aJ75Jf9lnc29H46l/mbk88MlxU0w0aTL7pm8JdgoJzSjbeULyrym2OfRXOVvgBMs85SHsUVpyAeZzkGdgiluzYXYVkRJd4g67cLvgRfYNcRPNKxxQKEgrft9SzM749OdWWwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=lgc1Ii9q; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D18A925DFF;
	Thu, 17 Apr 2025 14:02:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTLTMcTzHm4d; Thu, 17 Apr 2025 14:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744891330; bh=6ZXpOpKFXe3BQmkcz2CtFn5gZTsYclZ9GbD4T6xOKbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lgc1Ii9q+HCq0tjO48u2cSjz4lhYMGVyVIMDSO6MRA67ndnRauaK9TG3tDkwVQbB9
	 uJEYAJGAlL3+CLPSC0rxF4BXuJuH4YtY4aHemKLf/mArgpb9Xtoh981ORsFWZfd/P/
	 uRJR8Dk9Tm5moIfbFNcO6+/5ajtEYrDiT/AiWe8tvAr/UMeKAeQ97ZRwRYO3Eo1O3i
	 Dkh7MLvi2z/tHiBuAoTAkGG1giLyTa9AGiP4jTFo4ciswujMBxllwjqIHAAcHVD9nB
	 22m7bEHlbH4jU8okBEr8mZ7cNzAQUPbVZK3UGd4zUAxJlkT4Aot8glBxQa1+Lb+UxS
	 E0vpi2H/D2AJQ==
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C
Date: Thu, 17 Apr 2025 12:01:19 +0000
Message-ID: <20250417120118.17610-6-ziyao@disroot.org>
In-Reply-To: <20250417120118.17610-3-ziyao@disroot.org>
References: <20250417120118.17610-3-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Radxa E20C ships an onboard I2C EEPROM for storing production
information. Enable it in devicetree.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 57a446b5cbd6..6e77f7753ff7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -110,6 +110,20 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m0_xfer>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "belling,bl24c16a", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&vcc_3v3>;
+	};
+};
+
 &pinctrl {
 	gpio-keys {
 		user_key: user-key {
-- 
2.49.0


