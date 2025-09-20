Return-Path: <linux-i2c+bounces-13065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3892EB8CDD1
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Sep 2025 19:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93E821B21D5A
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Sep 2025 17:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFAB30ACFA;
	Sat, 20 Sep 2025 17:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="ba5PtmFj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0F42FFF89
	for <linux-i2c@vger.kernel.org>; Sat, 20 Sep 2025 17:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758389005; cv=none; b=ihNWZc3s384yZxYOPh4AOWtSv/QCfK3WqrMC1ohR3PT6+U8H60d+tC0pOEi4bYFSS3q9BIql+3mmZH5yc5TOvwWQPWatzLnUnFjwmQiy1TMI+hW++JF5wHDw9IMmRmUdSVimQ/LFLLlyqlgGVfJmvI+IWJfiy45sqQTLFiLd7ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758389005; c=relaxed/simple;
	bh=6/Bi9HXJdwmtXopWk4wjqbKq9IfI+RP10q7/G7trKjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iMMTZVhq6xMBIYU/8aj2lAhnYggDXHgSUUZ4Q04pPaFJrTcS3pzqMrH90nAvEKbR0P1l2dkLjMLWXRLFtqkH/dXiAdB7F2MOv/mrTeFOntC7EOiZtPGJsD+vxO/ZAmmu5206tveMDQnCI5VkmUX66upV0IcHYMDsVTIZCVxpG6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=ba5PtmFj; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=ba5PtmFjowsIaHfACEh+0dU237szl4KEjgtN+AEHH5yNE4yl8t6kGqtsqa0LpXSvC3Eo4uGU7y68CtTs9Oic7MoZHr8ByUS+46tQknWuPP9clbP37TKBhw76hpfxuVI752/+YXC8Ll1/qZYu7OqhayQVWQT9NCEaMAEVnjJ9PgiQGxbjKROBFBE5MvuvUklmQJRkWMjmhxXDVnXw+VvWkKmd9czttkTFKIgRphvTP+1LZIcgDOz5NqLdjmNv/V39qXrf3CV/heebpvs329wnoji6AY1HcmxTEJg5FmDRS4nML6WJVlL1+X2/dXItwFYJiGPAjnpjRshcbyXqPbQlrw==; s=purelymail1; d=purelymail.com; v=1; bh=6/Bi9HXJdwmtXopWk4wjqbKq9IfI+RP10q7/G7trKjE=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-i2c@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1392048781;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Sep 2025 17:23:04 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sat, 20 Sep 2025 19:22:52 +0200
Subject: [PATCH v2] dt-bindings: i2c: i2c-mt65xx: Document MediaTek MT6878
 I2C
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6878-i2c-bringup-v2-1-70a951f10be9@mentallysanemainliners.org>
X-B4-Tracking: v=1; b=H4sIAOvizmgC/32NQQ6CMBBFr0K6dkypUNCV9zAsSjuFSaCQKRIJ4
 e5WDuDyveS/v4uITBjFI9sF40qRppBAXTJhexM6BHKJhZKqlHclYVx0XdVAykLLFLr3DLqQrqh
 t67VuRRrOjJ4+Z/TVJO4pLhNv58ea/+zf3JqDBJeXqvLe3ayrniOGxQzDFk3A0VAYKCDH68Sda
 I7j+AIbBwCnxQAAAA==
X-Change-ID: 20250920-mt6878-i2c-bringup-640d48cbf66b
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758388982; l=1428;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=6/Bi9HXJdwmtXopWk4wjqbKq9IfI+RP10q7/G7trKjE=;
 b=vNonu+OGzG1QGA4lfkYdNlJVPkanBGWOsfd/gZnlyCoNtSvnYDZ3hMHmvgtL3a7KF4FMHt+Yt
 4v5m6V101nbBX7mQEFH98yis37DhzMY9NfRonqE8E/C5RphlUkKgbJK
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=

Document the I2C controllers found in the MediaTek MT6878 SoC, by adding
a new compatible string for the controllers. Their design is compatible
with the design from the MediaTek MT8188 SoC.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Changes in v2:
- Removed driver change, made the binding compatible with mt8188
- Link to v1: https://lore.kernel.org/r/20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 23fe8ff76645e440c19469999ae9a86b7fdabe68..bd6811cbde701ce0fd9baa002aea59d43f8af445 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -50,6 +50,10 @@ properties:
           - enum:
               - mediatek,mt6795-i2c
           - const: mediatek,mt8173-i2c
+      - items:
+          - enum:
+              - mediatek,mt6878-i2c
+          - const: mediatek,mt8188-i2c
       - items:
           - enum:
               - mediatek,mt6893-i2c

---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250920-mt6878-i2c-bringup-640d48cbf66b

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


