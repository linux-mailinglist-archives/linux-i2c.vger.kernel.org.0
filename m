Return-Path: <linux-i2c+bounces-14356-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BC61CC9A0B2
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 05:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 45D7234654F
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 04:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DECE2F7AAF;
	Tue,  2 Dec 2025 04:57:55 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.naobsd.org (sakura.naobsd.org [160.16.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AB52F744F;
	Tue,  2 Dec 2025 04:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764651475; cv=none; b=NsZHV0ARffvpW8FfxNFi8CqJvd63pECkp3g/9MopDks4ZxTCrYzJ88WgCc8yQefOnpEQqr2Fazas2FNm4uBdZBqjNbJ0EjVY7P0EmDtetTc9IgC2JQkFwTGer0Q3rDQmq0CjU7nH9hw6c7Nqhl3lJDSr7LXYm76bzbvdFpIDzJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764651475; c=relaxed/simple;
	bh=t+t+rWudqkTOpsqQn3QFTOePW2pWLYYSrCRrmeO7E+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nq+SIORfzy+7pd8jDGmvEEX4OyrQFbIiG21ztIW7XvUxXKDZUAnl1jWN8MEi1drS0oAafnownWjINZWW5OLUTmb8NXlBGBCDes52TJk5IIgtYRd43HvPhj+Y66PiB4rQt2gQyM44+I+zXkJf4APd2UQLSqj87Sbj0YabOB+O9tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com; spf=fail smtp.mailfrom=radxa.com; arc=none smtp.client-ip=160.16.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=radxa.com
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 5B24uxmF007827;
	Tue, 2 Dec 2025 13:57:00 +0900
From: FUKAUMI Naoki <naoki@radxa.com>
To: heiko@sntech.de
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        dsimic@manjaro.org, didi.debian@cknow.org, wens@kernel.org,
        nicolas.frattaroli@collabora.com, detlev.casanova@collabora.com,
        stephen@radxa.com, sebastian.reichel@collabora.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: [PATCH 0/4] Add Belling EEPROMs found in Radxa boards
Date: Tue,  2 Dec 2025 04:56:51 +0000
Message-ID: <20251202045655.154543-1-naoki@radxa.com>
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

FUKAUMI Naoki (4):
  dt-bindings: eeprom: at24: Add compatible for Belling BL24C04A
  dt-bindings: eeprom: at24: Add compatible for Belling BL24C16F
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


