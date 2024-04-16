Return-Path: <linux-i2c+bounces-2972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C648A6C7B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 15:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D4BD2812E3
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 13:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365A4131751;
	Tue, 16 Apr 2024 13:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UVoXazS6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79BF130E46;
	Tue, 16 Apr 2024 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274230; cv=none; b=AbPOu+ghU2mGrWe8xNQMbDnn7f15bCpzlRv9I3UvXnDgL6+SmksoKzl2H/ScNHH6eIl24dYH65HA88G3hhc33jo4tAWaYjypN+sZDgc9TxBrwGdz7V4dtRSAR/bcHcpLsjXVxunxaZUJvA50CsFilCDQqpLAx1fHGyZ+l4+2HmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274230; c=relaxed/simple;
	bh=aNY1BCk37hgomQWTjUsQ5l9jnB52GHjycJLv3+RRDtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QRZejzaymNJ6FHxdQX3u8Ce8zm6vTKCe1SMClT2SbkcIg8N5zQKTguniYTRgUKQjKG4AmqHJqr53orpPhwLfjNiLR2bQar47qWMV/XkOolZyNXhbmZFnlAl2IHreF/RZLs8fptaUD7PfiereXz1RLyk6C7/ahW/VFZHvedH3LLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UVoXazS6; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89DAA40007;
	Tue, 16 Apr 2024 13:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713274226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SOtYByFbOq/kD+SHjuSXQZVzJTtVnLBLPoL8nOih1ao=;
	b=UVoXazS64pUJ2dqd9Efwu8fZrPjLcY9GpSxAvev1gs9Hgos2iof1LFsA+ZhzfJE+UXyn0/
	+1Jvy5CC2vbg9ToO/ekDRTZVWDnrxnGFoWvtvLmfvnSkhJKkK8THhbvPswiWmF3XMfOag/
	MiMp9dhJb4gw0HVPYxA5f3b1Lu2rv2a39PVKsBcURzPKiOZp9MtAv+z5jZGOBZVJoH+vu0
	KoQxtte/MO2O/yqxhATTXLX3lVzuO4JBePHkrzgK9Ve7GQvB+8NXW/J5nL8cg3Pr/wgBiP
	tv8c+DseqNoXJmmMgeL06ksnSoRz0uK2zrpb+ecLqstSeZUurC0zxbOW4/nRhg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 16 Apr 2024 15:29:58 +0200
Subject: [PATCH v5 09/11] PCI: Add T_PERST_CLK_US macro
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v5-9-4b8c46711ded@bootlin.com>
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
 thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

"Power Sequencing and Reset Signal Timings" table (section 2.9.2) in PCI
EXPRESS CARD ELECTROMECHANICAL SPECIFICATION, REV. 5.1 indicates PERST#
should be deasserted after minimum of 100us once REFCLK is stable (symbol
T_PERST-CLK).

Add a macro so that PCIe controller drivers can use it.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pci/pci.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 17fed1846847..c47b1d3b5887 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -16,6 +16,9 @@
 /* Power stable to PERST# inactive from PCIe card Electromechanical Spec */
 #define PCIE_T_PVPERL_MS		100
 
+/* REFCLK stable before PERST# inactive from PCIe card Electromechanical Spec */
+#define PCIE_T_PERST_CLK_US		100
+
 /*
  * PCIe r6.0, sec 5.3.3.2.1 <PME Synchronization>
  * Recommends 1ms to 10ms timeout to check L2 ready.

-- 
2.39.2


