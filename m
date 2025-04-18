Return-Path: <linux-i2c+bounces-10488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE76A93F95
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 23:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A624B17840E
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 21:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D50E21171F;
	Fri, 18 Apr 2025 21:54:00 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 4.mo575.mail-out.ovh.net (4.mo575.mail-out.ovh.net [46.105.59.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AC81B6CE0
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.59.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745013240; cv=none; b=rYJPBoPgO8FlR1SFzdmw1G7FDl4kLhItgGDD+vFMi9We6BpeoEoiRwhDyEKUBOQ+l2PnWciSEAwPF0ZeuUQMf26wjc09AwnGWetJhvMZp2S9UCGSQvJ7FW9irlxrBekdF/UIg+zFWVgdZlyQNbFN1HmcYztLnC9hrfUm13RvmXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745013240; c=relaxed/simple;
	bh=TLZPBrBmg9iyGe7OJXTmYOUOYGebh+kY+OAKXk68CDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AK0Xyn9W/+bmNXyzNk73zif1rRiMPy/b0yu9Dpfdh39FKnyCWyqgcGimijAU0vjK06CaiNNaDDh18/dUAog4CJx2i4FUXzKzUwaGjFJ2dz5BCh9JfISfE71vrkjtGhu+o6IXSuOCIP56wgKAuLn4OJJUkYq3Ga2tH1euFzNiUQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.59.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.2.55])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4ZfSJD4yp8z1nvf
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:17:00 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-wtzwn (unknown [10.110.168.38])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6EDB31FDCE;
	Fri, 18 Apr 2025 21:17:00 +0000 (UTC)
Received: from etezian.org ([37.59.142.96])
	by ghost-submission-5b5ff79f4f-wtzwn with ESMTPSA
	id z3aTE0zBAmge9wMArzU8bQ
	(envelope-from <andi@etezian.org>); Fri, 18 Apr 2025 21:17:00 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-96R001abac3a2a-a598-4fc0-aafe-661099c1a667,
                    9BBFD0B8C49B6260DDB62D1D32C292C5393E7E6E) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 10/10] i2c: iproc: Remove unnecessary double negation
Date: Fri, 18 Apr 2025 23:16:35 +0200
Message-ID: <20250418211635.2666234-11-andi.shyti@kernel.org>
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
X-Ovh-Tracer-Id: 13928507748792601159
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhegmpdhmohguvgepshhmthhpohhuth

True is true when greater than '0', no need for double negation
inside the if statement.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 9356a16422a3..2d117f242875 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -836,8 +836,8 @@ static int bcm_iproc_i2c_xfer_internal(struct bcm_iproc_i2c_dev *iproc_i2c,
 	struct i2c_msg *msg = &msgs[0];
 
 	/* check if bus is busy */
-	if (!!(iproc_i2c_rd_reg(iproc_i2c,
-				M_CMD_OFFSET) & BIT(M_CMD_START_BUSY_SHIFT))) {
+	if (iproc_i2c_rd_reg(iproc_i2c,
+			     M_CMD_OFFSET) & BIT(M_CMD_START_BUSY_SHIFT)) {
 		dev_warn(iproc_i2c->device, "bus is busy\n");
 		return -EBUSY;
 	}
-- 
2.49.0


