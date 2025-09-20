Return-Path: <linux-i2c+bounces-13062-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FDCB8CB7C
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Sep 2025 17:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D4D91BC28C9
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Sep 2025 15:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006AA219A7D;
	Sat, 20 Sep 2025 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="mgAenjro"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80CE15539A
	for <linux-i2c@vger.kernel.org>; Sat, 20 Sep 2025 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758382285; cv=none; b=Vh6lOSzYt9JKW8/GHwD4c8rQPehY2NEokWkwq45KrfbQx9WgrXtwQcNU8ZqWe0m4YdgZXtDIwutm7W56wa0zYOC0zo8PZ8qXcvI7+BHrKcOWjJ663UKoqA485ALpXArNxLt/uNAQQ4Z9t7jfO23s9nSkveEPOBRwF+wTtbgQelY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758382285; c=relaxed/simple;
	bh=RjfYDW3XL3WFS67dBPrYHYQD9w91q2A/xdKqO8p9qok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P4u5TMkyU+X4/ytoKwZpgF/YgvkD3GQru/bF1v871CgSgR5aw4dossKCMrltn0JWeY7VsUA9VuiLj35IEo8hU1IKfD8P94xAJXKCH9Qt45SZG1jHlDHzqAgDBYG0oSTTr4/yH8g50oiE6SjYKWetxdxX2M5qV1rcluQZr6MOa4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=mgAenjro; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=mgAenjroz9uQ51Qfl3SdJRi+P7U5GqtTYbXi+z8t5Fl++2IuxwyyiLvUXrbxZBKeSI1jRUSsugAvSmOmf1ObrQMpcw1MV6bW9+TmU1LO+2A1bV6dLBZsR3LJ93ZG5whCQ0bm6vAXfYXmVzzc5iQijTBuVWqSCrPJtwbV3PbQQFfIGlDSjz+BrBXNxHO3Cq47dfSomHDW+CEgEe6CaXGObPRIs+rSFzYB5EmyOPblEmziaq8+5g0RWZnMk0YK2rhrgbfShOAshz7qOD9A9D0EVUJUedu1BGpGGwK6bf3YBo9D8wh0QJpn6hm06gKdlqLB7Lk3KEKXMjAQZTueYAoXKw==; s=purelymail1; d=purelymail.com; v=1; bh=RjfYDW3XL3WFS67dBPrYHYQD9w91q2A/xdKqO8p9qok=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-i2c@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1935225507;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Sep 2025 15:31:11 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sat, 20 Sep 2025 17:31:03 +0200
Subject: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: Document MediaTek MT6878
 I2C
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6878-i2c-bringup-v1-1-d1527ffd3cd7@mentallysanemainliners.org>
References: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
In-Reply-To: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758382267; l=941;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=RjfYDW3XL3WFS67dBPrYHYQD9w91q2A/xdKqO8p9qok=;
 b=ZXan0Dlj6yTNyY363LasAgg5Y0RHz7OwnbUOCm3Byq5WFKaxXm00S9qCbRZrVl/Paa9hv89MK
 CNbcuNhTdhsBCpGXtEzZn85aH8gc9EYpxUj8lAbZoHjuwND1ynfmdiR
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=

Document the I2C controllers found in the MediaTek MT6878 SoC, by adding
a new compatible string for the controllers.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 23fe8ff76645e440c19469999ae9a86b7fdabe68..b0d7dd0dd8fdd7b0dba14d11f75c8f0b7ac15f58 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -22,6 +22,7 @@ properties:
       - const: mediatek,mt2712-i2c
       - const: mediatek,mt6577-i2c
       - const: mediatek,mt6589-i2c
+      - const: mediatek,mt6878-i2c
       - const: mediatek,mt7622-i2c
       - const: mediatek,mt7981-i2c
       - const: mediatek,mt7986-i2c

-- 
2.51.0


