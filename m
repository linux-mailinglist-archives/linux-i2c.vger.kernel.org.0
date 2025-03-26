Return-Path: <linux-i2c+bounces-10045-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D93C7A72401
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 23:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C041B3AA7A2
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 22:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5BE1B5EA4;
	Wed, 26 Mar 2025 22:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WpahnDsE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB291B0421
	for <linux-i2c@vger.kernel.org>; Wed, 26 Mar 2025 22:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743028304; cv=none; b=n8yaxPrO/7pnz9J4fAbbDK8qsXMeDSWetWTPZEE4OJWwJVwWNAjdTl1CYVSDRwx/1oZ2oV5zTE1A8V+5mZI099UdaNsv6s832w8abn8Up9kP9FuRIa/jo6gx713yiwTYi6Blor7PvQ7hhisK/1gZZlgUsE/P2iYtmHfgMX/RDRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743028304; c=relaxed/simple;
	bh=UsfnaCbfHX0S6oDxk4pR3+seu3B0/AH8MOkOA8GiqOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RIeOo1tlyHey9lPYL0bNTiOu6dEMq4NfIWANTHdsdIW6QD0zKhItYTEK1yzhZVei8O6chd1pV6i5BVLR7E1LiQQaaSx5hJXRz2Qcn4FjYOIW/BjF0FoRI5U0Vqzcl8sNP92z9n/Ic+ckT6BVbcBtxlTsBDaSDAhR+gKrhapEATg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WpahnDsE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=j+vnap5KKUmLNy
	uj9wpVHMJmrsdxjxzBfUEJyBSA48o=; b=WpahnDsEeR1E0QhUxwXrqN1Af0cZTG
	jpEBktE6NtEIhC3RW68StoIZ5VeSKDe24wfP9r9/NhK2RYGwDswwwRF14aDzSyuv
	wTHxQL0YbRgabAAPWmKxnGURyxSZpnDB49oVavwVnZ07PiGYkaNikKbmsdici4R/
	3Pm7G6JvHzHXnFtHccd9qE3ChPxKWDeFylClgsU1l4ZIwo991LFzdu6ZCvZGrOVE
	ossM2UTtIBAriEZPJMNQsKE0pJR2yA/8vu3YDQK4cyhC+F1csFkGd6BHLwGoRPvd
	cC7+F7/y/DvUd58YysXtnP5mBFLgVuNpjPPTDUKY6tFzKtIBytY6X9UA==
Received: (qmail 3775632 invoked from network); 26 Mar 2025 23:31:39 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Mar 2025 23:31:39 +0100
X-UD-Smtp-Session: l3s3148p1@jkqcZkYxBK4ujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: i2c: snps,designware-i2c: describe Renesas RZ/N1D variant
Date: Wed, 26 Mar 2025 23:26:58 +0100
Message-ID: <20250326223123.11113-2-wsa+renesas@sang-engineering.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes since v1:
* added comments to clarify SoC & family relationship
* added Conor's ack (Thanks!)

 .../devicetree/bindings/i2c/snps,designware-i2c.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index e5d05263c45a..bc5d0fb5abfe 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -27,6 +27,11 @@ properties:
     oneOf:
       - description: Generic Synopsys DesignWare I2C controller
         const: snps,designware-i2c
+      - description: Renesas RZ/N1D I2C controller
+        items:
+          - const: renesas,r9a06g032-i2c  # RZ/N1D
+          - const: renesas,rzn1-i2c       # RZ/N1
+          - const: snps,designware-i2c
       - description: Microsemi Ocelot SoCs I2C controller
         items:
           - const: mscc,ocelot-i2c
-- 
2.47.2


