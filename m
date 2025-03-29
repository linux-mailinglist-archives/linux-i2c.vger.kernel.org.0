Return-Path: <linux-i2c+bounces-10067-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBD1A756BF
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Mar 2025 15:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34FEE18933A8
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Mar 2025 14:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1C51D63E8;
	Sat, 29 Mar 2025 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="HYJUWp1I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E119326AEC;
	Sat, 29 Mar 2025 14:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743259107; cv=none; b=O+7P/MGDIwyHUQZY1XUIy7XTnzjWY5/ImTFpNQ0Q2zdHurnwCrCnuVzMOgER514xZMmiVAuuj97n28by14QFqxhB+RAjKZpIexgiI+PmIgO+9kH+kTV+OShJwpUkvEA7UGmSAjmdesANDzVMYMCWYVI+v53ZLTUTwgxgsijvy4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743259107; c=relaxed/simple;
	bh=l+dHcMyev7aJ/DOR2Dral9svlyRLsrbruZjTLse9CBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JrYfoDcq9P1EAgHmAiAnM9PXsNKpB4TAfaHwphcmbaVGlYuubQtEcegs0W2nvGMDJkmT8sCby+XkHbLzO6SqE6eBZwiY5pieLif2L+mSX67auwWOiSH/3R/WaIu3JCm34BjyFrIILpxC28KSDDUifI6GzO9yFvw8a2uURSTg2h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=HYJUWp1I; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id yXJ9tDUS38XbxyXJCt8j6b; Sat, 29 Mar 2025 15:37:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743259035;
	bh=jNo5sigsMldVErhuF43kHZ10y6ehCb/yTyOsz8Q29KI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=HYJUWp1IiRVUImtTcz4xpyR5HquyI7Yy6mqzQ2kJKjlUzbNTJnzVageYfxiCfWGqz
	 ziJoya6pu3lLcWQpZb3NBBqMzHI+hoy5qWn7hs1rIkTgdlhLJdDc0R9PK6r5LumU4t
	 BY7GV3BtibcsKMREyGNQq/uysb6LJQZJ/fpsoC4uv6LOpkfqKs8V4LfC2zwVA0z7Bv
	 Q4YICI33Zcj+SMJT65CQ2Y0zcyTms4tjmlnl5ev9Q1/lRHfTPOybjYpD8mkurndXM7
	 zjF0fO2+Vu13E2Q87AJZzCSJ5D+vF/yzjoayrt4XiJ1wnkoCFfVrcOfqiPxrPvirQ7
	 VvEvBURtuiNpg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Mar 2025 15:37:15 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] i2c: rzv2m: Constify struct i2c_algorithm
Date: Sat, 29 Mar 2025 15:37:07 +0100
Message-ID: <537d93441ced53bffa6553b8ec93d007e64cb9a5.1743258995.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct i2c_algorithm' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  11027	    646	     16	  11689	   2da9	drivers/i2c/busses/i2c-rzv2m.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  11107	    566	     16	  11689	   2da9	drivers/i2c/busses/i2c-rzv2m.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/i2c/busses/i2c-rzv2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index 53762cc56d28..b0e9c0b62429 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -402,7 +402,7 @@ static const struct i2c_adapter_quirks rzv2m_i2c_quirks = {
 	.flags = I2C_AQ_NO_ZERO_LEN,
 };
 
-static struct i2c_algorithm rzv2m_i2c_algo = {
+static const struct i2c_algorithm rzv2m_i2c_algo = {
 	.xfer = rzv2m_i2c_xfer,
 	.functionality = rzv2m_i2c_func,
 };
-- 
2.49.0


