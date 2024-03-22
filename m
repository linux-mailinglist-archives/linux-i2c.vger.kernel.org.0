Return-Path: <linux-i2c+bounces-2488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC8A886CDE
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BB5F1F20F03
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C959C46BA6;
	Fri, 22 Mar 2024 13:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="G+7gbPHt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD2C46556
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711113997; cv=none; b=apEgw3ioroa7KGMtvrsBFIV6Sl8ZAOI/8VAxlrKpOR3UAMPrI4i8+EwjUgUgCW94sC2y9uTEq54BOVJ7+F+bkOQzE152ViIqpJyt1+kROaldMFz1JcP4YPR7xyf3FxzF7Z039Mx7Vt4HXV2mYkY903X/7TONE+87+I+jMQWG8Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711113997; c=relaxed/simple;
	bh=skQK1vYX5MdIVyVug6aQj4Xepi8MNgoG6FEMH1/6PNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGnwtMpubvqtgAsF8NsIqtK/jvBfEuxAFqwfzVJoHMOzHL5RkERAQHm3/U0tkOuVGY+3gkBeTEjqWVmy2pTLjfFA1gdDp74OasO5BCVQFaONP+K6JYLWkYji0V69S1Waf0Q0ekFDVwafZqwZpz1a/YcWa9zYwNEi3n818pgaNTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=G+7gbPHt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=fQ7D4wtgc9nYQIU+CodDHknOiR+ZSLkgQCzZWxbngEM=; b=G+7gbP
	HtBN9FeLl4rXGR7ncPaDtblFbpXa+4BwpZBioSrPdknOMoDWBquxS8o8kKqFmmNi
	t7aQbUo8Z/2rIZamGtw6dorp2cSZPhId5q/3Sr5L5kzFyQa/Sdr+vgYhRHLk9JKv
	acknJUXv2XarxhsOvj2HNR/eNQnMO1f+rTMq0zqdNB5F8TrG1zwn6My+RXhLPbvZ
	UquWX+bn3FeWFn991QQGZ2Rb4aWCjfXxyoyZbnYBYn99GwOR/VuVdKH+AlDU9qzm
	hm5BDL0vYosw5NsSShUC94kBhuuwu+puoCwORNF3Zb6Gbxf0NX/e9r3RM+TAYQeq
	Rru+95yUybBuYOog==
Received: (qmail 3870123 invoked from network); 22 Mar 2024 14:26:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:22 +0100
X-UD-Smtp-Session: l3s3148p1@wrwPxT8USJNehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/64] i2c: ali15x3: reword according to newest specification
Date: Fri, 22 Mar 2024 14:24:55 +0100
Message-ID: <20240322132619.6389-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-ali15x3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index d2fa30deb054..20d73b5e6f1f 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -39,7 +39,7 @@
     We make sure that the SMB is enabled. We leave the ACPI alone.
 
     This driver controls the SMB Host only.
-    The SMB Slave controller on the M15X3 is not enabled.
+    The SMB Target controller on the M15X3 is not enabled.
 
     This driver does not use interrupts.
 */
-- 
2.43.0


