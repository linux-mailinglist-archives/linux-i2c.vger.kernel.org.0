Return-Path: <linux-i2c+bounces-8551-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1969F3AB2
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 21:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E109188A170
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 20:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDD01D31AE;
	Mon, 16 Dec 2024 20:24:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B1013D29A;
	Mon, 16 Dec 2024 20:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734380694; cv=none; b=FCrwMX9/c2RS5AEvbhNVJM/NApzdfZE0KjT5VDVEvaRUqWfTHxxx0rh9pqo6JO1yyGQBkYTtMR8AkauDhm1Z93UicBckkXOSmj40f/xAOoZELOi7O9s3eWrgU8tViVCm4L5XXnl/QlJY2eFU/0CUjNVSZLcvSsUJKxE3apB4ZP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734380694; c=relaxed/simple;
	bh=mlGi/r81obWj/TRaQucpl5fGzMkCvypVEY2+bWlFkUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PQ1zSOf+xnuBB4Vlr1kr1V1a+dffilQPzSDU7iXxBzSO9leiGNJ2g2uvixVjlp5xf4tmck383/XmfJ+EGj5pwGD4CuZO1tGZo+cnDYxvUl/HA/3rXL8FQVqoUsQMwIUpa+EbkwnILPtnzfMdrcTfa2gEuTK53FbpdTaHDqUiTtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Gv0+BMkvQoGY8BkZus/oXg==
X-CSE-MsgGUID: CSy52wrqSUGPUrlQIEWKww==
X-IronPort-AV: E=Sophos;i="6.12,239,1728918000"; 
   d="scan'208";a="228015859"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Dec 2024 05:24:51 +0900
Received: from localhost.localdomain (unknown [10.226.93.40])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2EEDC4000C84;
	Tue, 17 Dec 2024 05:24:38 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] dt-bindings: i2c: renesas,riic: Document the R9A09G047 support
Date: Mon, 16 Dec 2024 20:24:34 +0000
Message-ID: <20241216202436.185773-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for the I2C Bus Interface (RIIC) found in the Renesas
RZ/G3E (R9A09G047) SoC. This IP is compatible with Renesas RZ/V2H
(R9A09G057) RIIC IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added Reset required property for riic-r9a09g057 compatible
   IPs
 * Collected tags.
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 505a8ec92266..1b7fed232642 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -26,7 +26,9 @@ properties:
           - const: renesas,riic-rz      # RZ/A or RZ/G2L
 
       - items:
-          - const: renesas,riic-r9a08g045   # RZ/G3S
+          - enum:
+              - renesas,riic-r9a08g045   # RZ/G3S
+              - renesas,riic-r9a09g047   # RZ/G3E
           - const: renesas,riic-r9a09g057   # RZ/V2H(P)
 
       - const: renesas,riic-r9a09g057   # RZ/V2H(P)
@@ -89,6 +91,7 @@ if:
           - renesas,riic-r9a07g043
           - renesas,riic-r9a07g044
           - renesas,riic-r9a07g054
+          - renesas,riic-r9a09g057
 then:
   required:
     - resets
-- 
2.43.0


