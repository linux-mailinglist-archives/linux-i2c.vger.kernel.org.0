Return-Path: <linux-i2c+bounces-10493-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF072A94177
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 05:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02C0A445367
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 03:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96EA137C37;
	Sat, 19 Apr 2025 03:41:48 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 9.mo581.mail-out.ovh.net (9.mo581.mail-out.ovh.net [46.105.60.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86593145A03
	for <linux-i2c@vger.kernel.org>; Sat, 19 Apr 2025 03:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.60.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745034108; cv=none; b=utiqHbxDYlf0kYi+ATCm+t/Jng5F9MHeAWdPKevhPO/F5GY+BjIlmJHnEy4QCRy58qme1HT/hDsSf/hB/boRf5oPzmCb0EClzfLROdACxhM/ZTDg9x9KJmAClJE+I+3qVpAIM6y370+v2FETG+bMhyqkCZ60FnqKc+7WJnx2DVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745034108; c=relaxed/simple;
	bh=DOXOrP2nRFCXtvEvIGwGCHE78KHBPhafL4nGQYJGnls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUINyy4P5HJxPc3NQ4TH1jzfnVFP0hV3HnNHl2PKBFjK4nIH0rvT8uF+bvVlZLKv7c+cahf2JfDXTVkSeMDzJa9xsCnLfJOL2XCSClmDAcUWg1oOy8f4mJ+4mjnsv46s5mK/jmjeggBdXVZrNBxh+Dd3PC9dhle38RMamSZjcXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.60.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.17.245])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4ZfSJ30YFLz1FMk
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:16:51 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-jhwpg (unknown [10.110.188.223])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 944661FE0C;
	Fri, 18 Apr 2025 21:16:49 +0000 (UTC)
Received: from etezian.org ([37.59.142.104])
	by ghost-submission-5b5ff79f4f-jhwpg with ESMTPSA
	id g9HgF0HBAmj6UzIAUW6moQ
	(envelope-from <andi@etezian.org>); Fri, 18 Apr 2025 21:16:49 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-104R0057ca26847-bf46-4a74-afa9-9db2bcc4f3e3,
                    9BBFD0B8C49B6260DDB62D1D32C292C5393E7E6E) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 01/10] i2c: iproc: Drop unnecessary initialisation of 'ret'
Date: Fri, 18 Apr 2025 23:16:26 +0200
Message-ID: <20250418211635.2666234-2-andi.shyti@kernel.org>
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
X-Ovh-Tracer-Id: 13925974475960420935
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedumgdpmhhouggvpehsmhhtphhouhht

The 'ret' variable doesn't need to be initialised, as it is
always assigned before use.

While here, reorder the variable declarations in reverse
Christmas tree style, by line length.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 332a0fcca28d..5d846ab91e6f 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1039,9 +1039,9 @@ static int bcm_iproc_i2c_cfg_speed(struct bcm_iproc_i2c_dev *iproc_i2c)
 
 static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 {
-	int irq, ret = 0;
 	struct bcm_iproc_i2c_dev *iproc_i2c;
 	struct i2c_adapter *adap;
+	int irq, ret;
 
 	iproc_i2c = devm_kzalloc(&pdev->dev, sizeof(*iproc_i2c),
 				 GFP_KERNEL);
-- 
2.49.0


