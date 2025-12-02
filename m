Return-Path: <linux-i2c+bounces-14367-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C5C9AC13
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 09:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C0E5134686D
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 08:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C4630748C;
	Tue,  2 Dec 2025 08:50:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.naobsd.org (sakura.naobsd.org [160.16.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C15F3016F0;
	Tue,  2 Dec 2025 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764665419; cv=none; b=WBfBLjn+GlslPi5iFyPCC7EJIxNjXs8O33yaIvJn0soskU2gowRycPNDHoks0Tp4ua5oz7loX3/muvpcN0WGLB03DyZFxLN9bcc0HGCmWWnkc1RoUO9r3yUr1Fm6tnmOF500piyUqDSmDMyRuNvTAj5PlxiLN2eiWh2qLErAvO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764665419; c=relaxed/simple;
	bh=qFU3wcXG1wJvPpJQYa1Kuwqh+yjeXawJt32VH1lrqNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K9RuAZSZvWsuFBa+xtl/Da52Cvh/tXdFrNeEzgfMYs/UwVWsYPfqMRYA1oFg8qaVemzMk+mpbbuB8fz4Y9mHYUx6S/Rm57DXNN27FAkUMeONjLzZ/sjQn/rrl/wEKFTywD0ngsp8ct8+Kwafbv9dTWybWC6siPlvp6i72lFod+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com; spf=fail smtp.mailfrom=radxa.com; arc=none smtp.client-ip=160.16.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=radxa.com
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 5B28noM3008635;
	Tue, 2 Dec 2025 17:49:50 +0900
From: FUKAUMI Naoki <naoki@radxa.com>
To: heiko@sntech.de
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        dsimic@manjaro.org, didi.debian@cknow.org, wens@kernel.org,
        nicolas.frattaroli@collabora.com, detlev.casanova@collabora.com,
        stephen@radxa.com, sebastian.reichel@collabora.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: [RESEND PATCH 0/3] Add Belling EEPROMs found in Radxa boards
Date: Tue,  2 Dec 2025 08:49:38 +0000
Message-ID: <20251202084941.1785-1-naoki@radxa.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds Belling BL24C04A, BL24C16A, and BL24C16F EEPROM
found in Radxa boards.

FUKAUMI Naoki (3):
  dt-bindings: eeprom: at24: Add compatible for Belling
    BL24C04A/BL24C16F
  arm64: dts: rockchip: Add EEPROMs for Radxa ROCK 4 boards
  arm64: dts: rockchip: Add EEPROMs for Radxa boards

 Documentation/devicetree/bindings/eeprom/at24.yaml |  2 ++
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |  8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dts   | 12 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |  8 ++++++++
 .../arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi | 10 +++++++++-
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    |  8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts    |  8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    | 14 ++++++++++++++
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      | 10 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    | 10 ++++++++++
 10 files changed, 89 insertions(+), 1 deletion(-)

-- 
2.43.0


