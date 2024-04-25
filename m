Return-Path: <linux-i2c+bounces-3129-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DDC8B1CBF
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 10:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDD821F22D5C
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 08:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332C377F30;
	Thu, 25 Apr 2024 08:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Mm5bY+mY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147236EB5C;
	Thu, 25 Apr 2024 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714033386; cv=none; b=NG3rDuG+DtPWcv76BAwU+kukhZj/ORvpxAyKqzLvxO19nJl5L8kg/CSSsjsLQ0N381zae9MKikNClGyU2tzjcStp0TUC854wccFcIhWfQKmI2JBMu+yK+x/k14nzrhgq8kG+26SmGOpIboqDMJzwoM7limHjzex9q/5ejHd/LAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714033386; c=relaxed/simple;
	bh=cBCpgUndVVrBZVD6f8j9WcVumw+qggIlKyjAqvvaLA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taG3HkqggCYsOzfDWtOsLy06LFy48k5NVH3y0bRxTdjCxjow9z11AtVjVtzI3J1rkpq63T7uNhNFSm+uAz/zdcllRRL0huV8a0hCfDz53Ro9QidCwKpMUOEtiNqSQYrec15GruYrBmVWPttWfv+Kg78wLWvU9V/JFaIhDdZ7A6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Mm5bY+mY; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DE9320012;
	Thu, 25 Apr 2024 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714033382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=icna0IUdSFum6K8F2ACUEdkZDLuL3oJCWinvPVNIlGM=;
	b=Mm5bY+mYxEpPYaFUZxUQnzVgxAscPIGTsiL+tv6u5/LjrBpVXauu/Cqf9LxrFLUawurJRo
	PSVBB26PfEMo4VzgnPdCFoJKCYTjAzEy8ryrENoNqd4nz4FKTukt1jUNvx/vBpG6r9UUlR
	TWsu3oqEvpkdr/dIdRzr5uCzV3XP4u4ckNsML6Rhwl3l0DwUoTRWG3M8lEwYLv3N2r5xDw
	vDFCzZdAGeoa6KV6FyhJJWeKtwouMMUgdxwz8y0DQgWCXgDDRrxOboqIaYjsVkWjguvPMk
	BfUI1S0n7uc+F/GQchsxykIzfyX/aFFQuS7j+IDL8y5qxe9y9xL0cl6STchysA==
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
Subject: [PATCH 2/4] riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
Date: Thu, 25 Apr 2024 10:21:33 +0200
Message-ID: <20240425082138.374445-3-thomas.bonnefille@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.bonnefille@bootlin.com

According to the device tree coding style, nodes shall be ordered by
unit address in ascending order.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 54 +++++++++++++--------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 8b915e206f3a..d2fa25839012 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -193,6 +193,33 @@ uart0: serial@ffe7014000 {
 			status = "disabled";
 		};
 
+		emmc: mmc@ffe7080000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7080000 0x0 0x10000>;
+			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
+		sdio0: mmc@ffe7090000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7090000 0x0 0x10000>;
+			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
+		sdio1: mmc@ffe70a0000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe70a0000 0x0 0x10000>;
+			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
 		uart1: serial@ffe7f00000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xe7f00000 0x0 0x100>;
@@ -311,33 +338,6 @@ dmac0: dma-controller@ffefc00000 {
 			status = "disabled";
 		};
 
-		emmc: mmc@ffe7080000 {
-			compatible = "thead,th1520-dwcmshc";
-			reg = <0xff 0xe7080000 0x0 0x10000>;
-			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
-			clock-names = "core";
-			status = "disabled";
-		};
-
-		sdio0: mmc@ffe7090000 {
-			compatible = "thead,th1520-dwcmshc";
-			reg = <0xff 0xe7090000 0x0 0x10000>;
-			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
-			clock-names = "core";
-			status = "disabled";
-		};
-
-		sdio1: mmc@ffe70a0000 {
-			compatible = "thead,th1520-dwcmshc";
-			reg = <0xff 0xe70a0000 0x0 0x10000>;
-			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
-			clock-names = "core";
-			status = "disabled";
-		};
-
 		timer0: timer@ffefc32000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32000 0x0 0x14>;
-- 
2.44.0


