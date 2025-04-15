Return-Path: <linux-i2c+bounces-10358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA81BA8A2F6
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 17:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F471189A069
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 15:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7599A29E055;
	Tue, 15 Apr 2025 15:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzJSNSwW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED62929B78E;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731438; cv=none; b=BAevm+kiHn5ugYgMeq27MnOffNZjxmcjb3cZWpTLSlRg35NpzjugzY/iMcwC0MuRPAb8P3pS3C+ZQE+DQ3KP1lSsx09/U0aLysD5DG21yj9Ic2zr0wgAEyd6wPEJGUs8URM5A3yMLVnIP+i/rPeEQ3IwLBo6jwFqEIpPnhbt3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731438; c=relaxed/simple;
	bh=BXUeJzaOPu6wdBqkrzRH/yMdh5em9BF7TrNPfXAEkdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gChEOZkETjNkFk0fFHXzak4GPJkXBLIBCrBDWzAnQvJ9IgAI7xBNJYXqR22qFUo3BBVqMHmh/P5imjw8nvqbsKVlRQA8W/OyW5a9BJvnghizCR0KvoNV4YA7rZQswWj5hAIRxJ3EAy2TYnjNqrbLlqcbMCX99U0UncyllQt/204=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzJSNSwW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89651C4CEF5;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=BXUeJzaOPu6wdBqkrzRH/yMdh5em9BF7TrNPfXAEkdo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JzJSNSwW1P5Il90YgnnI/8kNQAi/MxhGxCnW4IJvmxBzldDz2BxVdp6eFk/VfZkoN
	 0VCZSNOPkpx9267K5Qm/v+ydkhNxlP02vtdxLC/T9tOMbqnbjF7O7LvZVoFM5kssWR
	 gSxDIEVZrhrQqBl0Fdo0nKvGFwIgFS4DkuhIEvPa2jpLoG6I/dIgYQjiK/8PWHEP0q
	 txdISMHQyZ2PK42lt3c3jKdAWRupthIZPbEvlZLQLqbXHL5TnunV6oBqhQO+Ro1pfR
	 7BskaEU0gQHEzcd+qjBJLZlC2/c9V4LdbH8lfVHfFfM5JcND2y9uRoOEl5wnNI8SJt
	 vjMEveyFIGojg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA63C369BA;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:37:00 +0000
Subject: [PATCH v2 6/6] i2c: pasemi: Log bus reset causes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-pasemi-fixes-v2-6-c543bf53151a@svenpeter.dev>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=VA1WhVX4Izvudq5u7eRf2fGXelyMPNY/3NDm2fN5raU=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/Wq19l7xza3jP7jSI+u++w+7L/V2srnF6Fyb/Wj4xQ
 Wxp+pKOjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEtjEzMtx+KuJdcOrOkUlJ
 rxm8+9rvPi4Wl21gUd+fq73jnISu6A5GhlebAySynZqu/S4pmjq5XUPuoEygj/TT0tth2o+mXug
 S5AcA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

From: Hector Martin <marcan@marcan.st>

This ensures we get all information we need to debug issues when users
forward us their logs.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 41db38d82fe62c73614b8fafe4cb73c7d1a24762..e5e8a748638f02e48d6ffa65e49aff5b12f70e06 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -22,6 +22,7 @@
 /* Register offsets */
 #define REG_MTXFIFO	0x00
 #define REG_MRXFIFO	0x04
+#define REG_XFSTA	0x0c
 #define REG_SMSTA	0x14
 #define REG_IMASK	0x18
 #define REG_CTL		0x1c
@@ -89,7 +90,7 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
 
 static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 {
-	unsigned int status;
+	unsigned int status, xfstatus;
 	int ret;
 
 	/* First wait for the bus to go idle */
@@ -98,7 +99,9 @@ static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 				 USEC_PER_MSEC, USEC_PER_MSEC * TRANSFER_TIMEOUT_MS);
 
 	if (ret < 0) {
-		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
+		xfstatus = reg_read(smbus, REG_XFSTA);
+		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x xfstatus 0x%08x)\n",
+			 status, xfstatus);
 		return -EIO;
 	}
 

-- 
2.34.1



