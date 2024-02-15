Return-Path: <linux-i2c+bounces-1762-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7478C856A5A
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 18:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86361B2536D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1489B13AA4D;
	Thu, 15 Feb 2024 16:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Puy0rwxW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6710F13A245;
	Thu, 15 Feb 2024 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015966; cv=none; b=PCwmYLHbQRdjLo2pIL7TV3NIueQI0MmZgCsEJ/8uHHkFr63/hJXDyAWOmqOXUbJ7V8PBXgaEsMQCmykcZv5s7jjzHIt1/MSSXq+mc8+W5spREaZZlYraoY/8POXj3a9M0mLaKiETH9yVJhVdEZnmweq2WCpp6SJH/dktrKwWlAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015966; c=relaxed/simple;
	bh=UvJih+xma5Rq5UrC8pGOHSo+fikaNT91p0IHc5YM7jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fOyVhhTZemAXwFId7x/eLtHh+6PVhrL/7vIi8mC0NmyuYJTJ2ZMuz/e77+0iTgzVD1rDPd+4XdlNRUZJa5LNCMQ9uOxmuECvh8B9hKx/Bicbdi+j1u4Za25YKJ2hRUS24t7eFQv7LMW9h6AGL+Qu3mcBMGceYlFlrxI/YtFKixA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Puy0rwxW; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA1E9E0015;
	Thu, 15 Feb 2024 16:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708015962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiFCwkZp1j+zGkHFn7RNrGArILflr3YrUZ1AXzVuNHk=;
	b=Puy0rwxWjmDTOBKb2sbGV5fyIc7/74RRKyfDEgEOtMZjdNSJQ2WyY1gl1DXzAwex5mPdl3
	QacCUNY23/JCxMcdT2UXKpoTV4B8dO9OsLu+CnNdAiOvBF8bqodVIf9f+1wIvDh+oZr/Lb
	3PVbqKj8FyTFPRN0sQW1MqBc443CBD8wy3gnce+N+g7kWWOvnUS5KVIUG+Cvmt7Dpp5Amk
	pOlISBbrivjhkjen8z7ieN07ncee27jTekI5xQSkYvkQlFXtF30ObTZnKhnqS/HlJ0UL2D
	tYa1JOjSwvUj2FaPQKG0S2AMA1PSTK5JPxcI/BjXz7G1oyYuTy0sF+km1tvdwA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 15 Feb 2024 17:52:20 +0100
Subject: [PATCH 13/13] MIPS: mobileye: eyeq5: add resets to I2C controllers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240215-mbly-i2c-v1-13-19a336e91dca@bootlin.com>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: theo.lebrun@bootlin.com

Add resets properties to each I2C controller. This depends on the
reset-eyeq5 platform reset controller driver.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index d27e164f0fc1..c0842836fcc8 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -80,6 +80,7 @@ i2c0: i2c@300000 {
 			#size-cells = <0>;
 			clocks = <&i2c_ser_clk>, <&i2c_clk>;
 			clock-names = "i2cclk", "apb_pclk";
+			resets = <&reset 0 13>;
 			mobileye,olb = <&olb>;
 			mobileye,id = <0>;
 		};
@@ -94,6 +95,7 @@ i2c1: i2c@400000 {
 			#size-cells = <0>;
 			clocks = <&i2c_ser_clk>, <&i2c_clk>;
 			clock-names = "i2cclk", "apb_pclk";
+			resets = <&reset 0 14>;
 			mobileye,olb = <&olb>;
 			mobileye,id = <1>;
 		};
@@ -108,6 +110,7 @@ i2c2: i2c@500000 {
 			#size-cells = <0>;
 			clocks = <&i2c_ser_clk>, <&i2c_clk>;
 			clock-names = "i2cclk", "apb_pclk";
+			resets = <&reset 0 15>;
 			mobileye,olb = <&olb>;
 			mobileye,id = <2>;
 		};
@@ -122,6 +125,7 @@ i2c3: i2c@600000 {
 			#size-cells = <0>;
 			clocks = <&i2c_ser_clk>, <&i2c_clk>;
 			clock-names = "i2cclk", "apb_pclk";
+			resets = <&reset 0 16>;
 			mobileye,olb = <&olb>;
 			mobileye,id = <3>;
 		};
@@ -136,6 +140,7 @@ i2c4: i2c@700000 {
 			#size-cells = <0>;
 			clocks = <&i2c_ser_clk>, <&i2c_clk>;
 			clock-names = "i2cclk", "apb_pclk";
+			resets = <&reset 0 17>;
 			mobileye,olb = <&olb>;
 			mobileye,id = <4>;
 		};

-- 
2.43.1


