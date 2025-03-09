Return-Path: <linux-i2c+bounces-9759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF347A58157
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 08:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90CC27A4F78
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 07:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C5718E743;
	Sun,  9 Mar 2025 07:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="JDh0VXQS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA08317A302;
	Sun,  9 Mar 2025 07:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741504011; cv=none; b=mAAtxwE3FPzpeLufcgV8LmnwVi2nLNxwJ2wboLIf3koXkLQpX5MaLmM1PUt1Zooqh6nkdUeM5AfI+vcOQ4T1wnuofSVyEwuOll8TJgh6NlaXWh2OtMDcIhkduoNYI1vjuaY0uJeS2hyu6+/NqTHypiy0sQRqPNBjt9j1x7lXIDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741504011; c=relaxed/simple;
	bh=YZ1NsQ1LjueMRWx5/RoVphfcn/yEKTPpf10GAJTNcmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QfA83swehavbqX+ujrI037gC7g9RVpXod4+i+8Bn8rvuyWVjumvJOldDEPg+OoAxFTvrGx7DdYif+i+yZjq/hNWj8Kj1jHp8EN8VbJ0BCGMfz+GlU8L7jPjpeP0dEu5NGoqS4tQ47nA/XLFxH+8uwNR9mC0DTPnU9g8ugyVaY5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=JDh0VXQS; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6ED5125EA7;
	Sun,  9 Mar 2025 08:06:48 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5s36HJaxT31; Sun,  9 Mar 2025 08:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741504007; bh=YZ1NsQ1LjueMRWx5/RoVphfcn/yEKTPpf10GAJTNcmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JDh0VXQSKXAliQQF/zxU6fQcqg1cc4yIDhJMoInrGxY5AE6wY5Z2RFVdZt4uJghho
	 A95cxH/N6VJhKASlkbfX0fKpJsASyFEn/vDvQLwude6+eKM48pauSIOmw2OYvhiZFX
	 vhLYYunQSG9iK5551JyaMjSy7kRj25yXmRBBz9aq4N8f0V4q1I1g4obSYpK3Ex7NM7
	 d/oIa4sANlCQe/5ZcaATnh/B8KKY2MneeeTZyRuci88+IYNCeESrGHM1RAkBT0ddqq
	 9YSanSlQkhd4nrfSw3P8EOGLBYIN4NfK+JRYCgf0nuMkSWLijg3jjlLxMmrFWdNjIf
	 ZIK4KeX67CfzQ==
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
Subject: [PATCH 3/3] arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C
Date: Sun,  9 Mar 2025 07:06:03 +0000
Message-ID: <20250309070603.35254-4-ziyao@disroot.org>
In-Reply-To: <20250309070603.35254-1-ziyao@disroot.org>
References: <20250309070603.35254-1-ziyao@disroot.org>
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
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index b74e605a5a82..ddcf690eb513 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -122,6 +122,19 @@ vccio_sd: regulator-vccio-sd {
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
+		vcc-supply = <&vcc_3v3>;
+	};
+};
+
 &pinctrl {
 	gpio-keys {
 		user_key: user-key {
-- 
2.48.1


