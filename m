Return-Path: <linux-i2c+bounces-5277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 434CE94DEB2
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 23:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3717282B7E
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 21:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A7E13DDA8;
	Sat, 10 Aug 2024 21:14:56 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A4E3AC36;
	Sat, 10 Aug 2024 21:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723324496; cv=none; b=Hr353KgipWFDpVhgqauT1AwJgfwNSSFEvOW1/DffiKUE+ZBddG2QFyHCzKXHEnEe4fPFzPyfldnYVV99SlB5MhqzOO3bkYbqHAMtPMEmhTgwFRNKCxxY0aJclEjlfbW0d5oRh0NccH1MtmuBWzf0f8CjGfTLh9czmm3gUythhxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723324496; c=relaxed/simple;
	bh=3WndJr1VPCz32UZRt2j8a6HZa9mwEJ2Y/SDp/cfPBbU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tDqmIZtr/8PMyxIwWXtpj4IWV9AyJz6j0ggX32BVYBr/jxMuLbM5jzW8kFP/T13gGHoJEBlkwkKvl1uhoUQSRsy1Nytiqyg2wY5vHHvwU7+WSkWJ0VNBDB6zdMTOz2ZAHpNdbCQ6724kQMfXoL5OGgLd9AIzIC1py+egNNigykg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b02.versanet.de ([83.135.91.2] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sctQI-0007Ui-67; Sat, 10 Aug 2024 23:14:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: brgl@bgdev.pl
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	ukleinek@debian.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: rockchip: add product-data eeproms to QNAP TS433
Date: Sat, 10 Aug 2024 23:14:38 +0200
Message-Id: <20240810211438.286441-3-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240810211438.286441-1-heiko@sntech.de>
References: <20240810211438.286441-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device contains two i2c-connected eeproms holding some product-
specific values. One sitting on the mainboard and one on the statically
connected backplane.

While the eeprom chips themself have a size of 512 byte, the eeprom data
only uses 256 byte each, probably to stay compatible with other models.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../boot/dts/rockchip/rk3568-qnap-ts433.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index 110c323786848..7bd32d230ad2f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -458,6 +458,26 @@ rtc_rv8263: rtc@51 {
 		reg = <0x51>;
 		wakeup-source;
 	};
+
+	/* eeprom for vital-product-data on the mainboard */
+	eeprom@54 {
+		compatible = "giantec,gt24c04a", "atmel,24c04";
+		reg = <0x54>;
+		label = "VPD_MB";
+		num-addresses = <2>;
+		pagesize = <16>;
+		read-only;
+	};
+
+	/* eeprom for vital-product-data on the backplane */
+	eeprom@56 {
+		compatible = "giantec,gt24c04a", "atmel,24c04";
+		reg = <0x56>;
+		label = "VPD_BP";
+		num-addresses = <2>;
+		pagesize = <16>;
+		read-only;
+	};
 };
 
 &mdio0 {
-- 
2.39.2


