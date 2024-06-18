Return-Path: <linux-i2c+bounces-4072-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E657490C62E
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 12:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C318B22F56
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 10:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6622516B3BB;
	Tue, 18 Jun 2024 07:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eVJGNGIH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AEB13AD14;
	Tue, 18 Jun 2024 07:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718696570; cv=none; b=FVS+ZiLjZ1SsKRx5lwzecyLA64CFP+mhErS12d7H2CMswcB+8FCrGg25I5wYwU7EeeoCDh9WOdrvb8OVZvYo5gMoZlpLFrLZScBb49/VHyKvriyqnttYUVomhXDdwuElG8+K+EBYtH5Z+kYzoMr2G2a76QTPMWMA3w/uAbBJEG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718696570; c=relaxed/simple;
	bh=xSjKYdsckv1i9zPamJ4DQ/Bu/x2uK2Udr/zSq3LxiYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATLT/BkpOvZUtMzDjCy5f1wlrHfk+DTL2yIejxQY5HtcEWnl0cA5e7+dDE0xJ/gh58MsTi5A01bNYJ0wrfbdq26WYHFjpmkheF+3ZhGUHVzrzx5ipLiRZQbGptdftpNjgG9eGnGLTBb9awG2lvzr4oI+dUEA1O2BlrQ+iRvb/n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eVJGNGIH; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFFC2C000E;
	Tue, 18 Jun 2024 07:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718696566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qH0TLo/HOE8dSrccrpGSd7Xk4cZ6R5fApRIBhbaTVh4=;
	b=eVJGNGIHm/wAkcTIVwVaD5bTZnAMeCsF2erBGvqOZ8QpKKIE9U5wVZLfohj5MXMe4Pk5hG
	xvtyArETpp4JEzA//SGEvnBw9P9Ihqk4Vk0mreDYT/1NLUDUSsMiBLyHlReiZ6Sti0MPZO
	H7sI8t4Pnx9RR4WMwETxFXVcZAV2hkCKFa9g+NZuwaDjkzKcPaDL/XgEyVhxHa/1u8JERF
	AYnwf9cKJjs9TCxvOK/lNhFi4G8ZIkSgKTB3XQ22YzcSUbMH/biiojaSnJYxbIVQGcN9as
	XoVWZ8KhNxouyGaibO5qtj0di/SgcmjUMUlsViBKWrjCBmB5GdaSzm98gqEPaQ==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Tue, 18 Jun 2024 09:42:38 +0200
Subject: [PATCH v3 1/3] dt-bindings: i2c: dw: Document compatible
 thead,th1520-i2c
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-i2c-th1520-v3-1-3042590a16b1@bootlin.com>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
In-Reply-To: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
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

Add documentation for compatible string thead,th1520-i2c which can be
used specifically for the TH1520 SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index d9293c57f573..60035a787e5c 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -33,6 +33,10 @@ properties:
           - const: snps,designware-i2c
       - description: Baikal-T1 SoC System I2C controller
         const: baikal,bt1-sys-i2c
+      - description: T-HEAD TH1520 SoCs I2C controller
+        items:
+          - const: thead,th1520-i2c
+          - const: snps,designware-i2c
 
   reg:
     minItems: 1

-- 
2.45.2


