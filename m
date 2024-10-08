Return-Path: <linux-i2c+bounces-7268-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D29994570
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 12:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D817286ED1
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 10:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E711C2420;
	Tue,  8 Oct 2024 10:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gysUT255"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6931C1AAE;
	Tue,  8 Oct 2024 10:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728383393; cv=none; b=D4wgrWuoqoVSy8JDiTGkJBACRyJIkFS1k/zOKBdp6cvG0fUGG5EGHZJSBAksZgE6f6ABP1ElCVAkyd8TAVDiZi5HOiSXUSgDouiIuWa8K1VTaQZHeBHJeCefUX8gdWBH37RKiIfoGYXs1Yii85Kt13zyD+dn52yKwOXARoo4RJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728383393; c=relaxed/simple;
	bh=E8U5ywKHA7RII0hZ6fp0xnBM2/duucRWxOJaacJLjjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l026RscLRbiRZk4wG+kiBgTj1TT3h0cZueW2ql2nQyMV6YVZHtiiCWdPFv7gl6RNOgewpCDnZyAPwIKxpwUlRjYuyElPKTiX+EYpI3wPKBVrSkec0bnk+4IuJaHl/ZijewFpvP1+6k8TgefXfOiEHORQ3W8vu015Spn1sYdY328=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gysUT255; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A543E0009;
	Tue,  8 Oct 2024 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728383383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TR8qB9Wj3SH6OZiX7hyLNJZLZAv2j1QAmz9eBH+4ZT0=;
	b=gysUT255hTlgRdYTsqiTXxRtEKvdsAtbZDl+JUWBOYfD0+i+syghFsYTHB9P9Pz9pkrseg
	PRYZQCA1qHF0Q/Pz+ntU8HcLSq2itFv+bdK5Yhec9qkpbKNKzU6WZUQ6TVoPabX/gqekzK
	be1BwZo1g+/SM8QSFocOA5EpcB+sokifUCNG6Dn1DOoW98A9YYtDO4hKGA1Axb6wZaKJWG
	hRyyMjyjjZSE9J2nIb8igUfXujQ+dB/BaJFlrwhv6qiqq9FRqwIgTxyLyfeSAXherYPTdU
	w4mXnv9ctMW4C+3HJs+Yi8pWdzKYPhYTKFZIZqkSl+XR/MXcOqnr+LmY265I+g==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 08 Oct 2024 12:29:40 +0200
Subject: [PATCH 1/4] dt-bindings: i2c: nomadik: add mobileye,eyeq6h-i2c
 bindings
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241008-mbly-i2c-v1-1-a06c1317a2f7@bootlin.com>
References: <20241008-mbly-i2c-v1-0-a06c1317a2f7@bootlin.com>
In-Reply-To: <20241008-mbly-i2c-v1-0-a06c1317a2f7@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

After EyeQ5, it is time for Mobileye EyeQ6H to reuse the Nomadik I2C
controller. Add a specific compatible because its HW integration is
slightly different from EyeQ5.

Do NOT add an example as it looks like EyeQ5 from a DT standpoint
(without the mobileye,olb property).

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
index 44c54b162bb10741ec7aac70d165403c28176eba..72ecb6efa733f7878bd807df277bfc13153bf71e 100644
--- a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
@@ -22,6 +22,7 @@ select:
         enum:
           - st,nomadik-i2c
           - mobileye,eyeq5-i2c
+          - mobileye,eyeq6h-i2c
   required:
     - compatible
 
@@ -38,6 +39,9 @@ properties:
       - items:
           - const: mobileye,eyeq5-i2c
           - const: arm,primecell
+      - items:
+          - const: mobileye,eyeq6h-i2c
+          - const: arm,primecell
 
   reg:
     maxItems: 1
@@ -54,7 +58,7 @@ properties:
       - items:
           - const: mclk
           - const: apb_pclk
-      # Clock name in DB8500 or EyeQ5
+      # Clock name in DB8500 or EyeQ
       - items:
           - const: i2cclk
           - const: apb_pclk

-- 
2.46.2


