Return-Path: <linux-i2c+bounces-7304-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBF6996CFB
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 16:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 656011F24186
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 14:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8CD199EBB;
	Wed,  9 Oct 2024 14:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QOtzPyaq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EB119924D;
	Wed,  9 Oct 2024 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482472; cv=none; b=ku8O3/u9DO+MFYS4QpRLb4+H143na8TBwlDcbA/NXBWSp6ZTdhnKyxGwTp+MXJrLwd2K39HGkLdn7yW91Xt0FQ2VxzJdGyGx8OM1seATWj8EaWqoQvclA0TH1lUKQTha5cJGH9pEp4JQbCTFdg45HlMrQFGTcJNE4WzHjfAps2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482472; c=relaxed/simple;
	bh=5NTa9IDzSmGwLAEbnDA5FoBDhJmYbZiG/RmiM3fGt+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nqTbNo+kfEqrfR7Ej+m+ujESLqYlCtXzKZlAhq3uO6NKQyP7cU4ABjDegxpO4bNUK4/8j95mHdWVzTiIWe66vYjLZPEOdf7TaYEk/ZtKgSN8xxNgLmwi2Hg08AvaswxchdlYbux0etVfgePQK81sfsSxgi4vfGkphSRsXH9iSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QOtzPyaq; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C2371BF208;
	Wed,  9 Oct 2024 14:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728482468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GRl0oDUhVdNBfOFkIyXrQQ0mGfXjI5s9AX24o2wX49U=;
	b=QOtzPyaq8gmyrFlK2iT5M7O8TCY7xw5/mlTNjwLNHYwWaindmPyfdlXvXfVTbwgc8M6BoM
	2LjWcfhMFaR0DKrxRVJlRU8Exa24gkVD/3+YC4djPgqcsOztNrWOU18rgQoOzF111j3CQ6
	xTVbPijLsqb5Zwe4PIngdkHIue0OEJlmEPzowHoURhV+sS4m+ERtyYhwQlVqHYjuertucz
	L0exLmmfcBLzblvgO/Gda/qO4351PZoog7x/bvcRaTsRDBa0Uj7JprQe5XuCH6prDe0/Af
	wMmo4VpFsRgcXsBywq11AdnzywnSoaUxfIEIBxV06r5sv1yx05/8e6JxiSuvBQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 09 Oct 2024 16:01:07 +0200
Subject: [PATCH v3 1/6] dt-bindings: i2c: nomadik: add mobileye,eyeq6h-i2c
 bindings
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241009-mbly-i2c-v3-1-e7fd13bcf1c4@bootlin.com>
References: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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


