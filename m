Return-Path: <linux-i2c+bounces-5844-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CAA962B93
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 17:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 343121F22BBE
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 15:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCBD1A76A7;
	Wed, 28 Aug 2024 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GA6TBWRw";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="b6xZ/aVM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from a7-44.smtp-out.eu-west-1.amazonses.com (a7-44.smtp-out.eu-west-1.amazonses.com [54.240.7.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725151A707A;
	Wed, 28 Aug 2024 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857869; cv=none; b=Q6Mk3eEsFVwwoffSV5bd6MpG3zvOYIOJtCp7HxGCTMmHtX9HMYJmiYLtHDRN4y/XEJ4eNQqF5CMLXPJWKMStlMxitiGxi5ca8o8ERhxgBVc1OghNKwN+uyw0CWvXxYo600nkug0d+TMwwXS1fkUofoYxtssQqT73ro1JJRLMo0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857869; c=relaxed/simple;
	bh=l4Gpo7LOU8NlLxSl1iKgM/8EeAwhluE9ALPDPnDi79g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NFJNC7pzhMmknV3+MUC9Dl41JKbHExsLQ7QB1nNp/kUEsfFhM6ilCkm37UnP26TiridgmqDTQCRNBN9+6XANV3wr3whLmYVUyJsZlyZYZOw051XkmN0hlgZ+ph9L2XPrXr5AC5j0VX/qx9FZuYKb++9c/jaJ90NlqlxYDSz3Gdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GA6TBWRw; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=b6xZ/aVM; arc=none smtp.client-ip=54.240.7.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724857865;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=l4Gpo7LOU8NlLxSl1iKgM/8EeAwhluE9ALPDPnDi79g=;
	b=GA6TBWRw06IFuPhTxtbmqf6iKNkM08X1qtJ27TlMlHP3wgTzYxhKh5XIEAKZOPyU
	kemH3ebYiJ/Ld8pp+Q2tDs/eWvivAOS23mm6jzdEVE0UqdKNa3Ng3PZ/wU3CzR5wzRp
	WoTqlcm0KyFAZ6PWzi9VIlsBnCfIIguwuIcQJa4gzTrFdnmlIGSiRDKXnOV33T0eNqP
	3apGrHnbRWs+V06bQPPCYYBD1ctT9z1mdUW7jSrADAWxiYXPjkMsMbzB0FrAgooUXbY
	vXKcO9zwUv8Dy1gGKIpTZh11QGunV/cAhsUmVzaVbzSndODjrRuLybPm7e8bRoa1ShO
	BCGHdYjX8g==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724857865;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=l4Gpo7LOU8NlLxSl1iKgM/8EeAwhluE9ALPDPnDi79g=;
	b=b6xZ/aVMadwXjO8u3Vvj5b0db70vGdBiQoYfwhld9IazeEAth2NHQPf/Uumuk/wz
	eKhxlho83fm/aPY/qw5bA5/7JLZq4znus/SEpAAxqezu8WV6HYGlesI0ec27PrUNf/u
	+Xwz1Gy6pTKs9XjAGybQJHO0QcmsqMH4rFIp06Mc=
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, 
	Chris Morgan <macromorgan@hotmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>, 
	Chukun Pan <amadeus@jmu.edu.cn>, 
	Muhammed Efe Cetin <efectn@protonmail.com>, 
	Andy Yan <andyshrk@163.com>, Jagan Teki <jagan@edgeble.ai>, 
	Dragan Simic <dsimic@manjaro.org>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Ondrej Jirman <megi@xff.cz>, Jimmy Hon <honyuenkwun@gmail.com>, 
	Elon Zhang <zhangzj@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, 
	Liang Chen <cl@rock-chips.com>, 
	Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@collabora.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 06/11] dt-bindings: mmc: Add support for rk3576 eMMC
Date: Wed, 28 Aug 2024 15:11:05 +0000
Message-ID: <01020191998a55a9-697c3a2c-237e-49bb-b3dd-45762198d74f-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240828151028.41255-1-detlev.casanova@collabora.com>
References: <20240828151028.41255-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.28-54.240.7.44

The device is compatible with rk3588, so add an entry for the 2
compatibles together.

The rk3576 device has a power-domain that needs to be on for the eMMC to
be used. Add it as a requirement.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      | 38 +++++++++++++------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index 4d3031d9965f..aff8106ec361 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -10,18 +10,19 @@ maintainers:
   - Ulf Hansson <ulf.hansson@linaro.org>
   - Jisheng Zhang <Jisheng.Zhang@synaptics.com>
 
-allOf:
-  - $ref: mmc-controller.yaml#
-
 properties:
   compatible:
-    enum:
-      - rockchip,rk3568-dwcmshc
-      - rockchip,rk3588-dwcmshc
-      - snps,dwcmshc-sdhci
-      - sophgo,cv1800b-dwcmshc
-      - sophgo,sg2002-dwcmshc
-      - thead,th1520-dwcmshc
+    oneOf:
+      - items:
+          - const: rockchip,rk3576-dwcmshc
+          - const: rockchip,rk3588-dwcmshc
+      - enum:
+          - rockchip,rk3568-dwcmshc
+          - rockchip,rk3588-dwcmshc
+          - snps,dwcmshc-sdhci
+          - sophgo,cv1800b-dwcmshc
+          - sophgo,sg2002-dwcmshc
+          - thead,th1520-dwcmshc
 
   reg:
     maxItems: 1
@@ -38,7 +39,6 @@ properties:
       - description: block clock for rockchip specified
       - description: timer clock for rockchip specified
 
-
   clock-names:
     minItems: 1
     items:
@@ -48,6 +48,9 @@ properties:
       - const: block
       - const: timer
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 5
 
@@ -63,7 +66,6 @@ properties:
     description: Specify the number of delay for tx sampling.
     $ref: /schemas/types.yaml#/definitions/uint8
 
-
 required:
   - compatible
   - reg
@@ -71,6 +73,18 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: mmc-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3576-dwcmshc
+    then:
+      properties:
+        power-domains:
+          minItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.46.0


