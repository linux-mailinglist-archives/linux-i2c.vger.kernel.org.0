Return-Path: <linux-i2c+bounces-2742-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50700896832
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 10:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAC50B28482
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 08:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B8682D75;
	Wed,  3 Apr 2024 08:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4jY7OjU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D81082C76;
	Wed,  3 Apr 2024 08:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712131691; cv=none; b=mHybvi4QBenUL9DfiAVEr3dZghyB1UxnWd1IDTSp6rC3iQyEMNbD3pzhCQkJlplzGyV90mYl2YXAM315giJRn1J5w4qTQtRcYG1PgKSLGzRKY33tV5qy5JqgI2I6fDpQjJvhOIZ7c8YyINxJmq4CRGXF9l8zWF5pUfiWGrA+bps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712131691; c=relaxed/simple;
	bh=nBMKcbCHM6WSePIKZgnN+NmyDRmfcmwdi7Q6UrA4R0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QJJAzcHhKYzW8yQ8XH/5nDD3mshVRG4eK6x4SilGQt02nS+uoGH5CDjtxC28y1/9zN0quCd8v+hg4X+vXfZ6NAtkCjO7cAtrWYfhNRgr11v8v73nE/Tk+BPhCXGcO9dFyH5dFs2y0YDfPy2ufbw+W62DbplzURy3VUKpHg61Yms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4jY7OjU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB065C433C7;
	Wed,  3 Apr 2024 08:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712131691;
	bh=nBMKcbCHM6WSePIKZgnN+NmyDRmfcmwdi7Q6UrA4R0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k4jY7OjUHYSY173pVi7rXHQ/+qCdzAB94GAS0OIudJs8w1C5MNgJM5F/DWrpAsXbr
	 +viQNaZ3Mx2NwGj2Gp9Udbo2+/Z6sdBJpSexHqFLT9J09VE/8sMJVROyWyfIjc4+0a
	 DY1wWn54ExMb1B2r49X2T0djEZAhQbkykDGH+9Oiqku4LJxDq8R9UnqPDw4ZvB/ImD
	 jmIq2XfMa0x+NRh57QyUE3qFSPP3T3NtiuG9u/em6ujBNDdR/VVQeWha5Ad+u49JdI
	 syuhZlrYyG5MgcWtiVnX+sHvxOOrO+9e1Qa9eRXW66OIaFRDCpCYklDjECafr6LVna
	 PDjNa9kHcKhsA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Holger Schurig <h.schurig@mn-solutions.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Wolfram Sang <wsa@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Yangtao Li <frank.li@vivo.com>,
	Robert Marko <robert.marko@sartura.hr>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Liao Chang <liaochang1@huawei.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 04/34] i2c: pxa: hide unused icr_bits[] variable
Date: Wed,  3 Apr 2024 10:06:22 +0200
Message-Id: <20240403080702.3509288-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
References: <20240403080702.3509288-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The function using this is hidden in an #ifdef, so the variable
needs the same one for a clean W=1 build:

drivers/i2c/busses/i2c-pxa.c:327:26: error: 'icr_bits' defined but not used [-Werror=unused-const-variable=]

Fixes: d6a7b5f84b5c ("[ARM] 4827/1: fix two warnings in drivers/i2c/busses/i2c-pxa.c")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/busses/i2c-pxa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 76f79b68cef8..888ca636f3f3 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -324,6 +324,7 @@ static void decode_ISR(unsigned int val)
 	decode_bits(KERN_DEBUG "ISR", isr_bits, ARRAY_SIZE(isr_bits), val);
 }
 
+#ifdef CONFIG_I2C_PXA_SLAVE
 static const struct bits icr_bits[] = {
 	PXA_BIT(ICR_START,  "START",	NULL),
 	PXA_BIT(ICR_STOP,   "STOP",	NULL),
@@ -342,7 +343,6 @@ static const struct bits icr_bits[] = {
 	PXA_BIT(ICR_UR,     "UR",		"ur"),
 };
 
-#ifdef CONFIG_I2C_PXA_SLAVE
 static void decode_ICR(unsigned int val)
 {
 	decode_bits(KERN_DEBUG "ICR", icr_bits, ARRAY_SIZE(icr_bits), val);
-- 
2.39.2


