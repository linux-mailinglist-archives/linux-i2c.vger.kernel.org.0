Return-Path: <linux-i2c+bounces-13612-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED743BE98E3
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 17:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28AC46E7127
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 15:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143B833509B;
	Fri, 17 Oct 2025 15:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mChwSYc9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39D7335079
	for <linux-i2c@vger.kernel.org>; Fri, 17 Oct 2025 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760713321; cv=none; b=ieyNk7pzurSWunl/AvPSKYaeYq8vpcUr/q6IhvNnCQ1S5YCDtF2KM42xuH3PyWBqhMoeWs17pQCZ95RMhxx5hG3k2CLTLuXiZcYOzbOm5DL5YvbqGcOfKz5rn7hwHs2CTjGXvmcf8OYaWcCx4eHZnfiGVw2/YyRXqtr5Mw8N6jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760713321; c=relaxed/simple;
	bh=km2whxGPM+a/D+/1UgPRs/9McTNUFDiXbwc6UAdplZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FXrMdriuBmZr2gFW52g26THPSHr1R3amokVR9syFP4jyy3eIOqUIdsJPAIllqYOfB3m+rwQdk14s0hgBe4KaJuU9+dE7UXdtltLXOcagoEq/lpSOgpkLfKYRvGwM2azgq8b6JrodoML/jzXVIfxo8ajpymRZ3ODJRw37WkKmIdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mChwSYc9; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7FCB81A1484;
	Fri, 17 Oct 2025 15:01:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5544D606DB;
	Fri, 17 Oct 2025 15:01:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F092102F2363;
	Fri, 17 Oct 2025 17:01:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760713317; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xgi0RG1C3SH+AmnAQJ2k7QiHIPycUyOcGdZ0iSrESXc=;
	b=mChwSYc9H7qZSiAmz2nkjlcgyTAdD541xDc7UlvoOSHr25qKy8VumA5EYov6W3VLSxn/3u
	pJambaeKCoV6KqluJmLbM2Yd8ULaUg/nj+2JsMdSRMTFzEjBF6D34E8zn02ZupH0D7lOFs
	qk9Bza7TuBgc8Oyx38b4aRsUdI191D01Oufzvd1ZAY75T4+0vmZg7x6v50a3lSYaPn9Q1q
	dNStJszDEwxP/+bFrcYq6HNPY48WZFKJKp/SBi1RZwSPNw0LuxK/LTgQ60avuh2OBDBOcB
	YDbPLxGZBk++H5mwoczdpPAMlPU1I7tiLq14Xd5ZQG5raViU99NMRFAvzy6Cqw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 17 Oct 2025 16:59:32 +0200
Subject: [PATCH 1/3] dt-bindings: i2c: dw: Add Mobileye I2C controllers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251017-i2c-dw-v1-1-7b85b71c7a87@bootlin.com>
References: <20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com>
In-Reply-To: <20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Dmitry Guzman <dmitry.guzman@mobileye.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add compatible strings for the I2C controllers present in Mobileye
Eyeq6Lplus and EyeQ7H SoCs.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index d904191bb0c6e..6d63dc67f7bf0 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -36,6 +36,8 @@ properties:
         const: baikal,bt1-sys-i2c
       - items:
           - enum:
+              - mobileye,eyeq6lplus-i2c
+              - mobileye,eyeq7h-i2c
               - mscc,ocelot-i2c
               - sophgo,sg2044-i2c
               - thead,th1520-i2c

-- 
2.51.0


