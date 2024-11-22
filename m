Return-Path: <linux-i2c+bounces-8133-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD7E9D5A6C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 08:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE6121F23692
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 07:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFAA189F2D;
	Fri, 22 Nov 2024 07:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bawUzc2E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A8D18870F;
	Fri, 22 Nov 2024 07:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261935; cv=none; b=gG23PuoE71VPsrZv21UtgJ/0jQ1qqEL84Idfb7P2XLpnK32Yp1f6YhjxYNN9X1icmKhZnjbAUa1qhUStLc7qqDXV/PQBixtmgKYEE8gRAivdBg+GSXisxGiQMQa0+dWimybbvUXlUScuIArnqNfuS8Kd0db1NtuWzht72ReUB20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261935; c=relaxed/simple;
	bh=zdLs8PVFA8nwTP5e5idqeEFrdGWXZmjB84prpOFpVFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OsyUkpmnqBqDOAPPRd+5ecAkFoifKo5NoXWUPqqk/B3v8n0487zkmP0H0qtXNIna75PTP/BPQioBOWYlHONqUCw7JpW6aexaHPTfOgiV2pLgUDXRQN46lFox9tdx5oatBBEtIV3GaM+hONsXHqMvuL1VgjRbnMvUg4R5ZcSJP1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bawUzc2E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66FE8D21;
	Fri, 22 Nov 2024 08:51:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732261912;
	bh=zdLs8PVFA8nwTP5e5idqeEFrdGWXZmjB84prpOFpVFg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bawUzc2Ea8Ia+3mxhzmZc2w+i0AgSIBWF/XAlxEUXKOjnrbl13ma12gjOJKLTPB4A
	 HUmccpuAyQMHW3/dPRhvuaQ+aSGp5extbZ3QYFloBQmyHnV1bvLPJWJjiN7bMcLtzX
	 b/btIFlWoQwnDNR9vJ9BOEeGEBVeo3FLopHHu2Zs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 22 Nov 2024 09:51:38 +0200
Subject: [PATCH 1/3] i2c: atr: Allow unmapped addresses from nested ATRs
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-i2c-atr-fixes-v1-1-62c51ce790be@ideasonboard.com>
References: <20241122-i2c-atr-fixes-v1-0-62c51ce790be@ideasonboard.com>
In-Reply-To: <20241122-i2c-atr-fixes-v1-0-62c51ce790be@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Cosmin Tanislav <demonsingur@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=HZns0m7VGWUM2poqr19PsiIocfET85IMew+ehC1nFs8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnQDgoh7C2DqsJ9DrUeAw8s6qE5GfOFL71POEya
 yoJPYVTQNCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ0A4KAAKCRD6PaqMvJYe
 9aoZEACoSJLLipHnksJw6fyxHtjhUoPqsnNc6hwf5dOiZu51OIspA920l6OhKXBdIRf8stWiB7t
 6oXZZRLJgrnqlqmzEcIoV1sZ64RP9jlIEawoWWFicnWaQF/+Vwy5eL5gFBP7D1U5YU9vxgzh+MP
 qz797DizY+v589A8kndf8gp28s+juYigEE0UPyxTbCS6LpuTon1qdCc5y9NiH71piIOAe9IEyF6
 jMcJw04MtZYXgAsaisyjGiRNw9DxdiOQ0ceDa1WWJ+TxzwW09+kiaeV3Jk/rryAAqEbGTUfsItz
 GFqTyQaMcZUZDPfYTi2v0sJKAAvP6tWFZ81eO6OVKU6paFJ12305m/t7Di7KEL5Te95FZtM5LUh
 op/MNYFDTntKC+ecni7hyMttWIgktvOhW9Sbnt4NUzDcE74mUV+RbrhClNUYGYGxrQUlnYO80Cg
 +VUZ2eLR26Roi1s6MD9hB1SXqBN0+JDiuB5QXJykZrV4x05Ac5uKOOmkqLQGylWLMNBmSj3qGc2
 miC02bL7LtZEVnWF8TEaFasUh4sI4rHohNhXdpUGCcr+PLQKHl8GN9AniumLooiF/5lUoUt6knJ
 Tev7NLymab+/rhCCcMCnpM3PJ+Uln4+ppDmdgEdrqJSOR3gfmeFnIYiJQacz/A054UYwGU8ZDmE
 RQR3slyTOGeOuVg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Cosmin Tanislav <demonsingur@gmail.com>

i2c-atr translates the i2c transactions and forwards them to its parent
i2c bus. Any transaction to an i2c address that has not been mapped on
the i2c-atr will be rejected with an error.

However, if the parent i2c bus is another i2c-atr, the parent i2c-atr
gets a transaction to an i2c address that is not mapped in the parent
i2c-atr, and thus fails.

Relax the checks, and allow non-mapped transactions to fix this issue.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/i2c/i2c-atr.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index f21475ae5921..ef5adafa9bf4 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -134,7 +134,6 @@ i2c_atr_find_mapping_by_addr(const struct list_head *list, u16 phys_addr)
 static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 			    int num)
 {
-	struct i2c_atr *atr = chan->atr;
 	static struct i2c_atr_alias_pair *c2a;
 	int i;
 
@@ -157,15 +156,8 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 
 		c2a = i2c_atr_find_mapping_by_addr(&chan->alias_list,
 						   msgs[i].addr);
-		if (!c2a) {
-			dev_err(atr->dev, "client 0x%02x not mapped!\n",
-				msgs[i].addr);
-
-			while (i--)
-				msgs[i].addr = chan->orig_addrs[i];
-
-			return -ENXIO;
-		}
+		if (!c2a)
+			continue;
 
 		msgs[i].addr = c2a->alias;
 	}

-- 
2.43.0


