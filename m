Return-Path: <linux-i2c+bounces-3127-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D888B1CBB
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 10:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 055FA1F22C42
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 08:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6A96EB68;
	Thu, 25 Apr 2024 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EJMEXnQK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A196A6EB5C;
	Thu, 25 Apr 2024 08:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714033379; cv=none; b=gCwGPDD7B7EVILN+i3Le1eD+5/+OrSypPTYOCvLKAicwqxKA1oRlv+itPLJZa43iQcFYZYWs8Vu4E4pMlhEx/w0dOohMJgQDmtozPGPdmB9iGNC9A7zqfc/DRvHeHD6pxD8uQdFFIvEGJQu1Pjxa1//EiDBzTsRFnpYUVN1lKDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714033379; c=relaxed/simple;
	bh=SC5dhArJMp08AR75DC4kH+qKbPEF9nR9+mT6/IyIGeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dJfiBofyG+F9Io9kZ58Ii2TmSdhkjdfw+s8sdK/P/MSGd/NgCsicjI+a1dCq0KrL8E6GQN4fDMTkKkgTZAtBy0fGb0AmiTCuZAieWfIr9vYnzVLfSY5ITnSonFGHgHv81JubmXkStV5SaqMvb1PTPUMULlBweH/sZ4do5aeh58c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EJMEXnQK; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5C3120009;
	Thu, 25 Apr 2024 08:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714033374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ua2r4iaJ4jH2x5xhCdB8EYqrV44YpWPYcR6DtftsZiY=;
	b=EJMEXnQKbA1ozjlJYHJ921LXaUfFUUhtrXxfDVodzrVKHmkTL/JIblbVe7iF5iKCg8vF+k
	0pPJ7Hpy0XLntZVM0XuZEAgHB/aovVLlq5am+yibMIOUAPyNSgZO0e1FHglmaIbHjsHfJU
	cjQaiGWr0oIk6z/AqKbrAoWnUFiBvbSjefU0GwfV41T8YlxnF309ITVJVYcqCAJSwG7RsA
	T5pnrxU38wL4RJftP2iJh4v1cQNJDU7iJajgP/vX7KmMUKY0+c2QjwhULr05SZSQcODkwB
	YMlpd71QP7uLEZ9gHCHz1s+tj+BSdu88iG56N7la9EW/PbysvE97C2crV2+7hA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
To: jszhang@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: miquel.raynal@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH 0/4] Add I2C support on TH1520
Date: Thu, 25 Apr 2024 10:21:31 +0200
Message-ID: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.bonnefille@bootlin.com

This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
and a default configuration for the BeagleV-Ahead. It appears that the
TH1520 I2C is already supported in the upstream kernel through the
Synopsis Designware I2C adapter driver.
As there is no clock driver for this board as of today, this patch
series uses a fixed-clock named i2c_ic_clk.
There is also no pinctrl driver yet so pinmux must be handled manually
for now.
It also fixes the order of the nodes in the device tree to comply with
device-tree coding-style.

Thomas Bonnefille (4):
  dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
  riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
  riscv: dts: thead: Add TH1520 I2C nodes
  riscv: dts: thead: Enable I2C on the BeagleV-Ahead

 .../bindings/i2c/snps,designware-i2c.yaml     |  12 ++
 .../boot/dts/thead/th1520-beaglev-ahead.dts   |  22 ++++
 arch/riscv/boot/dts/thead/th1520.dtsi         | 120 ++++++++++++++----
 3 files changed, 127 insertions(+), 27 deletions(-)

-- 
2.44.0


