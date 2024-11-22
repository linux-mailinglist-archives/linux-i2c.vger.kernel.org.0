Return-Path: <linux-i2c+bounces-8147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6EB9D5EC6
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 13:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC552B238D3
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 12:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF471DF26B;
	Fri, 22 Nov 2024 12:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gxB8u4cn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE08D1DEFFC;
	Fri, 22 Nov 2024 12:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732278410; cv=none; b=o7huiODLWwjMIlR7FCeHBla5NAc86MIoXqA2zx4OkzQPQDt+lcwJSYXCBcdDPKkl61GiYOLwgJQa1w8tgLSwZDRff/N4dhLXZl5FHUDNEJxZrhSOJBCCN3GsF33okLQmhOJxS+MyqhXOF2kdnIyZMy5+REQOKnr8Y1bwJvTnodk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732278410; c=relaxed/simple;
	bh=ICSEOmhPSZjLbOs4oxaiQvH9D5GLTmMQE562uybfqzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pOxAX5u+yiT1omuTznefJoDE6p6NxsEwvLkOe/IynP3Vxtal12pVJhKlJIEAoKOMHAwmfh1YEiRxp2+UpGA38T9GLqdJbt5sml1sfCAKXgMtib0sj7NC4Bracy1U5gKWF1MAV4qbUTKEaeaFzWN1IU8gQyx4pfhprboDzgcWFTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gxB8u4cn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B414101F;
	Fri, 22 Nov 2024 13:26:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732278379;
	bh=ICSEOmhPSZjLbOs4oxaiQvH9D5GLTmMQE562uybfqzk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gxB8u4cn4qfiUDS3KtFR4Rt/PS9Y9/4A3I7Ooj2wz2g80AGdD8KRIJsJyZBmuvkZ4
	 KhM9q4KGA4wh6zXvj54tEC1Lh3fno4f/iPztmP0JcS2uHAE9uM32HS7pRI69BafrbV
	 P45fZP3MgGrM8sMZB7P2HUCivmreqnzBWSiUHce4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 22 Nov 2024 14:26:19 +0200
Subject: [PATCH v2 2/3] i2c: atr: Allow unmapped addresses from nested ATRs
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
In-Reply-To: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
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
 bh=pXFLI6X0qHwsjsvLE/+JPZIB/MJ2LwUgdQ+3wZYmRUk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnQHh8M5RpoDOug8rs0JBUmtbouXRkHI+uOXiGm
 fG8FxArVlyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ0B4fAAKCRD6PaqMvJYe
 9bzWD/9XdJ11pOC31tqRZsLOxP82GXUtSbMsFe49Ouv4uAxfWMvGuVTxIoe6SMfSO6lzA0wA5p3
 og62cyC88SJCU5e5HfD3io6MDzi9X3Kp+XcsNNcB1OQ4huZ+fvf/QP6GvHuMwpJcS6zqlcvf7WE
 b9PxniwX2TBzmOYIfAljmUWIevujkdC0nLkjdElkoGoB7Q331G0217Cb/ez4lXDlxE1Z5duCC/T
 gsJeK8ZDiQeH0hBrxS3RzEQ6niyRrLS2+q73kehQilZ0o3CYNYuXf/AfMBSdHc5RpcZVUrS7y5h
 MwsPDIoEZNCfRJI9uBgddP9abM4DzVZD/pc09OaJ79t/rnd8TN/yt+yGsbQtUd2KLQ5uqJqZqex
 zzauUO1TNEMSM/cjcGPitKJs8KOgpXRfYp/Ca6VmPsraD1y7/L9t/ICjWoz/NjW4vJplZ7xEkmP
 6uA8EyBtdepvkxJz5+3gPZFcfRlp8SR59HqM7IU8NPdqxk9Kw3AYcL1PyKvNf7xP0w31lkp8KgD
 24mJLwQzSIVStn6iloBsx/AdamwNsjGWExRWUXH8W1zx6vu8FvrPLxM/DDh5LMO8kZ0csb1/Sg7
 QSUe4Lwc4d+juMI062gJXtot0vQiJTJq2IpBXUWdw1iYv2erDih5LJ+dHZHie7Sy8FQu7HlemBx
 wGQHyTt9oFsemJg==
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
index 0d54d0b5e327..5adb720af84e 100644
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


