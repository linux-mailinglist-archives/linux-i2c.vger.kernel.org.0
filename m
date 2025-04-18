Return-Path: <linux-i2c+bounces-10492-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24B4A940FA
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 04:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0D2116A9A0
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 02:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9613C47B;
	Sat, 19 Apr 2025 02:03:48 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 6.mo561.mail-out.ovh.net (6.mo561.mail-out.ovh.net [188.165.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B6AEC5
	for <linux-i2c@vger.kernel.org>; Sat, 19 Apr 2025 02:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.43.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745028228; cv=none; b=Jh8AABgKNz3vd53j+kze8iWSDARWyZ3grDGQlhL+XewEanIFvwPIDp9H16ZnM6VGU1Xvpgw1OUQb6cg64ZoE3PSInh2UWsOZ61j0kPJb4pgmqe/3vlnb8HShLubhARIpxTtMb/yd+vMh920oQHxY4okvPMh+qkdFYO6UZhFEjvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745028228; c=relaxed/simple;
	bh=ypuQ/ZVQFT7NATlvtANlGzlxCs5PL0XBGFqhgc4FAo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=di2uo/v+6z85YS7cCsYFDP5BgNuJah3j8+svzeW+pQgpMWMBqbyKSDgZkYHhOT63NgkOOjNW0Zdwd4Gr3A3RUVjflU4AzbQmOkJ+NI3iI5/77CwujXFXP/nr6PijoUFfvFdtRX7sJTcOMiLQGztb1fiXZIYpgQHpvFE64CfBlOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.43.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.140.151])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4ZfSJ70Slnz1Fvn
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:16:55 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-sf8bb (unknown [10.110.168.167])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C001B1FD38;
	Fri, 18 Apr 2025 21:16:54 +0000 (UTC)
Received: from etezian.org ([37.59.142.114])
	by ghost-submission-5b5ff79f4f-sf8bb with ESMTPSA
	id R7QJAUbBAmho8wMAoK3ocA
	(envelope-from <andi@etezian.org>); Fri, 18 Apr 2025 21:16:54 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-114S008022180de-bddb-4196-9a06-6b00d13a1dd3,
                    9BBFD0B8C49B6260DDB62D1D32C292C5393E7E6E) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 04/10] i2c: iproc: Fix alignment to match the open parenthesis
Date: Fri, 18 Apr 2025 23:16:29 +0200
Message-ID: <20250418211635.2666234-5-andi.shyti@kernel.org>
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
X-Ovh-Tracer-Id: 13927100375326853703
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrdduudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht

Alignment should match the open parenthesis but in some places it
didn't

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 3816ceb713d9..3e76120c23ab 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -833,7 +833,7 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i2c_dev *iproc_i2c,
  * The i2c quirks are set to enforce this rule.
  */
 static int bcm_iproc_i2c_xfer_internal(struct bcm_iproc_i2c_dev *iproc_i2c,
-					struct i2c_msg *msgs, bool process_call)
+				       struct i2c_msg *msgs, bool process_call)
 {
 	int i;
 	u8 addr;
@@ -1010,7 +1010,7 @@ static int bcm_iproc_i2c_cfg_speed(struct bcm_iproc_i2c_dev *iproc_i2c)
 				       "clock-frequency", &bus_speed);
 	if (ret < 0) {
 		dev_info(iproc_i2c->device,
-			"unable to interpret clock-frequency DT property\n");
+			 "unable to interpret clock-frequency DT property\n");
 		bus_speed = I2C_MAX_STANDARD_MODE_FREQ;
 	}
 
@@ -1099,9 +1099,8 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 
 	adap = &iproc_i2c->adapter;
 	i2c_set_adapdata(adap, iproc_i2c);
-	snprintf(adap->name, sizeof(adap->name),
-		"Broadcom iProc (%s)",
-		of_node_full_name(iproc_i2c->device->of_node));
+	snprintf(adap->name, sizeof(adap->name), "Broadcom iProc (%s)",
+		 of_node_full_name(iproc_i2c->device->of_node));
 	adap->algo = &bcm_iproc_algo;
 	adap->quirks = &bcm_iproc_i2c_quirks;
 	adap->dev.parent = &pdev->dev;
-- 
2.49.0


