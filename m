Return-Path: <linux-i2c+bounces-10031-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8BBA71344
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 10:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7A40170370
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 09:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBE019D07A;
	Wed, 26 Mar 2025 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fz6JMQxa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F4B18C32C
	for <linux-i2c@vger.kernel.org>; Wed, 26 Mar 2025 09:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742979689; cv=none; b=brF9QK2L5tsZdO8KE3+hBh2TLK1kjnThWO914oeac9VJDXNo1kN3PC6QmUnVpqaPgdqMjNMrMqC7+cX9k826n9zc8E4j3xyxUse8HvTDXK2IKaJzo0FeibmMHc7DHdB+GqNRjPTuSOgwb8h5ttANpr4Hb5rZY7MhapRdYfxhpoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742979689; c=relaxed/simple;
	bh=eDD4g6HDiV1YtqTZs/PmIG8u9bFA/7yg2fvRvWMhuFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TYuqyx7Je13jNZRKAUBYztf9lUw+dv1rsEBhUbEFeLMAi7tVxqBWLOCEZ/exNuH+ioh89IKBzHggBbOHD1/paV9Cg9oegxEEBWUU4ffLg4XKhHHhBOtpoo4A61Jpkx+wuXJ+nGciXlZBCEDf6yU0YxBqwj7UwgdpKQhHjVico/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fz6JMQxa; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=+3xxi3QPwHftSA
	+CLkZ2grWAAGv0GGU4/4NfNwtpY4U=; b=fz6JMQxaxiKCr8BObpq0LXHBK+BGIA
	QsMN4RrBbT8aZG5bUJMFAHNhob/gCNcJE1t6Ax09bgbG5/odyd2fFo6Vm1nuWSgp
	1x2rgZ7YIs//N/JwnjCnCAphcS4yrki/WkXBJqsQl21JXJsZ0QWKEo1/S+J4f6aU
	LRZdGfPvpo+dikjRAaxC/qA4tygQZ2QLiE2vC9xF2AnYdNK+mjUDs8coCQ0A8HNY
	WkJSa5+FKhU4OuPn6lqoLJm1aJm4gl0HLYLjwHYU9q2/DUcuENihp9d1jpetttuw
	umKnYrjeXRl7KTIEfYC8Fr8FF5IIvavFYpB+Kgi5O1hw79FgJnjlJhcQ==
Received: (qmail 3490736 invoked from network); 26 Mar 2025 10:01:21 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Mar 2025 10:01:21 +0100
X-UD-Smtp-Session: l3s3148p1@hOS4FDsxiqkgAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: snps,designware-i2c: describe Renesas RZ/N1D variant
Date: Wed, 26 Mar 2025 09:59:12 +0100
Message-ID: <20250326090112.22495-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far, no differences are known, so it can fallback to the default
compatible.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

If everyone is OK with this patch, does anyone mind if I shortcut it
into the v6.15 mergewindow? It is just a documentation update and would
simplify upstreaming the I2C chain for this board. One dependency less.

 .../devicetree/bindings/i2c/snps,designware-i2c.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index e5d05263c45a..87eea87bdd52 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -27,6 +27,11 @@ properties:
     oneOf:
       - description: Generic Synopsys DesignWare I2C controller
         const: snps,designware-i2c
+      - description: Renesas RZ/N1D I2C controller
+        items:
+          - const: renesas,r9a06g032-i2c
+          - const: renesas,rzn1-i2c
+          - const: snps,designware-i2c
       - description: Microsemi Ocelot SoCs I2C controller
         items:
           - const: mscc,ocelot-i2c
-- 
2.47.2


