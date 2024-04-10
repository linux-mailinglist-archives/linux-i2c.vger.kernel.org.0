Return-Path: <linux-i2c+bounces-2858-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7EE89F0A5
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19CD9B21355
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A2815B577;
	Wed, 10 Apr 2024 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RRYk8cY9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE815B106
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748315; cv=none; b=i4tlxQmTJf/l1+rhPCdv+mbse6uGeEH8BvKI1cljadPef+PCxekZM+FXx1aaApzGDPt7D86KmO9JoiWCwVZ/uhgD4LN/xmxVmTxpilHaDuHOysAoN0fl7DhEVxihs+QPhiffHMlWOQltrAfWz/bFm6xcPIEkxv08XtwYyp8XAuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748315; c=relaxed/simple;
	bh=wluySLpxATwK5WykRORCd63slQvqphsUlCNn3aw7kJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qd8PVdDxZa1CarcyK2ON3mxtHUnzzSqT0+sTdKhquv/oGZ8KwxtOhX62yvocqa79LvQlDX+JOhqESpbbmuCvgWEpHoPqVNgsZcBqE/edYMBmzPR+elHzXKzgBBgFcSs+dCOAsnLgcn6ayrjdXUYb/boKQH6F8hIPMrWfoMm5Spo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RRYk8cY9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=fPQu434kXThfULnzqmFJ6qbKKgAHLHiDMKWRonVt0mI=; b=RRYk8c
	Y98o9opRGfncDNxc2SUmgucPbmi+sZZKCbIfbyfLYKGzlUOjqZGuMIak+k5U85mc
	XKKN+mpX5UxPPHx8JVtXiOF/zhH946SOYGLltYAzMF55+OGFj7MJwrhA2uF+1xKP
	WsckbvJzqJ9I2mSGATIzppZh4Dy6ePNS54i5THw6bStHXisPM+34m2caSMDy8mEO
	+uB8WkS5JieTGSQVQrgWjBgFKlDBKDm+xhtJegYC3Aa+3f9XxmYAO0/F8+SVx86b
	OyV+m2Icj99UzMFK6YCR8XoKGsutaYQoU1yIJbia+892zUlXvzTDVS1zCKX/T+hj
	n/qDdFZuGwMCEefQ==
Received: (qmail 521554 invoked from network); 10 Apr 2024 13:25:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:06 +0200
X-UD-Smtp-Session: l3s3148p1@KBRfSrwVDlptKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/18] i2c: img-scb: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:21 +0200
Message-ID: <20240410112418.6400-27-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C and SMBus timeouts are not something the user needs to be informed
about on controller level. The client driver may know if that really is
a problem and give more detailed information to the user. The controller
should just pass this information upwards. Remove the printout and
simplify the logic a little.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-img-scb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index f9d4bfef511c..e0e87185f6bb 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1124,11 +1124,8 @@ static int img_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 						      IMG_I2C_TIMEOUT);
 		del_timer_sync(&i2c->check_timer);
 
-		if (time_left == 0) {
-			dev_err(adap->dev.parent, "i2c transfer timed out\n");
+		if (time_left == 0)
 			i2c->msg_status = -ETIMEDOUT;
-			break;
-		}
 
 		if (i2c->msg_status)
 			break;
-- 
2.43.0


