Return-Path: <linux-i2c+bounces-9756-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5424FA5814D
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 08:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8766716C5BA
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 07:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47B617A2F4;
	Sun,  9 Mar 2025 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="UTR3mDpz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6028B20330;
	Sun,  9 Mar 2025 07:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741503999; cv=none; b=oNF9uMUXrEH2vrnFYQfc68wLKc0e6+9aSX/IY8PILKGDdGxSE0tXQ/1E47yy5gRwUWyCc8v23+Ikv3BWg60tO4W3UwOUxx8bAegBj/Tk5+u5zPWKP+tt9a4ba20e/nPx5CvDDAxROl4lM9tBgVcPxaMJr3++AZqj+A0T9H/H/B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741503999; c=relaxed/simple;
	bh=vylK+Hj423bu2ryxm5MijJrbFuAUeovoLjxbShm2MIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lrC/IOjZKzolNQc9c+QASzFaFWC1Uzg0OZuPnzQTGeieAJ9tsYRNKAP9HCg6DQBaM4iP8DwIOMAHbck8uNTr4EGGV29VWhsjbtE4BbY6OmXKB118P0dXZr0MgD9wHERdb5HP4JN7/WbEay4mg3Vq4zgQ0Fh8I2OhM8llCUaP6hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=UTR3mDpz; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5445C25CBA;
	Sun,  9 Mar 2025 08:06:35 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yQwh282UgXG; Sun,  9 Mar 2025 08:06:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741503994; bh=vylK+Hj423bu2ryxm5MijJrbFuAUeovoLjxbShm2MIo=;
	h=From:To:Cc:Subject:Date;
	b=UTR3mDpz7rkMjVhd2kO+QIsgXg/IhxLxzxMMICR/Nm0AwtTcdLnaSNnqheaqefBB7
	 5vI/6wUGfAs1xXVL9yyGMlb10Qrgwr3XQW2QXe2JNi10axKkXXNEQRHdy6OzaDWq+9
	 EGUZA25+BCspwdV42M5CmfIadGRLcjZh82zMNicK/yP0AoxMjMZ366QmvzLM/ecXZ3
	 1W5VzLyQbB+J/jvguBhQP3p8Edgp2o5UOa4DuRGUowgShSmDhQoPPG44prJP/Zowjf
	 080aCm17AMtxzqB2Fv8usFBpBi9IJiOAUGJwuuKt1hCkmNQsDjbiTkcMkdEyBvQtlH
	 qRHLy/n8Wlihg==
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
Subject: [PATCH 0/3] Support I2C controllers in RK3528
Date: Sun,  9 Mar 2025 07:06:00 +0000
Message-ID: <20250309070603.35254-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RK3528 integrates eight I2C controllers which are compatible with the
RK3399 variant of i2c-rk3x. This series documents the controllers in
dt-bindings, describe them in SoC devicetree and enable the onboard
EEPROM of Radxa E20C which is connected to the second I2C controller.

This series is based on linux-rockchip/for-next and may depend on the
v3 of SD/SDIO series for a clean apply[1].

[1]: https://lore.kernel.org/all/20250309055348.9299-1-ziyao@disroot.org/

Yao Zi (3):
  dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528
  arm64: dts: rockchip: Add I2C controllers for RK3528
  arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C

 .../devicetree/bindings/i2c/i2c-rk3x.yaml     |   1 +
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |  13 +++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 104 ++++++++++++++++++
 3 files changed, 118 insertions(+)

-- 
2.48.1


