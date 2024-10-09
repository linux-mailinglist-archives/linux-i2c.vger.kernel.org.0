Return-Path: <linux-i2c+bounces-7286-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 903CE99671A
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 12:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D486286206
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 10:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFD218E744;
	Wed,  9 Oct 2024 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E/xAQ5Ml"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5570C15382F;
	Wed,  9 Oct 2024 10:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469419; cv=none; b=BoMAYfVLg5NEH/yBMMzLT7I024Up+3MiCuBhjtyb3aLuOIzLwzqrmvjcMyaSCy9tAs9xsoGIIYHwXQGJFqS1dab6GMUz9PUvLBYE5o1k3FK11C4U7oBqHXk2ShWlvSph9zf+ARsGPAjnUpMkigI2qNXWngkTIhvx7yA6z9fGL5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469419; c=relaxed/simple;
	bh=Gt3hGkoAzabIVH8zY4nDCI6BKaAN8fyT7T/ZIpE2M2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H21x4b5llD+mpYbw9u/GnKXMAwA/mHMaQcf30g3PrQqTd/CcPrLB2YO/HvOEZiDbPtB9BiXB/PmA91QKe8dsJk8LHndASqtEd2AeVPQoK27Gi/D/E5kFCuTju7X2ucUC9Wa0qwU//CrBnFqOQN3Vlml9ZvnKVYZDOvxY74o61XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E/xAQ5Ml; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C385C0009;
	Wed,  9 Oct 2024 10:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728469410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9JzFndJasV9hTE/+nDW57u4YoWhXSvTvpEanaE8uI/o=;
	b=E/xAQ5Ml1/q830mRWRzkPOZj5iMY+fVjN3OyBP7GZ4d6bao52g6idAuLIkYHbGFYpORGg0
	KybJI/ImVnVtaYG+qGKw4dpPpggcOkZ6AR+DwUShaQt1yD+H9e9qW+nPmpbhhvFyvJlq75
	xOUbgzePw/vQbCkPwgjWPAMk+VZTCJEsTBrXriO1p9eE6qMgfgYePZ9TnYo3miHoghT6bc
	eGEsbgMRl+A0rbb1SAba95bHkYWYoOEPFCdj8kZYXQnP1rwQ/AGatxW7aHYtrLQqj6w6ve
	TpBBDsSTc0iGVz8V7OsZZgwaeIGqD8X2YoFxkftI1sGyWfLGIEqqTZE2YcEsng==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 09 Oct 2024 12:23:27 +0200
Subject: [PATCH v2 1/6] dt-bindings: i2c: nomadik: add mobileye,eyeq6h-i2c
 bindings
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241009-mbly-i2c-v2-1-ac9230a8dac5@bootlin.com>
References: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com>
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
 Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
index 44c54b162bb10741ec7aac70d165403c28176eba..7e84465c20094b799697a71a66c66d144d621f46 100644
--- a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
@@ -22,6 +22,7 @@ select:
         enum:
           - st,nomadik-i2c
           - mobileye,eyeq5-i2c
+          - mobileye,eyeq6h-i2c
   required:
     - compatible
 
@@ -29,15 +30,15 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: st,nomadik-i2c
+          - enum:
+              - st,nomadik-i2c
+              - mobileye,eyeq5-i2c
+              - mobileye,eyeq6h-i2c
           - const: arm,primecell
       - items:
           - const: stericsson,db8500-i2c
           - const: st,nomadik-i2c
           - const: arm,primecell
-      - items:
-          - const: mobileye,eyeq5-i2c
-          - const: arm,primecell
 
   reg:
     maxItems: 1
@@ -54,7 +55,7 @@ properties:
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


