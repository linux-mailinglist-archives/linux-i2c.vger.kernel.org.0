Return-Path: <linux-i2c+bounces-13003-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 835EFB7C5DE
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 13:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DE5918835E7
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 03:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401CE2FB607;
	Wed, 17 Sep 2025 03:38:50 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AB42FB09F;
	Wed, 17 Sep 2025 03:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758080330; cv=none; b=rj4zwnBb7MzPyyHJXeRWHKBkGZJlniOYCxt1N3KxxhzpO5t0vzSFejRVDUa5SvvXIBpv8vDwmEXWP3RFKFN1e8w44NbbgEql7uVsSwYsO59DIcHPKEhqdpM516Ko0WgLrcOzSxD3CawzuMqqj3aeY5RRGL2oaTlHmZgNA8neGWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758080330; c=relaxed/simple;
	bh=kCJWp3JQo7Ul2VLXlTTjnxcurS4jfdZsVWUeoxEaPHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aPPuEBXUwXUKW89vtulQRan+gvledwnh0zY1o0OF8NglPczkYoc2FtJIXQG/PEHT5TsobiyjkRQ/NgII9v8VcsS8XL9favuTY+dFvPv0ORGygnM7BwaYBQJLoCBIGFJFQB3+WSyFWhP2b9iR1pXMhNRPEhgcyx6RTNj9hr1JkvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A319A341455;
	Wed, 17 Sep 2025 03:38:42 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 17 Sep 2025 11:38:13 +0800
Subject: [PATCH] dt-bindings: i2c: spacemit: extend and validate all
 properties
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
X-B4-Tracking: v=1; b=H4sIACQtymgC/x3MTQqAIBBA4avErBtwhNK6SrQwHWuIflCIILp70
 vJbvPdA5iScoa8eSHxJlmMvoLoCv7h9ZpRQDFrpRnVkUBGuhKI9Zr/w5jC62BpqgpmshZKdiaP
 c/3IY3/cD7ZfnZ2IAAAA=
X-Change-ID: 20250917-01-k1-i2c-schema-faf6715d7b88
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, 
 Alex Elder <elder@riscstar.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=kCJWp3JQo7Ul2VLXlTTjnxcurS4jfdZsVWUeoxEaPHo=;
 b=kA0DAAoBMarqR1lNu+0ByyZiAGjKLT+jcVbQ9mbdO+pc6V7MsBoyymoCp7WSndSvDE1LSGBct
 okCkwQAAQoAfRYhBLW6uMnDG3EVZwIj3DGq6kdZTbvtBQJoyi0/XxSAAAAAAC4AKGlzc3Vlci1m
 cHJAbm90YXRpb25zLm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRCNUJBQjhDOUMzMUI3MTE1Njc
 wMjIzREMzMUFBRUE0NzU5NERCQkVEAAoJEDGq6kdZTbvtWmkP/1G7yZg775d2eLm6/NDSng5Lfk
 dnzQ0QplcxlL0ZOCEBOLadQmfSeEupPkxzV9BqFcDNbKtCedUGNAQLUB/KeqmPDo7uny4adSBhL
 66sudGMt7WjVxUXh2sC4h9p6skCD91iuOhEz4TS4eYJhWXF2R7pWieIf0I7qBfEAoMr755V7o3k
 e5DnNPoGlOQ53Fg0bPgA+teKfHQCn1bGiowidkboXFO5YLDJv7geWRoUEkj9hdSqE9Ry6A+ivVA
 q1fTN4GNogKmGRSIhlBVxZWg+MPMxW3SiSwYZh+ThMWefgMSowE6HLA5qP+EVkpOtul2Oj2vkHZ
 S2iIrbmC7/HHX2ty4WZNNSeoAC2YzZ951QsgAKsa3baME+gVYdKmHZClSfCbb/nxU6ttaM/TXHo
 EkffZcfv57vGmfIwT6Clj9zaW8EN1+8aWlO5M9e9khTfof4esde1wBBUkG6bvR46OS20AmSUGzT
 7i02riLBSwUy6eo8HCQ3qUg5FtTTnoSv288YUuYdyjkanc7mfN+SMpHYLUGtob5RG1ovSVH5wMl
 BNnlgGb7GsFCWmj8oPL2x8CBAdHn/7BXQw5fcoigfggX0AP/wPd+kpOCNpXK8jtnjJeHBHCCpBb
 1wKI0XYQz/je1IlIQndhnU2GiEScRHe77dkNqSpfPXfR6hLVT0t6z32sOM
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Extend the K1 I2C properties by including generic i2c-controller schema.
and this will enable it to do the DT validation check later.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: i2c@d401d800: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@41' were unexpected)

Link: https://lore.kernel.org/all/20250825172057.163883-6-elder@riscstar.com/ [1]
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index 3d6aefb0d0f185ba64e414ac7f5b96cd18659fd3..226c600deae142413277117e25baae09f0918381 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -9,6 +9,9 @@ title: I2C controller embedded in SpacemiT's K1 SoC
 maintainers:
   - Troy Mitchell <troymitchell988@gmail.com>
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
 properties:
   compatible:
     const: spacemit,k1-i2c

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250917-01-k1-i2c-schema-faf6715d7b88

Best regards,
-- 
Yixun Lan


