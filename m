Return-Path: <linux-i2c+bounces-8518-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A557B9F2FF2
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 13:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B20E165A29
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 12:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED1E20468A;
	Mon, 16 Dec 2024 12:00:59 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604A0204587;
	Mon, 16 Dec 2024 12:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734350459; cv=none; b=QB4+fZZYMiz/rd40MtUK6GBxY1LtHSo90HPcFxB5b5LajQj7btDaOwRaA0ffjyOmo6xVLQ7/vQ4TJIflKpnIspxjYObfMIaH4JKQdi7JwZB3VTnnUk4GrWjgeL8BVTZr/e8pkXudmWsfXAiowcnL7WRbDCHW9cQy29sSNtsKQLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734350459; c=relaxed/simple;
	bh=alcQaDeSQjtYhz928YZ6besAJ0TsaBuYFdnOY8KjeqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPEWLLKhd82JRLHoSUYPoOxmGF6ANC2pSRwzbfwdmf3UCmhKI47D95xQq+GNGohL1AopBUUIcnYcaBWf483y2zHBaSVjOtr+PLDn8r8olBLoTUmIebm65cfxQF5r3c1zp1T2IGfqSyCg2ZF1J+6wAqK1MIUY7/BpiiClDAFy33E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: XTsvCvijQwqz8I7Z4TaJYw==
X-CSE-MsgGUID: gmMg7JYMRW6Ez4UtuhDFOg==
X-IronPort-AV: E=Sophos;i="6.12,238,1728918000"; 
   d="scan'208";a="231972098"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Dec 2024 21:00:55 +0900
Received: from localhost.localdomain (unknown [10.226.93.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9335D4271617;
	Mon, 16 Dec 2024 21:00:36 +0900 (JST)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/3] dt-bindings: i2c: renesas,riic: Document the R9A09G047 support
Date: Mon, 16 Dec 2024 12:00:23 +0000
Message-ID: <20241216120029.143944-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216120029.143944-1-biju.das.jz@bp.renesas.com>
References: <20241216120029.143944-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 505a8ec92266..830d5baa32c8 100644
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
-- 
2.43.0


