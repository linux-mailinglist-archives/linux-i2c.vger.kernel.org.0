Return-Path: <linux-i2c+bounces-10454-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04240A91B70
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 14:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E5333AD9E2
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 12:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8872459CA;
	Thu, 17 Apr 2025 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Yrmpd6bJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FB7245000;
	Thu, 17 Apr 2025 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891323; cv=none; b=DVeLWE17CT2hYsPLd3e8yAoaAg6+guxbS3vYa1lD7Ce++KknrdDPw40T//92jKdj2fhe4NjwMI3VDacgiOG6Gm6UjPh7ZrWtWWmN3cQY9IPqPn2Bu8BSMT7lRmoKVSm5hVid9gVnpDDOCK5sutxf7gC94pDXHbc1UHUN3LO3vws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891323; c=relaxed/simple;
	bh=OxekrltX8CslSDgfz+SNyaS8erECtuzT/O/V5NUoSbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OD2h4pSSfXGpQ0njXdi0JdYnPBzbJBwimsyl8YpbS5U8NzIrSjP7XSuPPs8HswovcWxzhKKsmnX0CGWFlk6cFQ4to48P9EMUY7LrqsHs2AEcJOmc1koY8m8DwxDILa7C6fv017jGpBuv0MR/P/im1O6I8GK0cIYBSbTPd1+vjlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Yrmpd6bJ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AF6E525DAF;
	Thu, 17 Apr 2025 14:01:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJdCT95lv0-O; Thu, 17 Apr 2025 14:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744891317; bh=OxekrltX8CslSDgfz+SNyaS8erECtuzT/O/V5NUoSbI=;
	h=From:To:Cc:Subject:Date;
	b=Yrmpd6bJSHrgWNqB+FyfnUELsF4p2/rXvXK6N8qn+KciOlI5uiWr9fm0ZC5uSdnh6
	 ogEUvBijRoSp5lnWxI6SvbIUA/iKRRQCvk5XOLcVW+qg1eKbnmugrIK/lve7LBF/bm
	 1LGs9PgOYJd6dr78bUdA+YmoK/Ma+cLnoeRp3OMgwgJW5yFfqjE3cTR6iUO609nyfD
	 Ae3qYTPsTycEpjlnKUIsLM7ntKVWgGgPApSJpvWcURc+wdNMDLW9gC1Mc6UULMhYd+
	 Pvt7dcBG3fx9WDbav5YQ38QSAWu3yS2L4jjPKXnYr9HGyu0YlRN67iXEbOtoPFgN5b
	 w5ekjQJbwyc7Q==
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
Subject: [PATCH v2 0/3] Support I2C controllers in RK3528
Date: Thu, 17 Apr 2025 12:01:16 +0000
Message-ID: <20250417120118.17610-3-ziyao@disroot.org>
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
EEPROM of Radxa E20C which is connected to I2C-2.

Changed from v1
- rebase on top of linux-rockchip/for-next
- dt-binding: collect review tags
- SoC devicetree
  - sort i2c and gpio in /aliases
  - provide default pinctrl for controllers with only one set of
    possible pins
- Radxa E20C devicetree: mark eeprom as read-only

Yao Zi (3):
  dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528
  arm64: dts: rockchip: Add I2C controllers for RK3528
  arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C

 .../devicetree/bindings/i2c/i2c-rk3x.yaml     |   1 +
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |  14 +++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 110 ++++++++++++++++++
 3 files changed, 125 insertions(+)

-- 
2.49.0


