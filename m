Return-Path: <linux-i2c+bounces-3131-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A238B1CC2
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 10:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08A06281F52
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 08:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23007E59F;
	Thu, 25 Apr 2024 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KkeEtjYO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A026EB5C;
	Thu, 25 Apr 2024 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714033389; cv=none; b=rIeHY+3lFS7SzWz9ANziW+yN/tNpHEpTD3UJ5RJ0PaeXyNg5/nKDfwdnUT23QVzhm1pC56CuF/1riLnuhp9foDonPNuJ1B6vPl5gDgR/l02q9AKWcN2yNcJs7qMIRs2m0hIGP0EMWbPPVDhbZ5xRy57SKbv0OzMn85poCVOmQ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714033389; c=relaxed/simple;
	bh=N5K587BhF7oc1galHAHeaEwwyTQwZIu3I7VRVeb2gGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6egg3vbZNJLK1KQs2Kwumazo0J4E7DeBZYmXA/pSc3Mtpz0dCJpom3N/C9TdsYy37DRASE/25TKbzSZBlGqvkhBi8CsvlrebM/U6P6+oFks18quHWTI95q5ZJyk53fyvnGdicVCq5HXXV5sz87TUl1Tb/GYHkUIpGxhBTcJp5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KkeEtjYO; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6AFDE20005;
	Thu, 25 Apr 2024 08:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714033386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VS9/5ruLFq4DMfVYGxtTV+BUOQfVMQF+Q0f1QDQmC0U=;
	b=KkeEtjYODUakoc8nH31gG21azCvWKfVcJ51beFKQ0O3NFBReBe3g23Vjrdi19RX/Hpbf5k
	bet4e3FBsfv/KR1BAmCT0jaZCh2J7dEfAMPFe5vMviskcL0vMkcWXgNO/ae0ExXvb/ooga
	sx3VKu3RxBo730Ct2e0+CPZ/ht41wX5R+PbPr/rYPvbQKnBT2mQNH8gqEwQQ+mpdm1DlnO
	4U511No+6h2E41dkxxaqEdCNLq+CY3zNajMHWS3D0+Qaxijd1Wax3Tyccjz4/qgD93r73H
	CNHqUJfv2kCUf5vQU/WuTDhMQ+mhGgEQXMhDwBegc9DyoU+vHM4xtuVK24xAVw==
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
Subject: [PATCH 4/4] riscv: dts: thead: Enable I2C on the BeagleV-Ahead
Date: Thu, 25 Apr 2024 10:21:35 +0200
Message-ID: <20240425082138.374445-5-thomas.bonnefille@bootlin.com>
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

This commit enables the I2C0 controller of the TH1520, together with
the FT24C32A EEPROM that is connected to it.
In addition, this commit also enables the I2C controllers I2C2, I2C4
and I2C5 as they are all three exposed on headers (P9 19 and 20 for I2C2,
P9 17 and 18 for I2C5 and MikroBus 7 and 5 for I2C4).

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index d9b4de9e4757..22a6935e7204 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -79,3 +79,25 @@ &sdio0 {
 &uart0 {
 	status = "okay";
 };
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
-- 
2.44.0


