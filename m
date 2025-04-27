Return-Path: <linux-i2c+bounces-10645-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B44A9E2BD
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 13:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1C5C7B00D8
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 11:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7232517A1;
	Sun, 27 Apr 2025 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfaV6dGI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A6249641;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745753466; cv=none; b=c2B139Oq4h7VEQVk0zQfWvx57CJGTMAQn/vYV9uNQAvF3vOIqrRKv2xM7jqGn4tQ8rnATHR0OyVnVvaZtMCLrEuTRhzC9UpITYMCPqJwwd8Z/gKk3D/XmngefOmrvotTqjUvoBPRZyXkBe18UUAEDXYPhkiNDySH2/y17jI++8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745753466; c=relaxed/simple;
	bh=jlJuPXHBo4V6kE+SAD+mznONPEWYXzJs3olM8EU6rcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BcDMlU1mUCAnyEokXs3HhxCCvL0YU7geIvh49arhRDpin/brn5HdLLBpMJXQ5Q9d2zKiOkJ4gQbx64S6HAJk1sfz6a3hmaKzV5+10zyxPOJ/m5bHhppl/KDBs1s7TzII+2DSCH7gxAhHTzeEjOE3DckkkUQAtALxN4EknQ0P5TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfaV6dGI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF2E5C4AF0C;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745753465;
	bh=jlJuPXHBo4V6kE+SAD+mznONPEWYXzJs3olM8EU6rcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qfaV6dGI2WDYnpHvfNWbbQPBT7ZfegJjbadpA2H4Cw2OdIzGpRNF3zSoG6w3TVYE1
	 kEgCj2kimyUIdFI4mMtgayVuwe1IA567FoRR7DOqlHQL0ct+Zc7jQSn8XiwbF/6Kwr
	 CUc62jd7aNVfx1NCXrSUZLib7BNx9cssTu3fv2ADWsuPTBydgHZuWhA3Ep7f4rzQHg
	 WLrQeMECdTmXwLSWD3wlcjy1BkDRR6FJ7330Qa2p00ciHHrsBnM/3oTG09BpPJQfRL
	 Ou5v1at6TS9MobPnlJwH4/g/E9LOYLHn/Xt5SIFOH4YIuG9RUT4B2qolUoIKuHER2Q
	 JL9Cc5CJjJeng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29C6C3ABA1;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sun, 27 Apr 2025 11:30:46 +0000
Subject: [PATCH v3 4/4] i2c: pasemi: Log bus reset causes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-pasemi-fixes-v3-4-af28568296c0@svenpeter.dev>
References: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
In-Reply-To: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=nRlmnXOqgPKLCOyL2YLd20qO5WoVbBnMs4FETTpxuT0=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQwafaNkZs3Xm+Uc2HqnaujX3wlmuf03pS3wKklQ7jgs8V
 BEKbgzuKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAEwkSoCRoe3lrfgzK9alnTzR
 d2rmUuMbDCpCXdXT70tf3vTUUX9q0yxGhlNHouR9UuSX7eNuUgib6ON3wELfcflEo8f23nPvry0
 9wAAA
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
 drivers/i2c/busses/i2c-pasemi-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index dad20ee0c6689eda309cb0374aa75b42669cbcdc..f4eca44ed18395331a366537bd06f2eb3ba08e21 100644
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
@@ -99,14 +100,18 @@ static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 				 USEC_PER_MSEC * PASEMI_TRANSFER_TIMEOUT_MS);
 
 	if (ret < 0) {
-		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
+		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x xfstatus 0x%08x)\n",
+			 status, reg_read(smbus, REG_XFSTA));
 		return -EIO;
 	}
 
 	/* If any badness happened or there is data in the FIFOs, reset the FIFOs */
 	if ((status & (SMSTA_MRNE | SMSTA_JMD | SMSTA_MTO | SMSTA_TOM | SMSTA_MTN | SMSTA_MTA)) ||
-	    !(status & SMSTA_MTE))
+	    !(status & SMSTA_MTE)) {
+		dev_warn(smbus->dev, "Issuing reset due to status 0x%08x (xfstatus 0x%08x)\n",
+			 status, reg_read(smbus, REG_XFSTA));
 		pasemi_reset(smbus);
+	}
 
 	/* Clear the flags */
 	reg_write(smbus, REG_SMSTA, status);

-- 
2.34.1



