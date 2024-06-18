Return-Path: <linux-i2c+bounces-4071-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DA790C62B
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 12:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D1B21C21D89
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 10:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1544116B3AE;
	Tue, 18 Jun 2024 07:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="czS7B6fi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF416BFAA;
	Tue, 18 Jun 2024 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718696569; cv=none; b=U1OfXecyiAneWE4b4c2AsGxOkaWxyzXVwIGtdX2ZzkQZtc5kolUiKfzlbariGgfySU5WghjQl4yjYfDkzDcalnIPgqa+KAwFH2giABXrGsCtKKFU8yPNUR2Z8s6ABiCBVSTpSU7n6QuF1GeN7dXKNA/GEnExf/2/6F3DREoWDjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718696569; c=relaxed/simple;
	bh=yFUoZPLEvl9zKEWKLvMDdTp1Yngrq4RW/cuBQK35TNk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bj4s7exM8++MuMpGajJXclmHoNeMrqvKqloJG7aY0Ij513xAjG9BIz2K6jPO4WQO34sZLD09Vkfn/+R+rLLXH5hjJMZSYlHbBx8wYHUUWNZsxzUCTAOAC9kC2auqaE7FemIMoN2rQBL5I2ch5KHTBW3IWdWiO0IOzCyjoAKnTIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=czS7B6fi; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDC9FC000D;
	Tue, 18 Jun 2024 07:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718696564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4utpiHnDm/jDD4wV/QlDCBTVNuIjZ+gRdkVJTonl0VY=;
	b=czS7B6fib5UddaVPgCtk7cPfCHlvNKhF9bOjqgYkr2arubCarLH28ySfWd81HMFudSJoSw
	FqFBZ7R6ypliWNrou3RqItbRYrl3j53W+cZQ6mCJ2+iSG+GQJ2Z67mJy0TT35hhjOQ8KA2
	bclBQOg22YOnRjgBgjKdpJgk7UiTR3M4/mIuyHuP0IpB8y72DgTS9kuKj7eiBSoloITCcR
	6yj5kCbF7Mt8Bd5CeVl6Zuf0XHMDjAK64Nsyooz0G/6sm5/mdDgLIVhqoQLL54Mg0dFBlL
	WxHDqVYE0XuFuecRcefFNP8RCKvEf8ARiC98XC5J/SLwQS6YxWGhJ4+myU+XMw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v3 0/3] Add I2C support on TH1520
Date: Tue, 18 Jun 2024 09:42:37 +0200
Message-Id: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG06cWYC/2XMQQ6CMBCF4auQrq1ppy0QV97DsKDTIpMoJS0hG
 sLdLeiGuHwv+b+FJR/JJ3YpFhb9TInCkIc6FQz7drh7Ti5vBgK00GA4AfKplwYE71Chl21tdQU
 sB2P0Hb127Nbk3VOaQnzv9gzb+2WMPDAzcMGtNdJBXRkt6qsNYXrQcMbw3NxfVP1FTpXaSWUQs
 TxEzbquHzWogmbbAAAA
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Drew Fustini <dfustini@tenstorrent.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: thomas.bonnefille@bootlin.com

This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
and a default configuration for the BeagleV-Ahead. It appears that the
TH1520 I2C is already supported in the upstream kernel through the
Synopsis Designware I2C adapter driver.

This patch depends on the clock patch from Drew Fustini
Link: https://lore.kernel.org/linux-riscv/20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com
and the pinctrl patch from Emil Renner Berthing
Link: https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com

Changed from v1:
1. Remove redundant example for Synopsis DesignWare-I2C bindings
2. Remove Node Ordering commit as it has already been taken
3. Remove EEPROM label
4. Rebase on pinctrl and clock driver patches
5. Add pinctrl configuration
6. Replaced the fixed-clock with a correct configuration

Changed from v2:
1. Reorder nodes to conserve ascending register node ordering
2. Add support for I2C2 as it probably use the same controller
3. Format comments to match kernel coding style
4. Reorder nodes to conserve alphabetical node ordering
6. Declare I2C2
6. Set pinctrl pull-up resistor to the highest value

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Thomas Bonnefille (3):
      dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
      riscv: dts: thead: Add TH1520 I2C nodes
      riscv: dts: thead: Enable I2C on the BeagleV-Ahead

 .../bindings/i2c/snps,designware-i2c.yaml          |  4 ++
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 84 ++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 60 ++++++++++++++++
 3 files changed, 148 insertions(+)
---
base-commit: c7cdaf7e82015e7037131381bec6ba4b2b1eface
change-id: 20240425-i2c-th1520-fc3ce1a8b472

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


