Return-Path: <linux-i2c+bounces-2071-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD35186D1C0
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 19:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 610FDB276AE
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 18:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25777144020;
	Thu, 29 Feb 2024 18:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OxNpja0W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B7013C9C1;
	Thu, 29 Feb 2024 18:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230266; cv=none; b=Khw4zmJd3mcdq0iR3ItzVMLRk84/PJ7I1FdE+d7CUHTZjOQTxC5Z5mh8TdhXMG+g3Xl2yjKnEDe2j7hjmEaXfPs7m3stDnPVyuV2EC302UrMqaKzBB0TREt5DFuyUxppS/ETAbQbBsq+WyjNZcx5Dfc456PrDr/sxaCk+fmXa84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230266; c=relaxed/simple;
	bh=beNNWZWSrJE7GqDW+4dcT8kkvM4896Zbl9KYnJOPyAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fpdWaXW6Y/YvK0BQYZjr4j1W1UgtuB8LD61yseHEigueo0KG22eM9bxGPf8Zgojt3NJ5EjrAkdsROq06d4nlHlZvm7pqUr5k9pADFA64SvP/fSpGO1HL+g2BZ4flfvliMlKZweANltlGzeqhqN6PbIUv6dY2O/tjXNAIN8P8kSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OxNpja0W; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E026E60005;
	Thu, 29 Feb 2024 18:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709230260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lJoJoJ/T1Ez18OXeBVDjKkz5hGkL4PNC6PSUz+XXulg=;
	b=OxNpja0WwRYjhsIpQfZ4oi6nfrh+TRjhcuxJsniSAGZwewbzWtVStOzffyMYndXFNsUjHL
	GKe1b8SnDOvYmXmv25fH8OfCYkPeWKxfQ8e9gg06NMcf6ciycGM50uBTZ7Wfx6TRc/KICY
	4+31ANh/XNfPTiuk/2vvA7pg+XEcwriUpwhIm91/clgfbqqdOjU2oekcYs0ovetvKyXWLI
	DBkbRbBVfln18JkVqMxi+AwxqnGs5GfW/UZ24U60Z/3H4LioAzEzOfesT7hmoVP8wAJPQL
	VArazrDY8/aWWiiMMShQhVFLNRF+J+dGXrIRbVlayrJwpdeJ2XprbMrpNwWVAw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 29 Feb 2024 19:10:59 +0100
Subject: [PATCH v2 11/11] MIPS: mobileye: eyeq5: add evaluation board I2C
 temp sensor
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-mbly-i2c-v2-11-b32ed18c098c@bootlin.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
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
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

Declare the temperature sensor on I2C bus 2. Its label is the schematics
identifier.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
index 6898b2d8267d..9fc1a1b0a81b 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
+++ b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
@@ -21,3 +21,11 @@ memory@0 {
 		      <0x8 0x02000000 0x0 0x7E000000>;
 	};
 };
+
+&i2c2 {
+	temperature-sensor@48 {
+		compatible = "ti,tmp112";
+		reg = <0x48>;
+		label = "U60";
+	};
+};

-- 
2.44.0


