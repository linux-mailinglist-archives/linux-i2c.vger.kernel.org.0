Return-Path: <linux-i2c+bounces-11046-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0CFABC757
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 20:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F8DB1B642ED
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 18:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A232A1F8AC5;
	Mon, 19 May 2025 18:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Bwf/PkAu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8DC1E47CC
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 18:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747680345; cv=none; b=kuZwreGBNHgELgBgsrP2359SR2lQK/HWAw6uIXzorqzO0qMopMDD5Hne40hiNxf0wErI8qrl7r+q7a4DSqPIEj8mqWgZsYJh7x/LhXnylHan+VGq5LE9gtd1gxqERb1xErlbqv9/sroc2UJjm3nMGIcnVHCqdtyGrAF9PtuZG/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747680345; c=relaxed/simple;
	bh=rc4TcB9fAuJPgOLl/hIXpKc5FDXyHoHE5w2MY0eRZjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uf6/h4I+8vZWP5C9PVyb3IdPEYJYYOGbhmhgCW9Ha9oXhNvcYNTYB7K3q9TTqDwThTt6INxF6TBTh2vLZ9g4o4KRzsW2hMtrw4eRtrp4+l07It8xUjz2P1DGZzWLiuzopTfXZ8zZh5HVfryi9Oji9PfDMjzh26kbURBYWUqdUH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Bwf/PkAu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=yx9F1pCGq17wSH
	DJjq5xa5EWW2W0sel5lxcq/JtU370=; b=Bwf/PkAuN6k/Cx4+qr5spxtMdET022
	CNufdGGMh5P4VuQZIssxkZWN4eV/qn1LmRz6MytfOVfDwgkWWuIxQkbkMniK81Yu
	ya0kN/bsg9dPbdGd22+fJSAjsjoFOOLbl0ixAPOKTqf+Rk2qtOkbuvC6/j7Xacs7
	Ypqdarkwr/alclBC0rj3debCeuU/H5g0JJ7XNmWLa1W6nnLjA19YNGVzDSs5KSr9
	bDPTfNPd9rlKQAcrs0VZe9GRNs/qbFTymBNKh03HHWEWKQB6OpD1xN93F+F+PgPi
	3XHoFvgmlvK6I/vYJ46EWt4ZhM++XxSk4uBbJV5lRVetp/JWkyABaKIw==
Received: (qmail 2601724 invoked from network); 19 May 2025 20:45:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 20:45:37 +0200
X-UD-Smtp-Session: l3s3148p1@DpOaiYE1FsJZz6uL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: devicetree-spec@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH dt-schema] schemas: i2c: Allow '-' in 'i2c-.*' node names
Date: Mon, 19 May 2025 20:43:23 +0200
Message-ID: <20250519184530.21845-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When allowing extended i2c node names, the '-' character was not added
to the character class. Fixes the following error:

.../Kernel/linux/arch/arm/boot/dts/microchip/usb_a9g20.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
        from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#

Fixes: 647181a1f8ff ("schemas: i2c: Allow for 'i2c-.*' node names")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I don't know if it is possible to define a custom character class to
avoid similar problems in the future?

 dtschema/schemas/i2c/i2c-controller.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtschema/schemas/i2c/i2c-controller.yaml b/dtschema/schemas/i2c/i2c-controller.yaml
index 8488edd5ecc4..4abcf1a0ddcc 100644
--- a/dtschema/schemas/i2c/i2c-controller.yaml
+++ b/dtschema/schemas/i2c/i2c-controller.yaml
@@ -14,7 +14,7 @@ maintainers:
 
 properties:
   $nodename:
-    pattern: "^i2c(@.+|-[a-z0-9]+)?$"
+    pattern: "^i2c(@.+|-[a-z0-9\\-]+)?$"
 
   i2c-bus:
     type: object
-- 
2.47.2


