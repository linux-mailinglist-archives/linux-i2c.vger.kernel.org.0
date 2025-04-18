Return-Path: <linux-i2c+bounces-10489-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F7CA93FE4
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 00:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 851037B09C8
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 22:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3793233128;
	Fri, 18 Apr 2025 22:36:16 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 4.mo583.mail-out.ovh.net (4.mo583.mail-out.ovh.net [178.33.111.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BA51E49F
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 22:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.111.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745015776; cv=none; b=CrqVQ0x84uTNw47UZC50BfP+dqc5bF5U0h1+9x3lVXv+H/woveip0rUlaNjnkbpCGPqKiVsSfpncwIo98sKn3nsybTseAqQCZ5/DORWH6SxTOzlLlhGQvMsLi2UQiGqXXz8TJ8CvtJu+MgWAL4fAGyN+miQjUPEhdaii0RhAKdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745015776; c=relaxed/simple;
	bh=K31VTDnAO0XegQP88s5PyhgwqoyK9gcD4n7fKhv+fhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b87QUI/Lc2WWnzZQ5F3LUnyAoqPih7nqzcWdJvh+Oev687+Gt9szVXZ6Q8ZxJP80jaW9gnOafcilCn6ujSDn94GuMN/ZufTAHTRjw8h4x+KJ8x02/2RPLlDxXmj0VWULUy561duiYUBduIFdlAVAO3cjtbw4XbcxGJQr+Igx3wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.33.111.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.25.2])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4ZfSJ93vG9z1SHd
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:16:57 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-vvf6g (unknown [10.110.188.251])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 385E21FE50;
	Fri, 18 Apr 2025 21:16:57 +0000 (UTC)
Received: from etezian.org ([37.59.142.95])
	by ghost-submission-5b5ff79f4f-vvf6g with ESMTPSA
	id fEQAAUnBAmjCTwEAlPG0AA
	(envelope-from <andi@etezian.org>); Fri, 18 Apr 2025 21:16:57 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-95G001a241a1fb-5cc7-4823-b462-e32fcbfb4b86,
                    9BBFD0B8C49B6260DDB62D1D32C292C5393E7E6E) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 06/10] i2c: iproc: Replace udelay() with usleep_range()
Date: Fri, 18 Apr 2025 23:16:31 +0200
Message-ID: <20250418211635.2666234-7-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418211635.2666234-1-andi.shyti@kernel.org>
References: <20250418211635.2666234-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13927663325296331335
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth

Replace udelay(100) with usleep_range(100, 200) as recommended
by kernel documentation. The delay is not in atomic context, so
busy-waiting is unnecessary.

Also update the comment for clarity.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 44083698121a..2e04ea157e8e 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -276,8 +276,8 @@ static void bcm_iproc_i2c_slave_init(
 		val |= BIT(CFG_RESET_SHIFT);
 		iproc_i2c_wr_reg(iproc_i2c, CFG_OFFSET, val);
 
-		/* wait 100 usec per spec */
-		udelay(100);
+		/* wait approximately 100 usec as per spec */
+		usleep_range(100, 200);
 
 		/* bring controller out of reset */
 		val &= ~(BIT(CFG_RESET_SHIFT));
@@ -687,8 +687,8 @@ static void bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *iproc_i2c)
 	val &= ~(BIT(CFG_EN_SHIFT));
 	iproc_i2c_wr_reg(iproc_i2c, CFG_OFFSET, val);
 
-	/* wait 100 usec per spec */
-	udelay(100);
+	/* wait approximately 100 usec as per spec */
+	usleep_range(100, 200);
 
 	/* bring controller out of reset */
 	val &= ~(BIT(CFG_RESET_SHIFT));
-- 
2.49.0


