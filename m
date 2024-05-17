Return-Path: <linux-i2c+bounces-3549-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 036668C8306
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 11:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEDD51F22E70
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 09:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498E91DDDB;
	Fri, 17 May 2024 09:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z3XVq7HT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33541EB26;
	Fri, 17 May 2024 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715937023; cv=none; b=V5LYY2u3rCLUGvZB7p9vIe07xbp57IvujZlk8ZG4V5K0p0M5QA1G/0WYDqjkXV8LEv08RV4gmsX2p67RGYEY4Ay2Bq+iTVqQ+YW3TdEpBONZ/I2Y1GCv6kNFF7XJ0oL5wxoQ+yUz+TjhpHXx16btiHpToHXmYz9xJSlom0SfBNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715937023; c=relaxed/simple;
	bh=BMycXKMVC3HpLwk8KGm1ckRBUv6vbXZF1bf3OI+h9x0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ubj3HNy/Kwwsmg+b/qsgOzoQt0z79rYyQ13UksqNBjzb+UEMWRV8eBLaRJSZPs1JzAdw+yqOww6uUFQiJoMix2C2G91wAtCLzVUiGQGVtYcIX2xOvwbeiPsitIjIomhItuTW4/ZzdgJNeaCUFHwAlLwYt/KBudXPWDtnjxu6Dfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z3XVq7HT; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A19320003;
	Fri, 17 May 2024 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715937013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E9YI5IhJQd+9CPiNZ2Juj0hyKn1eM6koEnskZ7nXuGk=;
	b=Z3XVq7HTZDQDQNn5t+fzpekKxhSYeQR0NMJsT0E7v0NazyG3Hhd6Ij3FodPhpxYXezfIJR
	2iP1ZwBWYEj0iyUI8ijZEwnm48MU51UBF03xMCZoYiUDom7zrRfo1hVhg5btwgXAtzgOhI
	pmN/L9ci8XIRqwztOOBo8FPD9KAh0SSVD8rK6Nx83JFtMi4WwT1BPClN9Ns8R3uxdmfVG+
	X3o+kD1tMz9+rUJuLHDj7wDntCwSCawoO0D58y5bLO4+5lUT/mj40cIaUkmxMke2JovFD+
	G8vxkgmp4Wo1KEBaFpH+hY33JP/IK31HHo6WnSDonQ7Us7wvzslv4xCJG3adXw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v2 0/3] Add I2C support on TH1520
Date: Fri, 17 May 2024 11:09:52 +0200
Message-Id: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOAeR2YC/1XMQQ7CIBCF4as0sxYDI6TElfcwXRRKZRIFA4RoG
 u4u1pXL/yXv2yC7RC7DedgguUqZYuiBhwGsn8PNMVp6A3KUXKJihJYVLxRyttqTdWLWRo4I/fB
 MbqXXjl2n3p5yiem92xW/649R4o+pyDgzRokF9agk1xcTY7lTONr4gKm19gGCJDUwpgAAAA==
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Drew Fustini <dfustini@tenstorrent.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: thomas.bonnefille@bootlin.com

This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
and a default configuration for the BeagleV-Ahead. It appears that the
TH1520 I2C is already supported in the upstream kernel through the
Synopsis Designware I2C adapter driver.

This patch depends on the clock patch from Drew Fustini
Link: https://lore.kernel.org/linux-riscv/20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com
and the pinctrl patch from Emil Renner Berthing
Link: https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com

Changed from v1:
1. Remove redundant example for Synopsis DesignWare-I2C bindings
2. Remove Node Ordering commit as it has already been taken
3. Remove EEPROM label
4. Rebase on pinctrl and clock driver patches
5. Add pinctrl configuration
6. Replaced the fixed-clock with a correct configuration

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Thomas Bonnefille (3):
      dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
      riscv: dts: thead: Add TH1520 I2C nodes
      riscv: dts: thead: Enable I2C on the BeagleV-Ahead

 .../bindings/i2c/snps,designware-i2c.yaml          |  4 ++
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 84 ++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 50 +++++++++++++
 3 files changed, 138 insertions(+)
---
base-commit: e1fb0b71c746f863fa49ff359d58c949538ce181
change-id: 20240425-i2c-th1520-fc3ce1a8b472

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


